# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**workerpool** (`@danielsimonjr/workerpool`) is a thread pool implementation that runs on both Node.js and browsers. It offloads CPU-intensive tasks to worker processes/threads. This is a fork of [josdejong/workerpool](https://github.com/josdejong/workerpool) with additional TypeScript, WASM, and Bun runtime support.

**Version**: 10.2.1
**License**: Apache-2.0

## Build & Test Commands

```bash
npm install          # Install dependencies
npm run build        # Build JavaScript library (rollup + TypeScript types)
npm test             # Build, run all tests (JS, TS, types)
npm run test:js      # Run JavaScript tests only (mocha)
npm run test:ts      # Run TypeScript tests only (vitest)
npm run test:types   # Test TypeScript type definitions only
npm run coverage     # Generate test coverage report (output: ./coverage/index.html)
```

### Dual Build System

The library supports two separate builds:

**JavaScript Build** (Legacy):
```bash
npm run build:js     # Build JavaScript bundles (src/js/ → dist/)
```
Outputs: `dist/workerpool.js`, `dist/workerpool.min.js`, `dist/worker.js`, `dist/worker.min.js`

**TypeScript + WASM Build** (Modern):
```bash
npm run build:wasm   # Build TypeScript + WASM (src/ts/ → dist/ts/)
npm run build:ts     # Build TypeScript only (no WASM compilation)
```
Outputs: `dist/ts/index.js`, `dist/ts/full.js`, `dist/ts/minimal.js`, plus WASM files

### WASM Commands
```bash
npm run build:wasm:debug   # Build WASM with debug info
npm run build:wasm:esm     # Build WASM as ES module
npm run build:wasm:raw     # Build raw WASM without bindings
npm run build:wasm:all     # Build all WASM variants
npm run build:wasm:embed   # Build and embed WASM bytes in JS
npm run build:wasm:validate # Build and validate WASM output
npm run build:wasm:clean   # Clean and rebuild WASM
```

### Benchmarking
```bash
node benchmark.mjs   # Compare JS vs TS+WASM performance
```

### Running Individual Tests
```bash
# JavaScript tests (mocha)
npm run build && mocha test/js/Pool.test.js

# TypeScript tests (vitest)
npm run test:ts               # All TypeScript tests
npx vitest run test/ts/Pool.vitest.ts  # Single test file
```

## Architecture

### Entry Points

The library provides multiple entry points via `package.json` exports:

| Import Path | Description | Source |
|-------------|-------------|--------|
| `workerpool` | Legacy JS API (default) | `src/js/index.js` |
| `workerpool/modern` | TypeScript build | `dist/ts/index.js` |
| `workerpool/minimal` | Lightweight (~5KB), no WASM | `dist/ts/minimal.js` |
| `workerpool/full` | Complete (~34KB) with WASM, debug | `dist/ts/full.js` |
| `workerpool/wasm` | Direct WASM utilities only | `dist/ts/wasm/index.js` |
| `workerpool/errors` | Error classes only | `dist/ts/errors.js` |
| `workerpool/debug` | Debug/logging utilities only | `dist/ts/debug.js` |

### Source Code Structure

```
src/
├── js/                    # Legacy JavaScript implementation
│   ├── index.js, Pool.js, WorkerHandler.js, worker.js  # Core
│   ├── Promise.js, queues.js, transfer.js               # Utilities
│   ├── environment.js, capabilities.js                   # Platform
│   └── generated/embeddedWorker.js                       # Auto-generated
│
├── ts/                    # TypeScript implementation
│   ├── index.ts, minimal.ts, full.ts   # Entry points (modern/minimal/full)
│   ├── errors.ts, debug.ts             # Error classes & debug utilities
│   │
│   ├── core/              # Pool, WorkerHandler, Promise, TaskQueue, metrics,
│   │                      # parallel-processing, session-manager, batch-executor,
│   │                      # heartbeat, worker-bitmap, k-way-merge, simd-processor
│   │
│   ├── platform/          # environment, transfer, capabilities, worker-url,
│   │                      # channel-factory, message-batcher, shared-memory
│   │
│   ├── workers/           # worker, WorkerCache, adaptive-scaler, affinity,
│   │                      # health-monitor, recycler
│   │
│   ├── wasm/              # WasmBridge, WasmLoader, WasmTaskQueue, feature-detection
│   │
│   ├── assembly/          # AssemblyScript → WASM (priority-queue, ring-buffer,
│   │   └── stubs/         # task-slots, atomics, hash-map, binary-protocol, etc.)
│   │
│   ├── types/             # core.ts, messages.ts, error-codes.ts, parallel.ts, session.ts
│   └── generated/         # embeddedWasm.ts, wasmTypes.ts
```

