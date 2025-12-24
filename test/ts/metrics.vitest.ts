/**
 * Tests for metrics.ts
 *
 * Tests comprehensive metrics collection including latency histograms,
 * worker utilization, queue depths, and error rates.
 */

import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest';
import { MetricsCollector, PoolMetrics } from '../../src/ts/core/metrics';

describe('MetricsCollector', () => {
  let collector: MetricsCollector;

  beforeEach(() => {
    collector = new MetricsCollector();
  });

  afterEach(() => {
    collector.stop();
  });

  describe('construction', () => {
    it('should create with default options', () => {
      const c = new MetricsCollector();
      expect(c).toBeDefined();
      c.stop();
    });

    it('should create with custom buckets', () => {
      const c = new MetricsCollector({ buckets: [10, 50, 100, 500] });
      const metrics = c.getMetrics();
      expect(metrics.taskLatency.buckets.length).toBe(4);
      c.stop();
    });

    it('should create with custom max recent errors', () => {
      const c = new MetricsCollector({ maxRecentErrors: 50 });
      expect(c).toBeDefined();
      c.stop();
    });

    it('should create with custom rate window', () => {
      const c = new MetricsCollector({ rateWindow: 30000 });
      expect(c).toBeDefined();
      c.stop();
    });

    it('should create with export callback', () => {
      const onExport = vi.fn();
      const c = new MetricsCollector({ onExport, exportInterval: 100 });
      expect(c).toBeDefined();
      c.stop();
    });
  });

  describe('recordTaskComplete', () => {
    it('should record task completion', () => {
      collector.recordTaskComplete(0, 50);
      const metrics = collector.getMetrics();
      expect(metrics.taskLatency.count).toBe(1);
      expect(metrics.taskLatency.sum).toBe(50);
      expect(metrics.taskLatency.min).toBe(50);
      expect(metrics.taskLatency.max).toBe(50);
    });

    it('should track min and max latency', () => {
      collector.recordTaskComplete(0, 10);
      collector.recordTaskComplete(0, 100);
      collector.recordTaskComplete(0, 50);

      const metrics = collector.getMetrics();
      expect(metrics.taskLatency.min).toBe(10);
      expect(metrics.taskLatency.max).toBe(100);
    });

    it('should populate histogram buckets', () => {
      // Default buckets: [1, 5, 10, 25, 50, 100, 250, 500, 1000, 2500, 5000, 10000]
      collector.recordTaskComplete(0, 3);   // bucket 5ms
      collector.recordTaskComplete(0, 30);  // bucket 50ms
      collector.recordTaskComplete(0, 200); // bucket 250ms

      const metrics = collector.getMetrics();
      const bucketCounts = metrics.taskLatency.buckets.map(b => b.count);
      expect(bucketCounts.some(c => c > 0)).toBe(true);
    });

    it('should update worker metrics', () => {
      collector.registerWorker(0);
      collector.recordTaskComplete(0, 50);

      const metrics = collector.getMetrics();
      const worker = metrics.workers.find(w => w.workerId === 0);
      expect(worker?.tasksCompleted).toBe(1);
    });
  });

  describe('recordTaskFailed', () => {
    it('should record task failure', () => {
      const error = new Error('test error');
      collector.recordTaskFailed(0, error);

      const metrics = collector.getMetrics();
      expect(metrics.errors.total).toBe(1);
      expect(metrics.errors.byType.get('Error')).toBe(1);
    });

    it('should track error types', () => {
      const typeError = new TypeError('type error');
      const rangeError = new RangeError('range error');

      collector.recordTaskFailed(0, typeError);
      collector.recordTaskFailed(0, typeError);
      collector.recordTaskFailed(0, rangeError);

      const metrics = collector.getMetrics();
      expect(metrics.errors.byType.get('TypeError')).toBe(2);
      expect(metrics.errors.byType.get('RangeError')).toBe(1);
    });

    it('should store recent errors', () => {
      const error = new Error('recent error');
      collector.recordTaskFailed(0, error);

      const metrics = collector.getMetrics();
      expect(metrics.errors.recent.length).toBe(1);
      expect(metrics.errors.recent[0].message).toBe('recent error');
      expect(metrics.errors.recent[0].type).toBe('Error');
    });

    it('should update worker failed count', () => {
      collector.registerWorker(0);
      collector.recordTaskFailed(0, new Error('test'));

      const metrics = collector.getMetrics();
      const worker = metrics.workers.find(w => w.workerId === 0);
      expect(worker?.tasksFailed).toBe(1);
    });

    it('should record duration if provided', () => {
      collector.recordTaskFailed(0, new Error('test'), 100);

      const metrics = collector.getMetrics();
      expect(metrics.taskLatency.count).toBe(1);
      expect(metrics.taskLatency.sum).toBe(100);
    });
  });

  describe('queue metrics', () => {
    it('should track enqueue', () => {
      collector.recordTaskEnqueued();
      collector.recordTaskEnqueued();
      collector.recordTaskEnqueued();

      const metrics = collector.getMetrics();
      expect(metrics.queue.depth).toBe(3);
      expect(metrics.queue.totalEnqueued).toBe(3);
    });

    it('should track peak queue depth', () => {
      collector.recordTaskEnqueued();
      collector.recordTaskEnqueued();
      collector.recordTaskEnqueued();
      collector.recordTaskDequeued(10);
      collector.recordTaskDequeued(10);

      const metrics = collector.getMetrics();
      expect(metrics.queue.depth).toBe(1);
      expect(metrics.queue.peakDepth).toBe(3);
    });

    it('should track dequeue and wait time', () => {
      collector.recordTaskEnqueued();
      collector.recordTaskDequeued(50);

      const metrics = collector.getMetrics();
      expect(metrics.queue.depth).toBe(0);
      expect(metrics.queue.totalDequeued).toBe(1);
      expect(metrics.queue.avgWaitTime).toBe(50);
    });

    it('should not go below zero depth', () => {
      collector.recordTaskDequeued(10);
      collector.recordTaskDequeued(10);

      const metrics = collector.getMetrics();
      expect(metrics.queue.depth).toBe(0);
    });
  });

  describe('worker tracking', () => {
    it('should register workers', () => {
      collector.registerWorker(0);
      collector.registerWorker(1);
      collector.registerWorker(2);

      const metrics = collector.getMetrics();
      expect(metrics.workers.length).toBe(3);
    });

    it('should unregister workers', () => {
      collector.registerWorker(0);
      collector.registerWorker(1);
      collector.unregisterWorker(0);

      const metrics = collector.getMetrics();
      expect(metrics.workers.length).toBe(1);
      expect(metrics.workers[0].workerId).toBe(1);
    });

    it('should track worker busy/idle state', () => {
      collector.registerWorker(0);
      collector.recordWorkerBusy(0);

      let metrics = collector.getMetrics();
      let worker = metrics.workers.find(w => w.workerId === 0);
      expect(worker?.state).toBe('busy');

      collector.recordWorkerIdle(0);
      metrics = collector.getMetrics();
      worker = metrics.workers.find(w => w.workerId === 0);
      expect(worker?.state).toBe('ready');
    });

    it('should calculate utilization', async () => {
      collector.registerWorker(0);
      collector.recordWorkerBusy(0);

      // Wait a bit
      await new Promise(r => setTimeout(r, 50));

      collector.recordWorkerIdle(0);

      const metrics = collector.getMetrics();
      const worker = metrics.workers.find(w => w.workerId === 0);
      expect(worker?.utilization).toBeGreaterThan(0);
    });
  });

  describe('summary statistics', () => {
    it('should calculate average latency', () => {
      collector.recordTaskComplete(0, 10);
      collector.recordTaskComplete(0, 20);
      collector.recordTaskComplete(0, 30);

      const metrics = collector.getMetrics();
      expect(metrics.summary.avgLatency).toBe(20);
    });

    it('should count busy and idle workers', () => {
      collector.registerWorker(0);
      collector.registerWorker(1);
      collector.registerWorker(2);
      collector.recordWorkerBusy(0);
      collector.recordWorkerBusy(1);

      const metrics = collector.getMetrics();
      expect(metrics.summary.totalWorkers).toBe(3);
      expect(metrics.summary.busyWorkers).toBe(2);
      expect(metrics.summary.idleWorkers).toBe(1);
    });

    it('should calculate error rate', () => {
      collector.recordTaskComplete(0, 10);
      collector.recordTaskComplete(0, 10);
      collector.recordTaskComplete(0, 10);
      collector.recordTaskFailed(0, new Error('test'));

      const metrics = collector.getMetrics();
      // 1 error out of 4 tasks = 25%
      expect(metrics.summary.errorRate).toBeCloseTo(0.25);
    });

    it('should calculate percentiles', () => {
      // Add many latency samples
      for (let i = 1; i <= 100; i++) {
        collector.recordTaskComplete(0, i);
      }

      const metrics = collector.getMetrics();
      expect(metrics.summary.p50Latency).toBeGreaterThan(0);
      expect(metrics.summary.p95Latency).toBeGreaterThan(metrics.summary.p50Latency);
      expect(metrics.summary.p99Latency).toBeGreaterThanOrEqual(metrics.summary.p95Latency);
    });

    it('should handle empty metrics gracefully', () => {
      const metrics = collector.getMetrics();
      expect(metrics.summary.avgLatency).toBe(0);
      expect(metrics.summary.p50Latency).toBe(0);
      expect(metrics.summary.errorRate).toBe(0);
    });
  });

  describe('reset', () => {
    it('should reset all metrics', () => {
      collector.recordTaskComplete(0, 50);
      collector.recordTaskFailed(0, new Error('test'));
      collector.recordTaskEnqueued();
      collector.registerWorker(0);

      collector.reset();

      const metrics = collector.getMetrics();
      expect(metrics.taskLatency.count).toBe(0);
      expect(metrics.errors.total).toBe(0);
      expect(metrics.queue.totalEnqueued).toBe(0);
      expect(metrics.workers.length).toBe(0);
    });
  });

  describe('stop', () => {
    it('should stop export timer', () => {
      const onExport = vi.fn();
      const c = new MetricsCollector({ onExport, exportInterval: 50 });
      c.stop();

      // Wait to ensure no more exports happen
      return new Promise<void>((resolve) => {
        setTimeout(() => {
          expect(onExport).not.toHaveBeenCalled();
          resolve();
        }, 100);
      });
    });
  });

  describe('export callback', () => {
    it('should call export callback at interval', async () => {
      const onExport = vi.fn();
      const c = new MetricsCollector({ onExport, exportInterval: 50 });

      await new Promise(r => setTimeout(r, 120));

      c.stop();
      expect(onExport).toHaveBeenCalled();
    });

    it('should pass metrics to export callback', async () => {
      let capturedMetrics: PoolMetrics | null = null;
      const onExport = (m: PoolMetrics) => {
        capturedMetrics = m;
      };

      const c = new MetricsCollector({ onExport, exportInterval: 50 });
      c.recordTaskComplete(0, 100);

      await new Promise(r => setTimeout(r, 70));

      c.stop();
      expect(capturedMetrics).not.toBeNull();
      expect(capturedMetrics!.taskLatency.count).toBe(1);
    });
  });

  describe('histogram buckets', () => {
    it('should use default buckets', () => {
      const metrics = collector.getMetrics();
      expect(metrics.taskLatency.buckets.length).toBe(12);
      expect(metrics.taskLatency.buckets[0].le).toBe(1);
      expect(metrics.taskLatency.buckets[11].le).toBe(10000);
    });

    it('should use custom buckets', () => {
      const c = new MetricsCollector({ buckets: [5, 10, 50] });
      const metrics = c.getMetrics();
      expect(metrics.taskLatency.buckets.length).toBe(3);
      expect(metrics.taskLatency.buckets[0].le).toBe(5);
      expect(metrics.taskLatency.buckets[2].le).toBe(50);
      c.stop();
    });

    it('should correctly bucket values', () => {
      const c = new MetricsCollector({ buckets: [10, 50, 100] });

      c.recordTaskComplete(0, 5);  // <= 10
      c.recordTaskComplete(0, 25); // <= 50
      c.recordTaskComplete(0, 75); // <= 100
      c.recordTaskComplete(0, 150); // > 100 (overflow bucket)

      const metrics = c.getMetrics();
      expect(metrics.taskLatency.buckets[0].count).toBe(1); // <= 10
      expect(metrics.taskLatency.buckets[1].count).toBe(1); // <= 50
      expect(metrics.taskLatency.buckets[2].count).toBe(1); // <= 100

      c.stop();
    });
  });

  describe('getMetrics', () => {
    it('should return timestamp', () => {
      const before = Date.now();
      const metrics = collector.getMetrics();
      const after = Date.now();

      expect(metrics.timestamp).toBeGreaterThanOrEqual(before);
      expect(metrics.timestamp).toBeLessThanOrEqual(after);
    });

    it('should return complete metrics structure', () => {
      const metrics = collector.getMetrics();

      expect(metrics).toHaveProperty('timestamp');
      expect(metrics).toHaveProperty('taskLatency');
      expect(metrics).toHaveProperty('workers');
      expect(metrics).toHaveProperty('queue');
      expect(metrics).toHaveProperty('errors');
      expect(metrics).toHaveProperty('summary');

      expect(metrics.taskLatency).toHaveProperty('count');
      expect(metrics.taskLatency).toHaveProperty('sum');
      expect(metrics.taskLatency).toHaveProperty('min');
      expect(metrics.taskLatency).toHaveProperty('max');
      expect(metrics.taskLatency).toHaveProperty('buckets');

      expect(metrics.queue).toHaveProperty('depth');
      expect(metrics.queue).toHaveProperty('peakDepth');
      expect(metrics.queue).toHaveProperty('avgWaitTime');

      expect(metrics.errors).toHaveProperty('total');
      expect(metrics.errors).toHaveProperty('byType');
      expect(metrics.errors).toHaveProperty('recent');

      expect(metrics.summary).toHaveProperty('totalWorkers');
      expect(metrics.summary).toHaveProperty('busyWorkers');
      expect(metrics.summary).toHaveProperty('idleWorkers');
      expect(metrics.summary).toHaveProperty('tasksPerSecond');
      expect(metrics.summary).toHaveProperty('avgLatency');
      expect(metrics.summary).toHaveProperty('p50Latency');
      expect(metrics.summary).toHaveProperty('p95Latency');
      expect(metrics.summary).toHaveProperty('p99Latency');
      expect(metrics.summary).toHaveProperty('errorRate');
    });
  });
});
