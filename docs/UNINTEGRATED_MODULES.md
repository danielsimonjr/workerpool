# Unintegrated Modules Report

Generated: 2024-12-24
Updated: 2024-12-24 (Post-Audit)

This document lists all TypeScript modules that are exported from `full.ts` but NOT fully integrated into the core Pool/AdvancedPool execution pipeline.

## Audit Summary

| Category | Count | Status |
|----------|-------|--------|
| **REMOVED** (Dead code) | 5 | Deleted |
| Fully Integrated | 15 | Keep |
| Optional/Advanced | 9 | Keep for future use |
| WASM (Working) | 14+ | Keep as experimental |
| High-Value to Integrate | 4 | **TODO** |

---

## REMOVED (Dead Code - Deleted)

These modules were removed during the audit due to overlap or being misleading:

| Module | File | Reason |
|--------|------|--------|
| ~~SIMDProcessor~~ | ~~core/simd-processor.ts~~ | **MISLEADING**: Claimed "SIMD-accelerated" but was just regular JS loops |
| ~~SIMDProcessor~~ | ~~wasm/simd-processor.ts~~ | **DUPLICATE**: WASM version also removed |
| ~~StructuredCloneOptimizer~~ | ~~platform/structured-clone.ts~~ | **OVERLAPS**: Duplicates auto-transfer.ts functionality |
| ~~HealthMonitor~~ | ~~workers/health-monitor.ts~~ | **OVERLAPS**: Duplicates core/heartbeat.ts |
| ~~IdleRecycler~~ | ~~workers/recycler.ts~~ | **OVERLAPS**: Duplicates WorkerCache recycling |
| ~~WorkerAffinity~~ | ~~workers/affinity.ts~~ | **OVERLAPS**: Duplicates core/task-affinity.ts (used by AdvancedPool) |

---

## HIGH-VALUE TO INTEGRATE (TODO)

These modules are well-implemented and would provide real value if integrated into Pool.ts:

| Module | File | Lines | Verdict | Integration Target |
|--------|------|-------|---------|-------------------|
| **HeartbeatMonitor** | `core/heartbeat.ts` | ~450 | **INTEGRATE** | WorkerHandler - detect frozen workers |
| **FunctionCache** | `core/function-cache.ts` | ~440 | **INTEGRATE** | Pool.exec() - avoid repeated eval() |
| **KWayMerge** | `core/k-way-merge.ts` | ~505 | **INTEGRATE** | parallel-processing.ts reinvents this |
| **AutoTransfer** | `core/auto-transfer.ts` | ~468 | **INTEGRATE** | Pool.exec() - auto-detect transferables |

### Integration Steps Needed:

1. **HeartbeatMonitor**:
   - Add to WorkerHandler to ping workers periodically
   - Replace frozen workers automatically

2. **FunctionCache**:
   - Use in parallel-processing.ts to cache compiled functions
   - Reduces eval() overhead for repeated map/reduce operations

3. **KWayMerge**:
   - Use in parallel-processing.ts for merging sorted results
   - Current inline implementation is less efficient

4. **AutoTransfer**:
   - Integrate into Pool.exec() transfer detection
   - Enable zero-copy transfers automatically

---

## OPTIONAL/ADVANCED (Keep for Future Use)

These modules are well-implemented but specialized. Keep for advanced users:

### Core Utilities
| Module | File | Lines | Notes |
|--------|------|-------|-------|
| **BinarySerializer** | `core/binary-serializer.ts` | ~650 | 10x faster for numeric data, specialized |
| **WorkerBitmap** | `core/worker-bitmap.ts` | ~500 | O(1) lookup only valuable at >32 workers |
| **BatchSerializer** | `core/batch-serializer.ts` | ~424 | Could optimize batch-executor |

