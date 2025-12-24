/**
 * Quick Benchmark: JS vs TS+WASM
 */
import { performance } from 'perf_hooks';

const isBun = typeof Bun !== 'undefined';
const runtime = isBun ? 'Bun ' + Bun.version : 'Node ' + process.version;

console.log('='.repeat(60));
console.log('  JS vs TS+WASM Benchmark | ' + runtime);
console.log('='.repeat(60));

// 1. Queue Operations
console.log('');
console.log('1. QUEUE OPERATIONS (100K push + 100K pop)');
console.log('-'.repeat(60));

const iterations = 100000;
const jsQueue = { tasks: [], push(t) { this.tasks.push(t); }, pop() { return this.tasks.shift(); } };

let start = performance.now();
for (let i = 0; i < iterations; i++) jsQueue.push({ id: i });
for (let i = 0; i < iterations; i++) jsQueue.pop();
const jsQueueTime = performance.now() - start;

const { GrowableCircularBuffer } = await import('./dist/ts/full.js');
const tsBuffer = new GrowableCircularBuffer(16);

start = performance.now();
for (let i = 0; i < iterations; i++) tsBuffer.push({ id: i });
for (let i = 0; i < iterations; i++) tsBuffer.shift();
const tsQueueTime = performance.now() - start;

console.log('  JS Array Queue:      ' + jsQueueTime.toFixed(1) + ' ms');
console.log('  TS CircularBuffer:   ' + tsQueueTime.toFixed(1) + ' ms  (' + (jsQueueTime/tsQueueTime).toFixed(1) + 'x faster)');

// 2. Pool Creation
console.log('');
console.log('2. POOL CREATION + SINGLE TASK (10 iterations)');
console.log('-'.repeat(60));

const jsPool = await import('./src/js/index.js');
const tsPool = await import('./dist/ts/full.js');
const fn = (x) => x * 2;

start = performance.now();
for (let i = 0; i < 10; i++) {
  const p = jsPool.pool({ maxWorkers: 2 });
  await p.exec(fn, [i]);
  await p.terminate();
}
const jsPoolTime = performance.now() - start;

start = performance.now();
for (let i = 0; i < 10; i++) {
  const p = tsPool.pool({ maxWorkers: 2 });
  await p.exec(fn, [i]);
  await p.terminate();
}
const tsPoolTime = performance.now() - start;

console.log('  JS Pool:             ' + jsPoolTime.toFixed(1) + ' ms');
console.log('  TS Pool:             ' + tsPoolTime.toFixed(1) + ' ms  (' + (jsPoolTime/tsPoolTime).toFixed(2) + 'x)');

// 3. Throughput
console.log('');
console.log('3. THROUGHPUT (200 tasks, 4 workers)');
console.log('-'.repeat(60));

const cpuFn = (n) => { let s = 0; for (let i = 0; i < n; i++) s += Math.sqrt(i); return s; };

const jp = jsPool.pool({ maxWorkers: 4 });
start = performance.now();
await Promise.all(Array(200).fill(0).map(() => jp.exec(cpuFn, [1000])));
const jsThroughput = performance.now() - start;
await jp.terminate();

const tp = tsPool.pool({ maxWorkers: 4 });
start = performance.now();
await Promise.all(Array(200).fill(0).map(() => tp.exec(cpuFn, [1000])));
const tsThroughput = performance.now() - start;
await tp.terminate();

console.log('  JS Pool:             ' + jsThroughput.toFixed(1) + ' ms  (' + (200/(jsThroughput/1000)).toFixed(0) + ' tasks/sec)');
console.log('  TS Pool:             ' + tsThroughput.toFixed(1) + ' ms  (' + (200/(tsThroughput/1000)).toFixed(0) + ' tasks/sec)  (' + (jsThroughput/tsThroughput).toFixed(2) + 'x)');

console.log('');
console.log('='.repeat(60));
console.log('  SUMMARY');
console.log('='.repeat(60));
console.log('  Queue Ops:    TS is ' + (jsQueueTime/tsQueueTime).toFixed(1) + 'x faster (O(1) vs O(n) shift)');
const poolWinner = jsPoolTime < tsPoolTime ? 'JS' : 'TS';
const poolRatio = jsPoolTime < tsPoolTime ? (tsPoolTime/jsPoolTime).toFixed(2) : (jsPoolTime/tsPoolTime).toFixed(2);
console.log('  Pool Create:  ' + poolWinner + ' is ' + poolRatio + 'x faster');
const tpWinner = jsThroughput < tsThroughput ? 'JS' : 'TS';
const tpRatio = jsThroughput < tsThroughput ? (tsThroughput/jsThroughput).toFixed(2) : (jsThroughput/tsThroughput).toFixed(2);
console.log('  Throughput:   ' + tpWinner + ' is ' + tpRatio + 'x faster');
console.log('='.repeat(60));