### Test Structure

```
test/
├── js/                    # JavaScript tests (mocha): Pool, WorkerHandler, Promise,
│   │                      # Queues, environment, wasm, debug-port-allocator
│   ├── workers/           # Test worker scripts (simple, async, cleanup, crash, etc.)
│   └── types/             # TypeScript type tests
│
└── ts/                    # TypeScript tests (vitest): Pool, WorkerHandler, Promise,
    │                      # TaskQueue, transfer, environment, wasm, circular-buffer,
    │                      # parallel-processing, session-manager, error-codes, etc.
    └── assembly/          # AssemblyScript module tests (priority-queue, ring-buffer, etc.)
```

### Worker Types

The `workerType` option controls which backend is used:
- `'auto'` (default) - Web Workers in browser, worker_threads in Node.js 11.7+, child_process as fallback
- `'web'` - Browser Web Workers only
- `'thread'` - Node.js worker_threads only
- `'process'` - Node.js child_process only

### Message Protocol

Workers communicate via JSON-RPC style messages with `id`, `method`, `params`, `result`, `error` fields.

**Protocol Version 2** (TypeScript API) adds:
- `v` - Protocol version (2)
- `seq` - Sequence number for ordering
- `ack` - Last acknowledged sequence
- `priority` - Message priority (0=LOW, 1=NORMAL, 2=HIGH, 3=CRITICAL)
- `ts` - Timestamp when message was created
- `code` - Standardized error code (SerializedError)

Special method IDs:
- `__workerpool-terminate__` - Signals worker to exit
- `__workerpool-cleanup__` - Triggers abort listeners before potential termination
- `__workerpool-heartbeat__` - Health check ping/pong

**Error Code Categories:**
- 1xxx: Worker/Pool errors (WORKER_CRASHED, POOL_TERMINATED, etc.)
- 2xxx: Protocol errors (INVALID_MESSAGE, VERSION_MISMATCH, etc.)
- 3xxx: Task errors (METHOD_NOT_FOUND, TIMEOUT, CANCELLED, etc.)
- 4xxx: Resource errors (OUT_OF_MEMORY, SAB_UNAVAILABLE, etc.)
- 5xxx: Communication errors (CONNECTION_LOST, CHANNEL_CLOSED, etc.)

**Binary Protocol** (WASM): 20-byte header with magic (0x5750), version, type, flags, id, length, sequence, priority.

### Key Patterns

1. **Dynamic function execution**: Functions can be stringified and sent to workers via `pool.exec(fn, args)`
2. **Dedicated workers**: Worker scripts register methods via `workerpool.worker({ methodName: fn })`
3. **Proxy pattern**: `pool.proxy()` returns an object with methods mirroring the worker's registered functions
4. **Transferable objects**: Use `workerpool.Transfer` to efficiently pass ArrayBuffers between threads
5. **WASM queues**: Use `workerpool/full` with `canUseWasmThreads()` for lock-free task scheduling
6. **Batch operations**: `pool.execBatch()` and `pool.map()` for parallel task execution
7. **Parallel array operations**: `pool.reduce()`, `pool.filter()`, `pool.find()`, etc. for chunked parallel processing
8. **Graceful degradation**: `MainThreadExecutor` provides fallback when workers aren't available
9. **Session support**: `pool.createSession()` for stateful worker interactions with worker affinity