### Platform Utilities
| Module | File | Lines | Notes |
|--------|------|-------|-------|
| **MessageBatcher** | `platform/message-batcher.ts` | ~457 | Reduces high-frequency messaging overhead |
| **ChannelFactory** | `platform/channel-factory.ts` | ~479 | Abstraction for channel types |
| **ResultStream** | `platform/result-stream.ts` | ~605 | For very large streaming results |
| **SharedMemoryChannel** | `platform/shared-memory.ts` | ~617 | Requires COOP/COEP headers |

### Worker Management
| Module | File | Lines | Notes |
|--------|------|-------|-------|
| **AdaptiveScaler** | `workers/adaptive-scaler.ts` | ~410 | Dynamic worker scaling |
| **WorkerCache** | `workers/WorkerCache.ts` | ~480 | Pre-warmed workers |

---

## WASM MODULES (Keep as Experimental)

WASM builds and works correctly but is 4-5x slower than TypeScript for single-threaded operations.

### Assembly Source (Compiles Successfully)
- All 14 AssemblyScript modules compile to ~12KB WASM
- Tests exist but use TypeScript stubs, not real WASM

### WASM Bridge (Working)
| Module | File | Status |
|--------|------|--------|
| **WasmBridge** | `wasm/WasmBridge.ts` | Working |
| **WasmTaskQueue** | `wasm/WasmTaskQueue.ts` | Working, documented slower |
| **WasmLoader** | `wasm/WasmLoader.ts` | Working |
| **EmbeddedWasmLoader** | `wasm/EmbeddedWasmLoader.ts` | Working |
| **feature-detection** | `wasm/feature-detection.ts` | Working |

### When to Use WASM
- Multi-worker shared memory access with lock-free atomics
- Cross-thread queue sharing via SharedArrayBuffer
- NOT for single-pool typical usage (FIFO is faster)

---

## FULLY INTEGRATED (Reference)

These modules ARE properly integrated and used:

| Module | File | Used By |
|--------|------|---------|
| Pool | `core/Pool.ts` | Entry point |
| AdvancedPool | `core/AdvancedPool.ts` | Extends Pool |
| WorkerHandler | `core/WorkerHandler.ts` | Pool |
| Promise | `core/Promise.ts` | Pool, WorkerHandler |
| TaskQueue (FIFO/LIFO) | `core/TaskQueue.ts` | Pool |
| CircularBuffer | `core/circular-buffer.ts` | FIFOQueue |
| BatchExecutor | `core/batch-executor.ts` | Pool.execBatch |
| ParallelProcessing | `core/parallel-processing.ts` | Pool.map/reduce |
| MainThreadExecutor | `core/main-thread-executor.ts` | Fallback |
| DebugPortAllocator | `core/debug-port-allocator.ts` | Pool |
| ValidateOptions | `core/validateOptions.ts` | Pool |
| Environment | `platform/environment.ts` | Pool, WorkerHandler |
| Transfer | `platform/transfer.ts` | Pool.exec |
| TransferDetection | `platform/transfer-detection.ts` | Transfer |
| Capabilities | `platform/capabilities.ts` | Environment |
| WorkerChoiceStrategies | `core/worker-choice-strategies.ts` | AdvancedPool |
| WorkStealingScheduler | `core/work-stealing.ts` | AdvancedPool |
| TaskAffinityRouter | `core/task-affinity.ts` | AdvancedPool |
| SessionManager | `core/session-manager.ts` | Pool |

---

## Next Steps

1. **Priority 1**: Integrate HeartbeatMonitor into WorkerHandler
2. **Priority 2**: Integrate FunctionCache into parallel-processing
3. **Priority 3**: Integrate AutoTransfer into Pool.exec()
4. **Priority 4**: Add benchmarks proving work-stealing/affinity improvements

---

## File Counts (Post-Audit)

```
Total TypeScript files:     86 (was 91, removed 5)
Fully integrated:           19 (21%)
High-value to integrate:     4 (5%)
Optional/advanced:           9 (10%)
WASM (working):             14 (16%)
Types/interfaces:           10 (12%)
Entry points:                4 (5%)
Other utilities:            26 (30%)
```
