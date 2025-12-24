/**
 * Tests for batch-executor.ts
 *
 * Tests batch execution with concurrency control, pause/resume, cancellation,
 * and progress reporting.
 */

import { describe, it, expect } from 'vitest';
import {
  createBatchExecutor,
  createMapExecutor,
  executeBatchSimple,
  TaskExecutor,
} from '../../src/ts/core/batch-executor';
import type { BatchTask, BatchProgress } from '../../src/ts/types';

// Simple sync executor for basic tests
function simpleSyncExecutor<T>(method: string | Function, params: unknown[]): Promise<T> {
  if (typeof method === 'function') {
    return Promise.resolve(method(...params));
  }
  return Promise.resolve(params[0] as T);
}

// Async executor with configurable delay
function createDelayExecutor<T>(delay: number): TaskExecutor<T> {
  return async (_method, params) => {
    await new Promise(r => setTimeout(r, delay));
    return params[0] as T;
  };
}

describe('createBatchExecutor', () => {
  describe('basic execution', () => {
    it('should execute empty batch', async () => {
      const result = await createBatchExecutor([], simpleSyncExecutor);

      expect(result.results).toEqual([]);
      expect(result.successes).toEqual([]);
      expect(result.failures).toEqual([]);
      expect(result.successCount).toBe(0);
      expect(result.failureCount).toBe(0);
      expect(result.allSucceeded).toBe(true);
      expect(result.cancelled).toBe(false);
    });

    it('should execute single task', async () => {
      const tasks: BatchTask[] = [{ method: 'test', params: [42] }];
      const result = await createBatchExecutor(tasks, simpleSyncExecutor);

      expect(result.results.length).toBe(1);
      expect(result.results[0].success).toBe(true);
      expect(result.results[0].result).toBe(42);
      expect(result.successCount).toBe(1);
    });

    it('should execute multiple tasks', async () => {
      const tasks: BatchTask[] = [
        { method: 'a', params: [1] },
        { method: 'b', params: [2] },
        { method: 'c', params: [3] },
      ];
      const result = await createBatchExecutor(tasks, simpleSyncExecutor);

      expect(result.results.length).toBe(3);
      expect(result.successes).toEqual([1, 2, 3]);
      expect(result.successCount).toBe(3);
      expect(result.allSucceeded).toBe(true);
    });

    it('should track task indices', async () => {
      const tasks: BatchTask[] = [
        { method: 'a', params: [1] },
        { method: 'b', params: [2] },
      ];
      const result = await createBatchExecutor(tasks, simpleSyncExecutor);

      expect(result.results[0].index).toBe(0);
      expect(result.results[1].index).toBe(1);
    });

    it('should track duration', async () => {
      const tasks: BatchTask[] = [{ method: 'test', params: [1] }];
      const result = await createBatchExecutor(tasks, simpleSyncExecutor);

      expect(result.duration).toBeGreaterThanOrEqual(0);
      expect(result.results[0].duration).toBeGreaterThanOrEqual(0);
    });
  });

  describe('error handling', () => {
    it('should handle task failures', async () => {
      const executor: TaskExecutor<number> = async (method) => {
        if (method === 'fail') throw new Error('Task failed');
        return 42;
      };

      const tasks: BatchTask[] = [
        { method: 'ok', params: [] },
        { method: 'fail', params: [] },
        { method: 'ok', params: [] },
      ];

      const result = await createBatchExecutor(tasks, executor);

      expect(result.successCount).toBe(2);
      expect(result.failureCount).toBe(1);
      expect(result.allSucceeded).toBe(false);
      expect(result.failures.length).toBe(1);
      expect(result.failures[0].message).toBe('Task failed');
    });

    it('should continue after failures by default', async () => {
      const executor: TaskExecutor<number> = async (method) => {
        if (method === 'fail') throw new Error('fail');
        return 1;
      };

      const tasks: BatchTask[] = [
        { method: 'fail', params: [] },
        { method: 'ok', params: [] },
        { method: 'ok', params: [] },
      ];

      const result = await createBatchExecutor(tasks, executor);
      expect(result.successCount).toBe(2);
    });

    it('should stop on first failure with failFast', async () => {
      const executor: TaskExecutor<number> = async (method) => {
        if (method === 'fail') throw new Error('fail');
        return 1;
      };

      const tasks: BatchTask[] = [
        { method: 'ok', params: [] },
        { method: 'fail', params: [] },
        { method: 'ok', params: [] },
      ];

      const result = await createBatchExecutor(tasks, executor, { failFast: true, concurrency: 1 });

      expect(result.failureCount).toBeGreaterThanOrEqual(1);
      expect(result.cancelled).toBe(true);
    });
  });

  describe('concurrency control', () => {
    it('should respect concurrency limit of 1', async () => {
      let maxConcurrent = 0;
      let currentConcurrent = 0;

      const executor: TaskExecutor<number> = async () => {
        currentConcurrent++;
        maxConcurrent = Math.max(maxConcurrent, currentConcurrent);
        await new Promise(r => setTimeout(r, 10));
        currentConcurrent--;
        return 1;
      };

      const tasks: BatchTask[] = Array(3).fill(null).map(() => ({
        method: 'test',
        params: [],
      }));

      await createBatchExecutor(tasks, executor, { concurrency: 1 });
      expect(maxConcurrent).toBe(1);
    });

    it('should respect concurrency limit of 2', async () => {
      let maxConcurrent = 0;
      let currentConcurrent = 0;

      const executor: TaskExecutor<number> = async () => {
        currentConcurrent++;
        maxConcurrent = Math.max(maxConcurrent, currentConcurrent);
        await new Promise(r => setTimeout(r, 10));
        currentConcurrent--;
        return 1;
      };

      const tasks: BatchTask[] = Array(4).fill(null).map(() => ({
        method: 'test',
        params: [],
      }));

      await createBatchExecutor(tasks, executor, { concurrency: 2 });
      expect(maxConcurrent).toBeLessThanOrEqual(2);
    });
  });

  describe('batch promise API', () => {
    it('should have cancel method', () => {
      const promise = createBatchExecutor([], simpleSyncExecutor);
      expect(typeof promise.cancel).toBe('function');
    });

    it('should have pause method', () => {
      const promise = createBatchExecutor([], simpleSyncExecutor);
      expect(typeof promise.pause).toBe('function');
    });

    it('should have resume method', () => {
      const promise = createBatchExecutor([], simpleSyncExecutor);
      expect(typeof promise.resume).toBe('function');
    });

    it('should have isPaused method', () => {
      const promise = createBatchExecutor([], simpleSyncExecutor);
      expect(typeof promise.isPaused).toBe('function');
      expect(promise.isPaused()).toBe(false);
    });

    it('should return chainable promise from cancel', async () => {
      const promise = createBatchExecutor(
        [{ method: 'test', params: [1] }],
        simpleSyncExecutor
      );
      const result = promise.cancel();
      expect(result).toBe(promise);
    });

    it('should return chainable promise from pause', async () => {
      const promise = createBatchExecutor(
        [{ method: 'test', params: [1] }],
        simpleSyncExecutor
      );
      const result = promise.pause();
      expect(result).toBe(promise);
    });
  });

  describe('progress reporting', () => {
    it('should call onProgress callback', async () => {
      const progressUpdates: BatchProgress[] = [];

      const tasks: BatchTask[] = Array(3).fill(null).map(() => ({
        method: 'test',
        params: [1],
      }));

      await createBatchExecutor(tasks, simpleSyncExecutor, {
        onProgress: (p) => progressUpdates.push({ ...p }),
      });

      expect(progressUpdates.length).toBeGreaterThan(0);
    });

    it('should report correct final progress values', async () => {
      let lastProgress: BatchProgress | null = null;

      const tasks: BatchTask[] = Array(4).fill(null).map(() => ({
        method: 'test',
        params: [1],
      }));

      await createBatchExecutor(tasks, simpleSyncExecutor, {
        onProgress: (p) => { lastProgress = { ...p }; },
      });

      expect(lastProgress).not.toBeNull();
      expect(lastProgress!.completed).toBe(4);
      expect(lastProgress!.total).toBe(4);
      expect(lastProgress!.percentage).toBe(100);
    });

    it('should include progress stats', async () => {
      let capturedProgress: BatchProgress | null = null;

      const tasks: BatchTask[] = [{ method: 'test', params: [1] }];

      await createBatchExecutor(tasks, simpleSyncExecutor, {
        onProgress: (p) => { capturedProgress = p; },
      });

      expect(capturedProgress).toHaveProperty('completed');
      expect(capturedProgress).toHaveProperty('total');
      expect(capturedProgress).toHaveProperty('successes');
      expect(capturedProgress).toHaveProperty('failures');
      expect(capturedProgress).toHaveProperty('percentage');
      expect(capturedProgress).toHaveProperty('estimatedRemaining');
      expect(capturedProgress).toHaveProperty('throughput');
    });
  });

  describe('timeouts', () => {
    it('should apply task timeout', async () => {
      const executor: TaskExecutor<number> = async () => {
        await new Promise(r => setTimeout(r, 200));
        return 1;
      };

      const tasks: BatchTask[] = [{ method: 'slow', params: [] }];
      const result = await createBatchExecutor(tasks, executor, { taskTimeout: 50 });

      expect(result.failureCount).toBe(1);
      expect(result.failures[0].message).toContain('timeout');
    });
  });
});

