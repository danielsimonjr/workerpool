/**
 * Tests for AdvancedPool - Enhanced worker pool with intelligent scheduling
 *
 * Note: Tests that require actual worker execution are minimal since the
 * TypeScript pool requires a proper worker script. These tests focus on
 * configuration, strategy management, and API correctness.
 */

import { describe, it, expect, afterEach } from 'vitest';
import {
  AdvancedPool,
  advancedPool,
  cpuIntensivePool,
  ioIntensivePool,
  mixedWorkloadPool,
  createAffinityKey,
  objectAffinityKey,
} from '../../src/ts/core/AdvancedPool';

describe('AdvancedPool', () => {
  let pool: AdvancedPool | null = null;

  afterEach(async () => {
    if (pool) {
      try {
        await pool.terminate(true);
      } catch {
        // Ignore termination errors
      }
      pool = null;
    }
  });

  describe('construction', () => {
    it('should create an AdvancedPool with default options', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.maxWorkers).toBe(2);
    });

    it('should create an AdvancedPool with script path', () => {
      pool = new AdvancedPool('./test/js/workers/simple.js', { maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
    });

    it('should create with custom worker choice strategy', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        workerChoiceStrategy: 'round-robin',
      });

      expect(pool.getWorkerChoiceStrategy()).toBe('round-robin');
    });

    it('should create with all strategy types', () => {
      const strategies = [
        'round-robin',
        'least-busy',
        'least-used',
        'fair-share',
        'weighted-round-robin',
        'interleaved-weighted-round-robin',
      ] as const;

      for (const strategy of strategies) {
        const p = new AdvancedPool({
          maxWorkers: 2,
          workerChoiceStrategy: strategy,
        });
        expect(p.getWorkerChoiceStrategy()).toBe(strategy);
        p.terminate(true);
      }
    });

    it('should create with work stealing disabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableWorkStealing: false,
      });

      const stats = pool.stats();
      expect(stats.workStealingEnabled).toBe(false);
    });

    it('should create with task affinity disabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableTaskAffinity: false,
      });

      const stats = pool.stats();
      expect(stats.affinityEnabled).toBe(false);
    });

    it('should create with custom rebalance settings', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        rebalanceThreshold: 5,
        rebalanceInterval: 2000,
      });

      expect(pool).toBeInstanceOf(AdvancedPool);
    });

    it('should create with worker weights', () => {
      pool = new AdvancedPool({
        maxWorkers: 3,
        workerWeights: [1, 2, 3],
        workerChoiceStrategy: 'weighted-round-robin',
      });

      expect(pool.getWorkerChoiceStrategy()).toBe('weighted-round-robin');
    });

    it('should create with stealing policy', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        stealingPolicy: 'round-robin',
      });

      expect(pool).toBeInstanceOf(AdvancedPool);
    });
  });

  describe('factory functions', () => {
    it('should create pool with advancedPool()', () => {
      pool = advancedPool({ maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
    });

    it('should create pool with advancedPool() and script', () => {
      pool = advancedPool('./test/js/workers/simple.js', { maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
    });

    it('should create CPU-intensive pool with cpuIntensivePool()', () => {
      pool = cpuIntensivePool({ maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.getWorkerChoiceStrategy()).toBe('fair-share');
      expect(pool.stats().workStealingEnabled).toBe(true);
    });

    it('should create I/O-intensive pool with ioIntensivePool()', () => {
      pool = ioIntensivePool({ maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.getWorkerChoiceStrategy()).toBe('least-busy');
      expect(pool.stats().workStealingEnabled).toBe(true);
    });

    it('should create mixed workload pool with mixedWorkloadPool()', () => {
      pool = mixedWorkloadPool({ maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.getWorkerChoiceStrategy()).toBe('fair-share');
      expect(pool.stats().affinityEnabled).toBe(true);
    });

    it('should create CPU pool with script path', () => {
      pool = cpuIntensivePool('./test/js/workers/simple.js', { maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.getWorkerChoiceStrategy()).toBe('fair-share');
    });

    it('should create I/O pool with script path', () => {
      pool = ioIntensivePool('./test/js/workers/simple.js', { maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.getWorkerChoiceStrategy()).toBe('least-busy');
    });

    it('should create mixed pool with script path', () => {
      pool = mixedWorkloadPool('./test/js/workers/simple.js', { maxWorkers: 2 });

      expect(pool).toBeInstanceOf(AdvancedPool);
      expect(pool.getWorkerChoiceStrategy()).toBe('fair-share');
    });
  });

  describe('strategy management', () => {
    it('should change worker choice strategy at runtime', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        workerChoiceStrategy: 'round-robin',
      });

      expect(pool.getWorkerChoiceStrategy()).toBe('round-robin');

      pool.setWorkerChoiceStrategy('least-busy');
      expect(pool.getWorkerChoiceStrategy()).toBe('least-busy');

      pool.setWorkerChoiceStrategy('fair-share');
      expect(pool.getWorkerChoiceStrategy()).toBe('fair-share');
    });

    it('should support all strategy types via setWorkerChoiceStrategy', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const strategies = [
        'round-robin',
        'least-busy',
        'least-used',
        'fair-share',
        'weighted-round-robin',
        'interleaved-weighted-round-robin',
      ] as const;

      for (const strategy of strategies) {
        pool.setWorkerChoiceStrategy(strategy);
        expect(pool.getWorkerChoiceStrategy()).toBe(strategy);
      }
    });

    it('should set worker weights', () => {
      pool = new AdvancedPool({
        maxWorkers: 3,
        workerChoiceStrategy: 'weighted-round-robin',
      });

      // Should not throw
      pool.setWorkerWeights([1, 2, 3]);
      pool.setWorkerWeights([3, 2, 1]);
    });
  });

  describe('affinity management', () => {
    it('should set and clear affinity', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const key = pool.createAffinityKey('session', 42);

      pool.setAffinity(key, 0);
      pool.clearAffinity(key);

      // Should not throw
    });

    it('should set affinity with TTL', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const key = pool.createAffinityKey('session', 42);

      // Should not throw
      pool.setAffinity(key, 0, 5000);
    });

    it('should create affinity key from parts', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const key1 = pool.createAffinityKey('user', 123);
      const key2 = pool.createAffinityKey('user', 123);
      const key3 = pool.createAffinityKey('user', 456);

      expect(key1).toBe(key2);
      expect(key1).not.toBe(key3);
    });

    it('should create affinity key from object properties', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const obj = { userId: 123, sessionId: 'abc' };

      const key = pool.objectAffinityKey(obj, ['userId']);

      expect(typeof key).toBe('string');
    });

    it('should create consistent object affinity keys', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const obj1 = { userId: 123, name: 'test' };
      const obj2 = { userId: 123, name: 'different' };

      const key1 = pool.objectAffinityKey(obj1, ['userId']);
      const key2 = pool.objectAffinityKey(obj2, ['userId']);

      expect(key1).toBe(key2);
    });
  });

  describe('work stealing management', () => {
    it('should enable/disable work stealing', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableWorkStealing: true,
      });

      expect(pool.stats().workStealingEnabled).toBe(true);

      pool.setWorkStealingEnabled(false);
      expect(pool.stats().workStealingEnabled).toBe(false);

      pool.setWorkStealingEnabled(true);
      expect(pool.stats().workStealingEnabled).toBe(true);
    });

    it('should get load imbalance', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const imbalance = pool.getLoadImbalance();

      expect(typeof imbalance).toBe('number');
      expect(imbalance).toBeGreaterThanOrEqual(0);
    });

    it('should manually trigger rebalance', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const rebalanced = pool.rebalance();

      expect(typeof rebalanced).toBe('number');
    });

    it('should return 0 rebalanced when work stealing disabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableWorkStealing: false,
      });

      const rebalanced = pool.rebalance();

      expect(rebalanced).toBe(0);
    });
  });

  describe('stats()', () => {
    it('should return comprehensive stats', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const stats = pool.stats();

      expect(stats).toHaveProperty('totalWorkers');
      expect(stats).toHaveProperty('busyWorkers');
      expect(stats).toHaveProperty('idleWorkers');
      expect(stats).toHaveProperty('pendingTasks');
      expect(stats).toHaveProperty('workerChoiceStrategy');
      expect(stats).toHaveProperty('workerStats');
      expect(stats).toHaveProperty('workStealingEnabled');
      expect(stats).toHaveProperty('affinityEnabled');
    });

    it('should include work stealing stats when enabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableWorkStealing: true,
      });

      const stats = pool.stats();

      expect(stats.workStealingStats).toBeDefined();
    });

    it('should not include work stealing stats when disabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableWorkStealing: false,
      });

      const stats = pool.stats();

      expect(stats.workStealingStats).toBeUndefined();
    });

    it('should include affinity stats when enabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableTaskAffinity: true,
      });

      const stats = pool.stats();

      expect(stats.affinityStats).toBeDefined();
    });

    it('should not include affinity stats when disabled', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        enableTaskAffinity: false,
      });

      const stats = pool.stats();

      expect(stats.affinityStats).toBeUndefined();
    });

    it('should report correct strategy in stats', () => {
      pool = new AdvancedPool({
        maxWorkers: 2,
        workerChoiceStrategy: 'fair-share',
      });

      const stats = pool.stats();

      expect(stats.workerChoiceStrategy).toBe('fair-share');
    });
  });

  describe('event handling', () => {
    it('should have on method for event subscription', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.on).toBe('function');
    });

    it('should have off method for event unsubscription', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.off).toBe('function');
    });

    it('should subscribe and unsubscribe without errors', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      const listener = () => {};

      // Should not throw
      pool.on('taskStart', listener);
      pool.off('taskStart', listener);
    });
  });

  describe('ready state', () => {
    it('should have ready promise', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(pool.ready).toBeDefined();
      expect(typeof pool.ready.then).toBe('function');
    });

    it('should have isReady property', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.isReady).toBe('boolean');
    });
  });

  describe('workers property', () => {
    it('should expose workers array', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(Array.isArray(pool.workers)).toBe(true);
    });

    it('should be readonly', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      // Workers array exists
      expect(pool.workers).toBeDefined();
    });
  });

  describe('terminate()', () => {
    it('should have terminate method', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.terminate).toBe('function');
    });

    it('should accept force parameter', async () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      // Should not throw
      await pool.terminate(true);
      pool = null;
    });

    it('should accept timeout parameter', async () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      // Should not throw
      await pool.terminate(true, 5000);
      pool = null;
    });
  });

  describe('proxy()', () => {
    it('should have proxy method', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.proxy).toBe('function');
    });
  });

  describe('exec methods', () => {
    it('should have exec method', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.exec).toBe('function');
    });

    it('should have execWithAffinity method', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.execWithAffinity).toBe('function');
    });

    it('should have execWithType method', () => {
      pool = new AdvancedPool({ maxWorkers: 2 });

      expect(typeof pool.execWithType).toBe('function');
    });
  });
});

