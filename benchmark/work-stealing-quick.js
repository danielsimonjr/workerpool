#!/usr/bin/env node
/**
 * Quick Benchmark: Work-Stealing and Task Affinity
 *
 * Run with:
 *   node benchmark/work-stealing-quick.js
 */

const { performance } = require('perf_hooks');
const {
  advancedPool,
  WorkStealingDeque,
  TaskAffinityRouter,
} = require('../dist/ts/full.js');

/**
 * Variable duration work to simulate imbalanced tasks
 */
function variableWork(complexity) {
  let result = 0;
  for (let i = 0; i < complexity * 1000; i++) {
    result += Math.sqrt(i);
  }
  return result;
}

async function main() {
  console.log('═══════════════════════════════════════════════════════════════════');
  console.log('  Work-Stealing & Task Affinity Benchmarks');
  console.log('═══════════════════════════════════════════════════════════════════\n');

  // ============================================================
  // Benchmark 1: Work-Stealing with Imbalanced Workload
  // ============================================================
  console.log('───────────────────────────────────────────────────────────────────');
  console.log('  1. Work-Stealing Impact (imbalanced workload: 3 heavy + 9 light)');
  console.log('───────────────────────────────────────────────────────────────────\n');

  // Create pools once
  const poolNoSteal = advancedPool({
    maxWorkers: 4,
    workerChoiceStrategy: 'round-robin',
    enableWorkStealing: false,
  });

  const poolSteal = advancedPool({
    maxWorkers: 4,
    workerChoiceStrategy: 'round-robin',
    enableWorkStealing: true,
    stealingPolicy: 'busiest-first',
  });

  // Imbalanced workload test
  const runImbalanced = async (pool) => {
    const promises = [];
    for (let i = 0; i < 12; i++) {
      const complexity = i < 3 ? 5 : 1;
      promises.push(pool.exec(variableWork, [complexity]));
    }
    return Promise.all(promises);
  };

  // Run without stealing
  const startNoSteal = performance.now();
  await runImbalanced(poolNoSteal);
  await runImbalanced(poolNoSteal);
  await runImbalanced(poolNoSteal);
  const noStealTime = (performance.now() - startNoSteal) / 3;

  console.log(`  Round-Robin (no stealing):     ${noStealTime.toFixed(1)}ms avg`);

  // Run with stealing
  const startSteal = performance.now();
  await runImbalanced(poolSteal);
  await runImbalanced(poolSteal);
  await runImbalanced(poolSteal);
  const stealTime = (performance.now() - startSteal) / 3;

  console.log(`  Round-Robin + Work-Stealing:   ${stealTime.toFixed(1)}ms avg`);

  const stealSpeedup = noStealTime / stealTime;
  console.log(`\n  → Work-Stealing Impact: ${stealSpeedup.toFixed(2)}x ${stealSpeedup > 1 ? 'faster' : 'slower'}`);

  await poolNoSteal.terminate();
  await poolSteal.terminate();

  // ============================================================
  // Benchmark 2: Task Affinity with Related Tasks
  // ============================================================
  console.log('\n───────────────────────────────────────────────────────────────────');
  console.log('  2. Task Affinity Impact (4 users × 3 requests each)');
  console.log('───────────────────────────────────────────────────────────────────\n');

  const poolNoAffinity = advancedPool({
    maxWorkers: 4,
    workerChoiceStrategy: 'round-robin',
    enableTaskAffinity: false,
  });

  const poolAffinity = advancedPool({
    maxWorkers: 4,
    workerChoiceStrategy: 'round-robin',
    enableTaskAffinity: true,
  });

  // User request workload test
  const runUserRequests = async (pool, useAffinity) => {
    const promises = [];
    for (let userId = 0; userId < 4; userId++) {
      for (let req = 0; req < 3; req++) {
        if (useAffinity) {
          promises.push(pool.execWithAffinity(`user-${userId}`, variableWork, [1]));
        } else {
          promises.push(pool.exec(variableWork, [1]));
        }
      }
    }
    return Promise.all(promises);
  };

  // Run without affinity
  const startNoAffinity = performance.now();
  await runUserRequests(poolNoAffinity, false);
  await runUserRequests(poolNoAffinity, false);
  await runUserRequests(poolNoAffinity, false);
  const noAffinityTime = (performance.now() - startNoAffinity) / 3;

  console.log(`  Round-Robin (no affinity):     ${noAffinityTime.toFixed(1)}ms avg`);

  // Run with affinity
  const startAffinity = performance.now();
  await runUserRequests(poolAffinity, true);
  await runUserRequests(poolAffinity, true);
  await runUserRequests(poolAffinity, true);
  const affinityTime = (performance.now() - startAffinity) / 3;

  console.log(`  Round-Robin + Task Affinity:   ${affinityTime.toFixed(1)}ms avg`);

  const affinitySpeedup = noAffinityTime / affinityTime;
  console.log(`\n  → Task Affinity Impact: ${affinitySpeedup.toFixed(2)}x ${affinitySpeedup > 1 ? 'faster' : 'slower'}`);

  await poolNoAffinity.terminate();
  await poolAffinity.terminate();

  // ============================================================
  // Benchmark 3: Data Structure Performance
  // ============================================================
  console.log('\n───────────────────────────────────────────────────────────────────');
  console.log('  3. Data Structure Micro-Benchmarks (10,000 operations)');
  console.log('───────────────────────────────────────────────────────────────────\n');

  // WorkStealingDeque benchmark
  const dequeStart = performance.now();
  for (let iter = 0; iter < 100; iter++) {
    const deque = new WorkStealingDeque(0, 64);
    for (let i = 0; i < 5000; i++) {
      deque.pushBottom(i);
    }
    for (let i = 0; i < 2500; i++) {
      deque.popBottom();
    }
    for (let i = 0; i < 2500; i++) {
      deque.steal();
    }
  }
  const dequeTime = (performance.now() - dequeStart) / 100;
  console.log(`  WorkStealingDeque (push/pop/steal): ${dequeTime.toFixed(2)}ms avg`);

  // TaskAffinityRouter benchmark
  const routerStart = performance.now();
  for (let iter = 0; iter < 100; iter++) {
    const router = new TaskAffinityRouter({ defaultTTL: 60000 });
    for (let i = 0; i < 4; i++) {
      router.registerWorker(i);
    }
    const availableWorkers = [0, 1, 2, 3];
    for (let i = 0; i < 10000; i++) {
      router.route({
        affinityKey: `key-${i % 100}`,
        taskType: 'task-type',
        availableWorkers,
      });
    }
  }
  const routerTime = (performance.now() - routerStart) / 100;
  console.log(`  TaskAffinityRouter (route decisions): ${routerTime.toFixed(2)}ms avg`);

  // ============================================================
  // Summary
  // ============================================================
  console.log('\n═══════════════════════════════════════════════════════════════════');
  console.log('  Summary');
  console.log('═══════════════════════════════════════════════════════════════════\n');

  console.log(`  Work-Stealing:      ${stealSpeedup.toFixed(2)}x improvement (imbalanced workloads)`);
  console.log(`  Task Affinity:      ${affinitySpeedup.toFixed(2)}x improvement (related tasks)`);

  console.log('\n  When to use:');
  console.log('    - Work-Stealing: Tasks have variable duration, some workers idle');
  console.log('    - Task Affinity: Related tasks benefit from cache locality');

  console.log('\n═══════════════════════════════════════════════════════════════════\n');
}

main().catch(e => {
  console.error('Error:', e);
  process.exit(1);
});