## Runtime Support

### Node.js

All features fully supported in Node.js 11.7+ (worker_threads) or earlier versions via child_process fallback.

### Bun Compatibility

Workerpool is **fully compatible** with Bun 1.3.x (TypeScript build only):

| Feature | Status | Notes |
|---------|--------|-------|
| Worker Threads (`workerType: 'thread'`) | ✅ Full Support | **Recommended for Bun** |
| Auto Worker Type (`workerType: 'auto'`) | ✅ Full Support | Uses worker_threads |
| Child Process (`workerType: 'process'`) | ⚠️ Partial | IPC issues in some scenarios |
| TypeScript Build | ✅ Full Support | All 533 tests pass |
| WASM Support | ✅ Full Support | SharedArrayBuffer, Atomics work |

**Recommended Bun configuration:**
```javascript
const workerpool = require('workerpool');
const pool = workerpool.pool({ workerType: 'thread' }); // Always use 'thread' with Bun
```

**TypeScript API provides Bun helpers:**
```typescript
import { isBun, recommendedWorkerType, optimalPool, getRuntimeInfo } from 'workerpool/modern';

if (isBun) {
  const pool = optimalPool(); // Automatically uses best settings for Bun
}
```

See `docs/BUN_COMPATIBILITY.md` for detailed Bun integration guide.

### Browser Support

Works in modern browsers with Web Workers. For SharedArrayBuffer features, requires:
- HTTPS (secure context)
- COOP/COEP headers: `Cross-Origin-Opener-Policy: same-origin` and `Cross-Origin-Embedder-Policy: require-corp`

## Build Scripts

Located in `scripts/`:
- `build-js.mjs` - Main build script for JS and TS compilation
- `build-wasm.mjs` - AssemblyScript to WASM compilation
- `generate-wasm-bindings.mjs` - Generate WASM JS bindings
- `validate-wasm.mjs` - Validate WASM output

## Configuration Files

- `rollup.config.mjs` - Rollup bundler config for JS builds
- `tsconfig.json` - Main TypeScript config (noEmit for type checking)
- `tsconfig.build.json` - TypeScript build config (emits to dist/ts/)
- `tsconfig.rollup.json` - TypeScript config for rollup builds
- `asconfig.json` - AssemblyScript compiler config
- `vitest.config.ts` - Vitest test configuration (test/ts/)
- `.mocharc.js` - Mocha test configuration (test/js/)

## Documentation

The `docs/` directory contains additional documentation:
- `architecture/` - High-level architecture, components, data flow, poolifier comparison
- `planning/` - Improvement roadmap, sprint tracking (Phase 1 & 2), protocol designs
- Runtime guides: `BROWSER_SUPPORT.md`, `NODE_SUPPORT.md`, `BUN_COMPATIBILITY.md`
- `BREAKING_CHANGES.md`, `MIGRATION_v10_to_v11.md`, `LIBRARY_INTEGRATION.md`

## Development Workflow

### Type Checking

```bash
npm run typecheck          # Check TypeScript types in src/ts/
npm run typecheck:wasm     # Check AssemblyScript types
```

### Watching for Changes

```bash
npm run watch              # Watch JS build (rollup)
npm run watch:wasm         # Watch WASM build
npm run build:js:watch     # Watch JS build
npm run build:ts:watch     # Watch TS build
```

### Build & Publish

```bash
# Correct workflow
1. npm run build              # Build library
2. npm test                   # Run all tests
3. git add -A && git commit   # Commit changes
4. npm publish                # Publish to npm
5. git tag v1.2.3 && git push --tags  # Tag release
```

### Commit Convention

Use conventional commits: `feat:`, `fix:`, `docs:`, `perf:`, `test:`, `chore:`

### Cleanup Before Committing

Remove temporary debug/test artifacts before committing:
- Temporary test scripts (`test-*.js`, `debug-*.js`)
- Runtime artifacts (`.error.txt`, etc.)
- Check `git status` before committing