describe('createMapExecutor', () => {
  it('should handle empty array', async () => {
    const result = await createMapExecutor([], (x: number) => x, simpleSyncExecutor);
    expect(result.successes).toEqual([]);
  });

  it('should map items with function', async () => {
    const items = [1, 2, 3];
    const mapFn = (x: number) => x * 2;

    const executor: TaskExecutor<number> = async (method, params) => {
      const fn = typeof method === 'function' ? method : eval('(' + method + ')');
      return fn(params[0], params[1]);
    };

    const result = await createMapExecutor(items, mapFn, executor);
    expect(result.successes).toEqual([2, 4, 6]);
  });

  it('should pass index to map function', async () => {
    const items = ['a', 'b', 'c'];
    const mapFn = (item: string, index: number) => `${item}${index}`;

    const executor: TaskExecutor<string> = async (method, params) => {
      const fn = typeof method === 'function' ? method : eval('(' + method + ')');
      return fn(params[0], params[1]);
    };

    const result = await createMapExecutor(items, mapFn, executor);
    expect(result.successes).toEqual(['a0', 'b1', 'c2']);
  });
});

describe('executeBatchSimple', () => {
  it('should execute batch and return result', async () => {
    const tasks: BatchTask[] = [
      { method: 'a', params: [1] },
      { method: 'b', params: [2] },
    ];

    const result = await executeBatchSimple(tasks, simpleSyncExecutor);

    expect(result.successCount).toBe(2);
    expect(result.successes).toEqual([1, 2]);
  });

  it('should accept options', async () => {
    const tasks: BatchTask[] = [
      { method: 'a', params: [1] },
    ];

    const result = await executeBatchSimple(tasks, simpleSyncExecutor, {
      concurrency: 2,
      failFast: false,
    });

    expect(result.successCount).toBe(1);
  });

  it('should handle failures', async () => {
    const executor: TaskExecutor<number> = async (method) => {
      if (method === 'fail') throw new Error('failed');
      return 1;
    };

    const tasks: BatchTask[] = [
      { method: 'ok', params: [] },
      { method: 'fail', params: [] },
    ];

    const result = await executeBatchSimple(tasks, executor);

    expect(result.successCount).toBe(1);
    expect(result.failureCount).toBe(1);
  });
});
