const {platform, isMainThread, cpus} = require('./environment');
const {TerminateError} = require('./WorkerHandler');

// NOTE: named WorkerPool, not Pool: a JSDoc typedef `Pool` would merge with the
// module-level `var Pool = require("./Pool")` value below and break declaration
// emit (TS2395), which is why types/index.d.ts was previously unusable.
/** @typedef {import("./Pool")} WorkerPool */
/** @typedef {import("./types.js").WorkerPoolOptions} WorkerPoolOptions */
/** @typedef {import("./types.js").WorkerRegisterOptions} WorkerRegisterOptions */

/**
 * @template { { [k: string]: (...args: any[]) => any } } T
 * @typedef {import('./types.js').Proxy<T>} Proxy<T>
 */

/**
 * @overload
 * Create a new worker pool
 * @param {WorkerPoolOptions} [script]
 * @returns {WorkerPool} pool
 */
/**
 * @overload
 * Create a new worker pool
 * @param {string} [script]
 * @param {WorkerPoolOptions} [options]
 * @returns {WorkerPool} pool
 */
function pool(script, options) {
  var Pool = require('./Pool');

  return new Pool(script, options);
};
exports.pool = pool;

/**
 * Create a worker and optionally register a set of methods to the worker.
 * @param {{ [k: string]: (...args: any[]) => any }} [methods]
 * @param {WorkerRegisterOptions} [options]
 */
function worker(methods, options) {
  var worker = require('./worker');
  worker.add(methods, options);
};
exports.worker = worker;

/**
 * Sends an event to the parent worker pool.
 * @param {any} payload
 */
function workerEmit(payload) {
  var worker = require('./worker');
  worker.emit(payload);
};
exports.workerEmit = workerEmit;

const {Promise} = require('./Promise');
exports.Promise = Promise;

exports.Transfer = require('./transfer');

exports.platform = platform;
exports.isMainThread = isMainThread;
exports.cpus = cpus;
exports.TerminateError = TerminateError;

// ============================================================================
// New features from WORKERPOOL_IMPROVEMENTS.md
// These features are now integrated directly into Pool class.
// ============================================================================

// The Pool class now includes all enhanced features:
// - Event emitter (taskStart, taskComplete, taskError, etc.)
// - pool.ready promise for eager initialization
// - pool.warmup() method for pre-spawning workers
// - Circuit breaker pattern for error recovery
// - Memory-aware scheduling
// - Health checks
// - Shared pool singleton

var Pool = require('./Pool');

// Export Pool static methods for shared pool functionality.
// Bound to locals first: `exports.x = Pool.x` makes TypeScript emit an export name
// with no backing declaration (TS2304 "Cannot find name 'getSharedPool'"), which
// broke types/index.d.ts. Behaviour is identical.
const getSharedPool = Pool.getSharedPool;
const terminateSharedPool = Pool.terminateSharedPool;
const hasSharedPool = Pool.hasSharedPool;

exports.getSharedPool = getSharedPool;
exports.terminateSharedPool = terminateSharedPool;
exports.hasSharedPool = hasSharedPool;

// Export the Pool class itself, so consumers can reference the TYPE:
//     const p: wp.Pool = wp.pool();
// It was reachable only as `PoolEnhanced`, so `wp.Pool` did not typecheck (TS2724).
exports.Pool = Pool;

// Backward compatibility: PoolEnhanced is now an alias for Pool
// All enhanced features are built into the base Pool class
exports.PoolEnhanced = Pool;
exports.enhancedPool = function(script, options) {
  return new Pool(script, options);
};

// Capabilities API (Issue 8.1)
var {
  capabilities,
  getCapabilities,
  canUseOptimalTransfer,
  canUseZeroCopy,
  getCapabilityReport
} = require('./capabilities');

exports.capabilities = capabilities;
exports.getCapabilities = getCapabilities;
exports.canUseOptimalTransfer = canUseOptimalTransfer;
exports.canUseZeroCopy = canUseZeroCopy;
exports.getCapabilityReport = getCapabilityReport;

// Worker URL utilities (Issue 4.2)
var {
  resolveWorkerUrl,
  createWorkerBlobUrl,
  revokeWorkerBlobUrl,
  getWorkerConfig,
  supportsWorkerModules
} = require('./worker-url');

exports.resolveWorkerUrl = resolveWorkerUrl;
exports.createWorkerBlobUrl = createWorkerBlobUrl;
exports.revokeWorkerBlobUrl = revokeWorkerBlobUrl;
exports.getWorkerConfig = getWorkerConfig;
exports.supportsWorkerModules = supportsWorkerModules;

// Binary serialization (Issue 1.3)
var {
  serializeBinary,
  deserializeBinary,
  shouldUseBinarySerialization,
  estimateBinarySize
} = require('./binary-serializer');

exports.serializeBinary = serializeBinary;
exports.deserializeBinary = deserializeBinary;
exports.shouldUseBinarySerialization = shouldUseBinarySerialization;
exports.estimateBinarySize = estimateBinarySize;