## Examples

The `examples/` directory contains usage examples: offloading functions, dedicated workers, proxy pattern, async, abort/cleanup, priority queues, transferable objects, and bundler integrations (esbuild, vite, webpack5).

## Performance Benchmarks

The TS+WASM build provides significant performance improvements:

**Node.js Benchmarks:**
- Pool creation: 2.32x faster
- Concurrent tasks: 1.30x faster
- Queue throughput: 1.32x faster

**Bun Benchmarks:**
- Queue throughput: 1.57x faster
- Pool creation: 1.36x faster
- Concurrent tasks: 1.11x faster

Run benchmarks: `node benchmark.mjs`

## Common Issues

### WASM Build Failures
If WASM builds fail, ensure AssemblyScript is installed: `npm install assemblyscript`

### Worker Path Issues
Always use absolute paths for worker scripts: `__dirname + '/myWorker.js'`

### SharedArrayBuffer Not Available
SharedArrayBuffer requires secure context (HTTPS) and proper COOP/COEP headers in browsers.

### Type Definition Issues
If types are out of sync, run `npm run build:types` to regenerate.

### Bun child_process Issues
If using Bun and experiencing IPC timeouts, always use `workerType: 'thread'` instead of `workerType: 'process'`.

## API Reference

See `docs/` and `examples/` for:
- Pool creation and task execution patterns
- TypeScript API exports (`workerpool/minimal`, `workerpool/modern`, `workerpool/full`)
- Session support and graceful degradation
- Advanced pool with worker choice strategies and work stealing
- Parallel array operations (map, reduce, filter, find, etc.)

## Development Tools (`tools/`)

### chunking-for-files

Splits large files into editable chunks and merges them back. Useful for editing large files section-by-section.

```bash
# Split a file into chunks
bun tools/chunking-for-files/index.ts split <file> [options]

# Merge chunks back
bun tools/chunking-for-files/index.ts merge <manifest.json>

# Check status of chunks
bun tools/chunking-for-files/index.ts status <manifest.json>
```

Supports:
- **Markdown** - Splits by heading level (##, ###, etc.)
- **JSON** - Splits by top-level object keys
- **TypeScript/JavaScript** - Splits by declarations (imports, functions, classes, types, etc.)

### compress-for-context

Compresses files for LLM context windows using format-specific strategies. Reduces token usage when sharing code/docs with AI.

```bash
npx tsx tools/compress-for-context/compress-for-context.ts <input> [options]

# Options:
#   -l, --level <lvl>    light | medium | aggressive (default: medium)
#   -f, --format <fmt>   json | yaml | markdown | csv | typescript | xml | html | auto
#   -d, --decompress     Restore a .compact file to original
#   -b, --batch          Process multiple files
#   --dry-run            Preview without writing
```

Compression strategies by format:
- **JSON** - Key abbreviation with legend, minification (~50% savings)
- **Markdown** - Substring compression, whitespace normalization
- **TypeScript/JavaScript** - Comment removal, whitespace normalization (~25% savings)
- **CSV/TSV** - Header and value abbreviation

### create-dependency-graph

Generates comprehensive dependency documentation for the TypeScript codebase.

```bash
npm run deps                # Quick alias
npx tsx tools/create-dependency-graph/create-dependency-graph.ts [project-root]
```

Outputs:
- `docs/architecture/DEPENDENCY_GRAPH.md` - Human-readable documentation
- `docs/architecture/dependency-graph.json` - Full machine-readable graph
- `docs/architecture/dependency-graph.yaml` - Compact YAML (~40% smaller than JSON)
- `docs/architecture/dependency-summary.compact.json` - CTON-style for LLM consumption (~10KB)
- `docs/architecture/unused-analysis.md` - Unused files and exports report

Features:
- Circular dependency detection (distinguishes runtime vs type-only cycles)
- Unused file and export detection
- Mermaid diagram generation
- Statistics (LOC, exports, classes, interfaces, functions, etc.)