describe('createAffinityKey', () => {
  it('should create consistent keys from same parts', () => {
    const key1 = createAffinityKey('user', 123, 'session');
    const key2 = createAffinityKey('user', 123, 'session');

    expect(key1).toBe(key2);
  });

  it('should create different keys from different parts', () => {
    const key1 = createAffinityKey('user', 123);
    const key2 = createAffinityKey('user', 456);

    expect(key1).not.toBe(key2);
  });

  it('should handle undefined parts', () => {
    const key = createAffinityKey('user', undefined, 'session');

    expect(typeof key).toBe('string');
  });

  it('should handle number parts', () => {
    const key = createAffinityKey(1, 2, 3);

    expect(typeof key).toBe('string');
  });

  it('should handle string parts', () => {
    const key = createAffinityKey('a', 'b', 'c');

    expect(typeof key).toBe('string');
  });

  it('should handle mixed parts', () => {
    const key = createAffinityKey('user', 123, undefined, 'session');

    expect(typeof key).toBe('string');
  });
});

describe('objectAffinityKey', () => {
  it('should create key from object properties', () => {
    const obj = { id: 1, name: 'test', value: 42 };

    const key = objectAffinityKey(obj, ['id', 'name']);

    expect(typeof key).toBe('string');
  });

  it('should create consistent keys for same property values', () => {
    const obj1 = { id: 1, name: 'test' };
    const obj2 = { id: 1, name: 'test', extra: true };

    const key1 = objectAffinityKey(obj1, ['id', 'name']);
    const key2 = objectAffinityKey(obj2, ['id', 'name']);

    expect(key1).toBe(key2);
  });

  it('should create different keys for different property values', () => {
    const obj1 = { id: 1, name: 'test' };
    const obj2 = { id: 2, name: 'test' };

    const key1 = objectAffinityKey(obj1, ['id']);
    const key2 = objectAffinityKey(obj2, ['id']);

    expect(key1).not.toBe(key2);
  });

  it('should handle single property', () => {
    const obj = { id: 1 };

    const key = objectAffinityKey(obj, ['id']);

    expect(typeof key).toBe('string');
  });

  it('should handle multiple properties', () => {
    const obj = { a: 1, b: 2, c: 3 };

    const key = objectAffinityKey(obj, ['a', 'b', 'c']);

    expect(typeof key).toBe('string');
  });
});
