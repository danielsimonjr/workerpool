// Standalone check: run a real worker_threads worker through the pool,
// exec a trivial function, then terminate. Exits 0 on success, 1 on failure.
//
// Runs under any runtime that provides node:worker_threads:
//   node test/runtime/worker-threads-check.js
//   bun  test/runtime/worker-threads-check.js
//
// Why it exists: Bun defines `self`, `postMessage` and `addEventListener`
// inside a worker_threads Worker. The worker script used to take its
// browser branch there, listen on the global `message` event, and never
// receive a task (Bun delivers parent messages only to `parentPort`).
// The mocha suite cannot run under Bun, so this script is the Bun check;
// test/js/worker-threads-runtime.test.js runs it under Node (and Bun if installed).
'use strict';

var workerpool = require('../../src/js/index');

var EXEC_TIMEOUT_MS = 5000;
var TERMINATE_BUDGET_MS = 3000;

function add(a, b) {
  return a + b;
}

async function main() {
  var pool = workerpool.pool({ workerType: 'thread', maxWorkers: 1 });
  var result = await pool.exec(add, [2, 3]).timeout(EXEC_TIMEOUT_MS);
  if (result !== 5) {
    throw new Error('unexpected result: ' + result);
  }
  var start = Date.now();
  await pool.terminate();
  var elapsed = Date.now() - start;
  if (elapsed > TERMINATE_BUDGET_MS) {
    throw new Error('terminate() took ' + elapsed + ' ms (budget ' + TERMINATE_BUDGET_MS + ' ms)');
  }
  console.log('OK exec=5 terminate=' + elapsed + 'ms');
}

var hardStop = setTimeout(function () {
  console.error('FAIL: check did not finish within ' + (EXEC_TIMEOUT_MS + TERMINATE_BUDGET_MS + 2000) + ' ms');
  process.exit(1);
}, EXEC_TIMEOUT_MS + TERMINATE_BUDGET_MS + 2000);

main().then(function () {
  clearTimeout(hardStop);
  process.exit(0);
}, function (err) {
  clearTimeout(hardStop);
  console.error('FAIL: ' + (err && err.stack || err));
  process.exit(1);
});
