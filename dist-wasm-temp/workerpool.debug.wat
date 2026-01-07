(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (result i32)))
 (type $2 (func))
 (type $3 (func (param i32)))
 (type $4 (func (result i64)))
 (type $5 (func (param i32 i32)))
 (type $6 (func (param i32 i32) (result i32)))
 (type $7 (func (param i64) (result i32)))
 (type $8 (func (result f64)))
 (type $9 (func (param i32) (result i64)))
 (type $10 (func (param i32 i32 i32)))
 (type $11 (func (param i32 i32 f32) (result i32)))
 (type $12 (func (param i32 i32 i32) (result i32)))
 (type $13 (func (param i32 i32 i32 i32)))
 (type $14 (func (param i32 i32) (result i64)))
 (type $15 (func (param f64)))
 (type $16 (func (param i32 i32) (result f32)))
 (type $17 (func (param i32 i64)))
 (type $18 (func (param i32 i32) (result f64)))
 (type $19 (func (param i32 i32 i32 f32)))
 (type $20 (func (param i32 i64 i64) (result i32)))
 (type $21 (func (param i32 f64)))
 (type $22 (func (param i32) (result f64)))
 (type $23 (func (param f64 i32) (result i32)))
 (type $24 (func (param f64) (result f64)))
 (type $25 (func (param i32 i32 i32) (result f32)))
 (type $26 (func (param i32 i32 i32 f32 f32)))
 (type $27 (func (param i32 i32 i32 f64)))
 (type $28 (func (param i32 i32 f32 i32 i32) (result i32)))
 (import "env" "memory" (memory $0 16 256 shared))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (global $src/ts/assembly/memory/HEADER_SIZE i32 (i32.const 64))
 (global $src/ts/assembly/memory/SLOT_SIZE i32 (i32.const 64))
 (global $src/ts/assembly/memory/DEFAULT_CAPACITY i32 (i32.const 1024))
 (global $src/ts/assembly/memory/CACHE_LINE_SIZE i32 (i32.const 64))
 (global $src/ts/assembly/memory/HEADER_MAGIC_OFFSET i32 (i32.const 0))
 (global $src/ts/assembly/memory/HEADER_VERSION_OFFSET i32 (i32.const 4))
 (global $src/ts/assembly/memory/HEADER_HEAD_OFFSET i32 (i32.const 8))
 (global $src/ts/assembly/memory/HEADER_TAIL_OFFSET i32 (i32.const 16))
 (global $src/ts/assembly/memory/HEADER_CAPACITY_OFFSET i32 (i32.const 24))
 (global $src/ts/assembly/memory/HEADER_MASK_OFFSET i32 (i32.const 28))
 (global $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET i32 (i32.const 32))
 (global $src/ts/assembly/memory/HEADER_SLOTS_BASE_OFFSET i32 (i32.const 40))
 (global $src/ts/assembly/memory/MAGIC_NUMBER i32 (i32.const 1464880972))
 (global $src/ts/assembly/memory/VERSION i32 (i32.const 1))
 (global $src/ts/assembly/ring-buffer/ENTRY_EMPTY i64 (i64.const 0))
 (global $src/ts/assembly/task-slots/SLOT_STATE_OFFSET i32 (i32.const 0))
 (global $src/ts/assembly/task-slots/SLOT_NEXT_OR_ID_OFFSET i32 (i32.const 4))
 (global $src/ts/assembly/task-slots/SLOT_PRIORITY_OFFSET i32 (i32.const 8))
 (global $src/ts/assembly/task-slots/SLOT_TIMESTAMP_OFFSET i32 (i32.const 16))
 (global $src/ts/assembly/task-slots/SLOT_METHOD_OFFSET i32 (i32.const 24))
 (global $src/ts/assembly/task-slots/SLOT_REFCOUNT_OFFSET i32 (i32.const 28))
 (global $src/ts/assembly/task-slots/SLOT_FREE i32 (i32.const 0))
 (global $src/ts/assembly/task-slots/SLOT_ALLOCATED i32 (i32.const 1))
 (global $src/ts/assembly/task-slots/FREE_LIST_END i32 (i32.const -1))
 (global $src/ts/assembly/task-slots/FREE_LIST_HEAD_OFFSET i32 (i32.const 48))
 (global $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET i32 (i32.const 52))
 (global $src/ts/assembly/priority-queue/PQ_HEAP_BASE_OFFSET i32 (i32.const 56))
 (global $src/ts/assembly/priority-queue/HEAP_ENTRY_SIZE i32 (i32.const 8))
 (global $src/ts/assembly/circular-buffer/BUFFER_CAPACITY_OFFSET i32 (i32.const 0))
 (global $src/ts/assembly/circular-buffer/BUFFER_SIZE_OFFSET i32 (i32.const 4))
 (global $src/ts/assembly/circular-buffer/BUFFER_HEAD_OFFSET i32 (i32.const 8))
 (global $src/ts/assembly/circular-buffer/BUFFER_TAIL_OFFSET i32 (i32.const 12))
 (global $src/ts/assembly/circular-buffer/BUFFER_DATA_OFFSET i32 (i32.const 16))
 (global $src/ts/assembly/circular-buffer/bufferCapacity (mut i32) (i32.const 0))
 (global $src/ts/assembly/circular-buffer/bufferMask (mut i32) (i32.const 0))
 (global $src/ts/assembly/circular-buffer/bufferSize (mut i32) (i32.const 0))
 (global $src/ts/assembly/circular-buffer/bufferHead (mut i32) (i32.const 0))
 (global $src/ts/assembly/circular-buffer/bufferTail (mut i32) (i32.const 0))
 (global $src/ts/assembly/errors/SUCCESS i32 (i32.const 0))
 (global $src/ts/assembly/errors/ERR_MEMORY_NOT_INITIALIZED i32 (i32.const 1))
 (global $src/ts/assembly/errors/ERR_MEMORY_VALIDATION_FAILED i32 (i32.const 2))
 (global $src/ts/assembly/errors/ERR_OUT_OF_MEMORY i32 (i32.const 3))
 (global $src/ts/assembly/errors/ERR_INVALID_ADDRESS i32 (i32.const 4))
 (global $src/ts/assembly/errors/ERR_MEMORY_ALREADY_INITIALIZED i32 (i32.const 5))
 (global $src/ts/assembly/errors/ERR_QUEUE_FULL i32 (i32.const 100))
 (global $src/ts/assembly/errors/ERR_QUEUE_EMPTY i32 (i32.const 101))
 (global $src/ts/assembly/errors/ERR_QUEUE_OP_FAILED i32 (i32.const 102))
 (global $src/ts/assembly/errors/ERR_INVALID_CAPACITY i32 (i32.const 103))
 (global $src/ts/assembly/errors/ERR_NO_FREE_SLOTS i32 (i32.const 200))
 (global $src/ts/assembly/errors/ERR_INVALID_SLOT_INDEX i32 (i32.const 201))
 (global $src/ts/assembly/errors/ERR_SLOT_ALREADY_FREE i32 (i32.const 202))
 (global $src/ts/assembly/errors/ERR_SLOT_NOT_ALLOCATED i32 (i32.const 203))
 (global $src/ts/assembly/errors/ERR_CAS_FAILED i32 (i32.const 300))
 (global $src/ts/assembly/errors/ERR_DEADLOCK i32 (i32.const 301))
 (global $src/ts/assembly/errors/ERR_MAX_RETRIES i32 (i32.const 302))
 (global $src/ts/assembly/errors/INVALID_SLOT i32 (i32.const -1))
 (global $src/ts/assembly/errors/INVALID_ENTRY i64 (i64.const 0))
 (global $src/ts/assembly/stats/STATS_BASE_OFFSET i32 (i32.const 128))
 (global $src/ts/assembly/stats/STATS_PUSH_COUNT_OFFSET i32 (i32.const 128))
 (global $src/ts/assembly/stats/STATS_POP_COUNT_OFFSET i32 (i32.const 136))
 (global $src/ts/assembly/stats/STATS_PUSH_FAILURES_OFFSET i32 (i32.const 144))
 (global $src/ts/assembly/stats/STATS_POP_FAILURES_OFFSET i32 (i32.const 152))
 (global $src/ts/assembly/stats/STATS_CAS_RETRIES_OFFSET i32 (i32.const 160))
 (global $src/ts/assembly/stats/STATS_ALLOC_COUNT_OFFSET i32 (i32.const 168))
 (global $src/ts/assembly/stats/STATS_FREE_COUNT_OFFSET i32 (i32.const 176))
 (global $src/ts/assembly/stats/STATS_PEAK_SIZE_OFFSET i32 (i32.const 184))
 (global $src/ts/assembly/stats/STATS_PEAK_ALLOCATED_OFFSET i32 (i32.const 188))
 (global $src/ts/assembly/atomics/MAX_CAS_RETRIES i32 (i32.const 1000))
 (global $src/ts/assembly/atomics/LOCK_FREE i32 (i32.const 0))
 (global $src/ts/assembly/atomics/LOCK_HELD i32 (i32.const 1))
 (global $src/ts/assembly/histogram/HISTOGRAM_BASE_OFFSET i32 (i32.const 256))
 (global $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET i32 (i32.const 256))
 (global $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET i32 (i32.const 260))
 (global $src/ts/assembly/histogram/HIST_SUM_OFFSET i32 (i32.const 272))
 (global $src/ts/assembly/histogram/HIST_MIN_OFFSET i32 (i32.const 280))
 (global $src/ts/assembly/histogram/HIST_MAX_OFFSET i32 (i32.const 288))
 (global $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET i32 (i32.const 296))
 (global $src/ts/assembly/histogram/HIST_METADATA_SIZE i32 (i32.const 64))
 (global $src/ts/assembly/histogram/HIST_BUCKETS_OFFSET i32 (i32.const 320))
 (global $src/ts/assembly/histogram/MAX_HISTOGRAM_BUCKETS i32 (i32.const 32))
 (global $src/ts/assembly/histogram/BUCKET_COUNTS_SIZE i32 (i32.const 264))
 (global $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET i32 (i32.const 584))
 (global $src/ts/assembly/histogram/DEFAULT_BOUNDARIES i32 (i32.const 32))
 (global $src/ts/assembly/simd-batch/F32_LANES i32 (i32.const 4))
 (global $src/ts/assembly/simd-batch/F64_LANES i32 (i32.const 2))
 (global $src/ts/assembly/simd-batch/I32_LANES i32 (i32.const 4))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Stub i32 (i32.const 0))
 (global $~lib/shared/runtime/Runtime.Minimal i32 (i32.const 1))
 (global $~lib/shared/runtime/Runtime.Incremental i32 (i32.const 2))
 (global $~lib/builtins/f64.MAX_VALUE f64 (f64.const 1797693134862315708145274e284))
 (global $~lib/builtins/f64.MIN_VALUE f64 (f64.const 5e-324))
 (global $~lib/builtins/f32.MAX_VALUE f32 (f32.const 3402823466385288598117041e14))
 (global $~lib/builtins/f32.MIN_VALUE f32 (f32.const 1.401298464324817e-45))
 (global $~lib/rt/stub/startOffset (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 272))
 (global $~lib/memory/__data_end i32 (i32.const 296))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 33064))
 (global $~lib/memory/__heap_base i32 (i32.const 33064))
 (global $~started (mut i32) (i32.const 0))
 (data $0 (i32.const 12) "|\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00`\00\00\00\00\00\00\00\00\00\f0?\00\00\00\00\00\00\14@\00\00\00\00\00\00$@\00\00\00\00\00\009@\00\00\00\00\00\00I@\00\00\00\00\00\00Y@\00\00\00\00\00@o@\00\00\00\00\00@\7f@\00\00\00\00\00@\8f@\00\00\00\00\00\88\a3@\00\00\00\00\00\88\b3@\00\00\00\00\00\88\c3@\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 140) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $2 (i32.const 204) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 272) "\05\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00$\1a\00\00")
 (table $0 1 1 funcref)
 (elem $0 (i32.const 1))
 (export "HEADER_SIZE" (global $src/ts/assembly/memory/HEADER_SIZE))
 (export "SLOT_SIZE" (global $src/ts/assembly/memory/SLOT_SIZE))
 (export "DEFAULT_CAPACITY" (global $src/ts/assembly/memory/DEFAULT_CAPACITY))
 (export "CACHE_LINE_SIZE" (global $src/ts/assembly/memory/CACHE_LINE_SIZE))
 (export "HEADER_MAGIC_OFFSET" (global $src/ts/assembly/memory/HEADER_MAGIC_OFFSET))
 (export "HEADER_VERSION_OFFSET" (global $src/ts/assembly/memory/HEADER_VERSION_OFFSET))
 (export "HEADER_HEAD_OFFSET" (global $src/ts/assembly/memory/HEADER_HEAD_OFFSET))
 (export "HEADER_TAIL_OFFSET" (global $src/ts/assembly/memory/HEADER_TAIL_OFFSET))
 (export "HEADER_CAPACITY_OFFSET" (global $src/ts/assembly/memory/HEADER_CAPACITY_OFFSET))
 (export "HEADER_MASK_OFFSET" (global $src/ts/assembly/memory/HEADER_MASK_OFFSET))
 (export "HEADER_ALLOCATED_OFFSET" (global $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET))
 (export "HEADER_SLOTS_BASE_OFFSET" (global $src/ts/assembly/memory/HEADER_SLOTS_BASE_OFFSET))
 (export "MAGIC_NUMBER" (global $src/ts/assembly/memory/MAGIC_NUMBER))
 (export "VERSION" (global $src/ts/assembly/memory/VERSION))
 (export "isPowerOf2" (func $src/ts/assembly/memory/isPowerOf2))
 (export "nextPowerOf2" (func $src/ts/assembly/memory/nextPowerOf2))
 (export "calculateMemorySize" (func $src/ts/assembly/memory/calculateMemorySize))
 (export "initMemory" (func $src/ts/assembly/memory/initMemory))
 (export "validateMemory" (func $src/ts/assembly/memory/validateMemory))
 (export "getCapacity" (func $src/ts/assembly/memory/getCapacity))
 (export "getMask" (func $src/ts/assembly/memory/getMask))
 (export "getSlotsBase" (func $src/ts/assembly/memory/getSlotsBase))
 (export "getHead" (func $src/ts/assembly/memory/getHead))
 (export "getTail" (func $src/ts/assembly/memory/getTail))
 (export "getSlotAddress" (func $src/ts/assembly/memory/getSlotAddress))
 (export "packEntry" (func $src/ts/assembly/ring-buffer/packEntry))
 (export "unpackSlotIndex" (func $src/ts/assembly/ring-buffer/unpackSlotIndex))
 (export "unpackPriority" (func $src/ts/assembly/ring-buffer/unpackPriority))
 (export "push" (func $src/ts/assembly/ring-buffer/push@varargs))
 (export "pop" (func $src/ts/assembly/ring-buffer/pop))
 (export "size" (func $src/ts/assembly/ring-buffer/size))
 (export "isEmpty" (func $src/ts/assembly/ring-buffer/isEmpty))
 (export "isFull" (func $src/ts/assembly/ring-buffer/isFull))
 (export "clear" (func $src/ts/assembly/ring-buffer/clear))
 (export "contains" (func $src/ts/assembly/ring-buffer/contains))
 (export "initTaskSlots" (func $src/ts/assembly/task-slots/initTaskSlots))
 (export "allocateSlot" (func $src/ts/assembly/task-slots/allocateSlot))
 (export "freeSlot" (func $src/ts/assembly/task-slots/freeSlot))
 (export "setTaskId" (func $src/ts/assembly/task-slots/setTaskId))
 (export "getTaskId" (func $src/ts/assembly/task-slots/getTaskId))
 (export "setPriority" (func $src/ts/assembly/task-slots/setPriority))
 (export "getPriority" (func $src/ts/assembly/task-slots/getPriority))
 (export "setTimestamp" (func $src/ts/assembly/task-slots/setTimestamp))
 (export "getTimestamp" (func $src/ts/assembly/task-slots/getTimestamp))
 (export "setMethodId" (func $src/ts/assembly/task-slots/setMethodId))
 (export "getMethodId" (func $src/ts/assembly/task-slots/getMethodId))
 (export "addRef" (func $src/ts/assembly/task-slots/addRef))
 (export "release" (func $src/ts/assembly/task-slots/release))
 (export "getRefCount" (func $src/ts/assembly/task-slots/getRefCount))
 (export "getAllocatedCount" (func $src/ts/assembly/task-slots/getAllocatedCount))
 (export "isAllocated" (func $src/ts/assembly/task-slots/isAllocated))
 (export "initPriorityQueue" (func $src/ts/assembly/priority-queue/initPriorityQueue))
 (export "getPriorityQueueSize" (func $src/ts/assembly/priority-queue/getPriorityQueueSize))
 (export "isPriorityQueueEmpty" (func $src/ts/assembly/priority-queue/isPriorityQueueEmpty))
 (export "priorityQueuePush" (func $src/ts/assembly/priority-queue/priorityQueuePush))
 (export "priorityQueuePop" (func $src/ts/assembly/priority-queue/priorityQueuePop))
 (export "priorityQueuePeek" (func $src/ts/assembly/priority-queue/priorityQueuePeek))
 (export "priorityQueuePeekPriority" (func $src/ts/assembly/priority-queue/priorityQueuePeekPriority))
 (export "priorityQueueClear" (func $src/ts/assembly/priority-queue/priorityQueueClear))
 (export "isPriorityQueueFull" (func $src/ts/assembly/priority-queue/isPriorityQueueFull))
 (export "initBuffer" (func $src/ts/assembly/circular-buffer/initBuffer))
 (export "getBufferCapacity" (func $src/ts/assembly/circular-buffer/getBufferCapacity))
 (export "getBufferSize" (func $src/ts/assembly/circular-buffer/getBufferSize))
 (export "pushGrowable" (func $src/ts/assembly/circular-buffer/pushGrowable))
 (export "pushWithEviction" (func $src/ts/assembly/circular-buffer/pushWithEviction))
 (export "shift" (func $src/ts/assembly/circular-buffer/shift))
 (export "peekHead" (func $src/ts/assembly/circular-buffer/peekHead))
 (export "peekTail" (func $src/ts/assembly/circular-buffer/peekTail))
 (export "at" (func $src/ts/assembly/circular-buffer/at))
 (export "drain" (func $src/ts/assembly/circular-buffer/drain))
 (export "getStats" (func $src/ts/assembly/circular-buffer/getStats))
 (export "logicalToPhysical" (func $src/ts/assembly/circular-buffer/logicalToPhysical))
 (export "getBufferMask" (func $src/ts/assembly/circular-buffer/getBufferMask))
 (export "SUCCESS" (global $src/ts/assembly/errors/SUCCESS))
 (export "ERR_MEMORY_NOT_INITIALIZED" (global $src/ts/assembly/errors/ERR_MEMORY_NOT_INITIALIZED))
 (export "ERR_MEMORY_VALIDATION_FAILED" (global $src/ts/assembly/errors/ERR_MEMORY_VALIDATION_FAILED))
 (export "ERR_OUT_OF_MEMORY" (global $src/ts/assembly/errors/ERR_OUT_OF_MEMORY))
 (export "ERR_INVALID_ADDRESS" (global $src/ts/assembly/errors/ERR_INVALID_ADDRESS))
 (export "ERR_MEMORY_ALREADY_INITIALIZED" (global $src/ts/assembly/errors/ERR_MEMORY_ALREADY_INITIALIZED))
 (export "ERR_QUEUE_FULL" (global $src/ts/assembly/errors/ERR_QUEUE_FULL))
 (export "ERR_QUEUE_EMPTY" (global $src/ts/assembly/errors/ERR_QUEUE_EMPTY))
 (export "ERR_QUEUE_OP_FAILED" (global $src/ts/assembly/errors/ERR_QUEUE_OP_FAILED))
 (export "ERR_INVALID_CAPACITY" (global $src/ts/assembly/errors/ERR_INVALID_CAPACITY))
 (export "ERR_NO_FREE_SLOTS" (global $src/ts/assembly/errors/ERR_NO_FREE_SLOTS))
 (export "ERR_INVALID_SLOT_INDEX" (global $src/ts/assembly/errors/ERR_INVALID_SLOT_INDEX))
 (export "ERR_SLOT_ALREADY_FREE" (global $src/ts/assembly/errors/ERR_SLOT_ALREADY_FREE))
 (export "ERR_SLOT_NOT_ALLOCATED" (global $src/ts/assembly/errors/ERR_SLOT_NOT_ALLOCATED))
 (export "ERR_CAS_FAILED" (global $src/ts/assembly/errors/ERR_CAS_FAILED))
 (export "ERR_DEADLOCK" (global $src/ts/assembly/errors/ERR_DEADLOCK))
 (export "ERR_MAX_RETRIES" (global $src/ts/assembly/errors/ERR_MAX_RETRIES))
 (export "INVALID_SLOT" (global $src/ts/assembly/errors/INVALID_SLOT))
 (export "INVALID_ENTRY" (global $src/ts/assembly/errors/INVALID_ENTRY))
 (export "packResult" (func $src/ts/assembly/errors/packResult))
 (export "unpackErrorCode" (func $src/ts/assembly/errors/unpackErrorCode))
 (export "unpackValue" (func $src/ts/assembly/errors/unpackValue))
 (export "isSuccess" (func $src/ts/assembly/errors/isSuccess))
 (export "successResult" (func $src/ts/assembly/errors/successResult))
 (export "errorResult" (func $src/ts/assembly/errors/errorResult))
 (export "initStats" (func $src/ts/assembly/stats/initStats))
 (export "recordPush" (func $src/ts/assembly/stats/recordPush))
 (export "recordPop" (func $src/ts/assembly/stats/recordPop))
 (export "recordPushFailure" (func $src/ts/assembly/stats/recordPushFailure))
 (export "recordPopFailure" (func $src/ts/assembly/stats/recordPopFailure))
 (export "recordCASRetry" (func $src/ts/assembly/stats/recordCASRetry))
 (export "recordAllocation" (func $src/ts/assembly/stats/recordAllocation))
 (export "recordFree" (func $src/ts/assembly/stats/recordFree))
 (export "updatePeakSize" (func $src/ts/assembly/stats/updatePeakSize))
 (export "updatePeakAllocated" (func $src/ts/assembly/stats/updatePeakAllocated))
 (export "getPushCount" (func $src/ts/assembly/stats/getPushCount))
 (export "getPopCount" (func $src/ts/assembly/stats/getPopCount))
 (export "getPushFailures" (func $src/ts/assembly/stats/getPushFailures))
 (export "getPopFailures" (func $src/ts/assembly/stats/getPopFailures))
 (export "getCASRetries" (func $src/ts/assembly/stats/getCASRetries))
 (export "getAllocationCount" (func $src/ts/assembly/stats/getAllocationCount))
 (export "getFreeCount" (func $src/ts/assembly/stats/getFreeCount))
 (export "getPeakSize" (func $src/ts/assembly/stats/getPeakSize))
 (export "getPeakAllocated" (func $src/ts/assembly/stats/getPeakAllocated))
 (export "resetStats" (func $src/ts/assembly/stats/resetStats))
 (export "MAX_CAS_RETRIES" (global $src/ts/assembly/atomics/MAX_CAS_RETRIES))
 (export "tryLock" (func $src/ts/assembly/atomics/tryLock))
 (export "acquireLock" (func $src/ts/assembly/atomics/acquireLock@varargs))
 (export "releaseLock" (func $src/ts/assembly/atomics/releaseLock))
 (export "atomicIncrement" (func $src/ts/assembly/atomics/atomicIncrement))
 (export "atomicDecrement" (func $src/ts/assembly/atomics/atomicDecrement))
 (export "atomicIncrement64" (func $src/ts/assembly/atomics/atomicIncrement64))
 (export "atomicDecrement64" (func $src/ts/assembly/atomics/atomicDecrement64))
 (export "atomicCompareExchange32" (func $src/ts/assembly/atomics/atomicCompareExchange32))
 (export "atomicCompareExchange64" (func $src/ts/assembly/atomics/atomicCompareExchange64))
 (export "atomicLoad32" (func $src/ts/assembly/atomics/atomicLoad32))
 (export "atomicLoad64" (func $src/ts/assembly/atomics/atomicLoad64))
 (export "atomicStore32" (func $src/ts/assembly/atomics/atomicStore32))
 (export "atomicStore64" (func $src/ts/assembly/atomics/atomicStore64))
 (export "atomicMax32" (func $src/ts/assembly/atomics/atomicMax32))
 (export "atomicMin32" (func $src/ts/assembly/atomics/atomicMin32))
 (export "memoryFence" (func $src/ts/assembly/atomics/memoryFence))
 (export "seqlockWriteBegin" (func $src/ts/assembly/atomics/seqlockWriteBegin))
 (export "seqlockWriteEnd" (func $src/ts/assembly/atomics/seqlockWriteEnd))
 (export "seqlockReadBegin" (func $src/ts/assembly/atomics/seqlockReadBegin))
 (export "seqlockReadValidate" (func $src/ts/assembly/atomics/seqlockReadValidate))
 (export "MAX_HISTOGRAM_BUCKETS" (global $src/ts/assembly/histogram/MAX_HISTOGRAM_BUCKETS))
 (export "initHistogram" (func $src/ts/assembly/histogram/initHistogram))
 (export "initHistogramWithBuckets" (func $src/ts/assembly/histogram/initHistogramWithBuckets))
 (export "setBucketBoundary" (func $src/ts/assembly/histogram/setBucketBoundary))
 (export "getBucketBoundary" (func $src/ts/assembly/histogram/getBucketBoundary))
 (export "recordValue" (func $src/ts/assembly/histogram/recordValue))
 (export "getBucketCount" (func $src/ts/assembly/histogram/getBucketCount))
 (export "getTotalCount" (func $src/ts/assembly/histogram/getTotalCount))
 (export "getSum" (func $src/ts/assembly/histogram/getSum))
 (export "getMin" (func $src/ts/assembly/histogram/getMin))
 (export "getMax" (func $src/ts/assembly/histogram/getMax))
 (export "getAverage" (func $src/ts/assembly/histogram/getAverage))
 (export "getHistogramBucketCount" (func $src/ts/assembly/histogram/getHistogramBucketCount))
 (export "calculatePercentile" (func $src/ts/assembly/histogram/calculatePercentile))
 (export "getP50" (func $src/ts/assembly/histogram/getP50))
 (export "getP90" (func $src/ts/assembly/histogram/getP90))
 (export "getP95" (func $src/ts/assembly/histogram/getP95))
 (export "getP99" (func $src/ts/assembly/histogram/getP99))
 (export "resetHistogram" (func $src/ts/assembly/histogram/resetHistogram))
 (export "isHistogramInitialized" (func $src/ts/assembly/histogram/isHistogramInitialized))
 (export "recordValuesBatch" (func $src/ts/assembly/histogram/recordValuesBatch))
 (export "simdMapMultiplyF32" (func $src/ts/assembly/simd-batch/simdMapMultiplyF32))
 (export "simdMapAddF32" (func $src/ts/assembly/simd-batch/simdMapAddF32))
 (export "simdMapSquareF32" (func $src/ts/assembly/simd-batch/simdMapSquareF32))
 (export "simdMapSqrtF32" (func $src/ts/assembly/simd-batch/simdMapSqrtF32))
 (export "simdReduceSumF32" (func $src/ts/assembly/simd-batch/simdReduceSumF32))
 (export "simdReduceMinF32" (func $src/ts/assembly/simd-batch/simdReduceMinF32))
 (export "simdReduceMaxF32" (func $src/ts/assembly/simd-batch/simdReduceMaxF32))
 (export "simdDotProductF32" (func $src/ts/assembly/simd-batch/simdDotProductF32))
 (export "simdAddArraysF32" (func $src/ts/assembly/simd-batch/simdAddArraysF32))
 (export "simdMultiplyArraysF32" (func $src/ts/assembly/simd-batch/simdMultiplyArraysF32))
 (export "simdMapAbsF32" (func $src/ts/assembly/simd-batch/simdMapAbsF32))
 (export "simdMapNegateF32" (func $src/ts/assembly/simd-batch/simdMapNegateF32))
 (export "simdMapClampF32" (func $src/ts/assembly/simd-batch/simdMapClampF32))
 (export "simdMapMultiplyF64" (func $src/ts/assembly/simd-batch/simdMapMultiplyF64))
 (export "simdReduceSumF64" (func $src/ts/assembly/simd-batch/simdReduceSumF64))
 (export "simdMapMultiplyI32" (func $src/ts/assembly/simd-batch/simdMapMultiplyI32))
 (export "simdReduceSumI32" (func $src/ts/assembly/simd-batch/simdReduceSumI32))
 (export "allocateAligned" (func $src/ts/assembly/simd-batch/allocateAligned))
 (export "freeAligned" (func $src/ts/assembly/simd-batch/freeAligned))
 (export "copyToWasm" (func $src/ts/assembly/simd-batch/copyToWasm))
 (export "copyFromWasm" (func $src/ts/assembly/simd-batch/copyFromWasm))
 (export "simdCountI32" (func $src/ts/assembly/simd-batch/simdCountI32))
 (export "simdCountF32" (func $src/ts/assembly/simd-batch/simdCountF32))
 (export "simdIndexOfI32" (func $src/ts/assembly/simd-batch/simdIndexOfI32))
 (export "simdIndexOfF32" (func $src/ts/assembly/simd-batch/simdIndexOfF32))
 (export "simdIncludesI32" (func $src/ts/assembly/simd-batch/simdIncludesI32))
 (export "simdIncludesF32" (func $src/ts/assembly/simd-batch/simdIncludesF32))
 (export "simdCountGreaterThanF32" (func $src/ts/assembly/simd-batch/simdCountGreaterThanF32))
 (export "simdCountLessThanF32" (func $src/ts/assembly/simd-batch/simdCountLessThanF32))
 (export "simdPartitionF32" (func $src/ts/assembly/simd-batch/simdPartitionF32))
 (export "__new" (func $~lib/rt/stub/__new))
 (export "__pin" (func $~lib/rt/stub/__pin))
 (export "__unpin" (func $~lib/rt/stub/__unpin))
 (export "__collect" (func $~lib/rt/stub/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "_initialize" (func $~start))
 (func $src/ts/assembly/memory/isPowerOf2 (param $n i32) (result i32)
  local.get $n
  i32.const 0
  i32.gt_u
  if (result i32)
   local.get $n
   local.get $n
   i32.const 1
   i32.sub
   i32.and
   i32.const 0
   i32.eq
  else
   i32.const 0
  end
  return
 )
 (func $src/ts/assembly/memory/nextPowerOf2 (param $n i32) (result i32)
  local.get $n
  i32.const 0
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $n
  i32.const 1
  i32.sub
  local.set $n
  local.get $n
  local.get $n
  i32.const 1
  i32.shr_u
  i32.or
  local.set $n
  local.get $n
  local.get $n
  i32.const 2
  i32.shr_u
  i32.or
  local.set $n
  local.get $n
  local.get $n
  i32.const 4
  i32.shr_u
  i32.or
  local.set $n
  local.get $n
  local.get $n
  i32.const 8
  i32.shr_u
  i32.or
  local.set $n
  local.get $n
  local.get $n
  i32.const 16
  i32.shr_u
  i32.or
  local.set $n
  local.get $n
  i32.const 1
  i32.add
  return
 )
 (func $src/ts/assembly/memory/calculateMemorySize (param $capacity i32) (result i32)
  (local $actualCapacity i32)
  local.get $capacity
  call $src/ts/assembly/memory/isPowerOf2
  if (result i32)
   local.get $capacity
  else
   local.get $capacity
   call $src/ts/assembly/memory/nextPowerOf2
  end
  local.set $actualCapacity
  global.get $src/ts/assembly/memory/HEADER_SIZE
  local.get $actualCapacity
  i32.const 8
  i32.mul
  i32.add
  local.get $actualCapacity
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  return
 )
 (func $src/ts/assembly/memory/initMemory (param $capacity i32) (result i32)
  (local $existingMagic i32)
  (local $actualCapacity i32)
  (local $mask i32)
  (local $slotsBase i32)
  (local $i i32)
  global.get $src/ts/assembly/memory/HEADER_MAGIC_OFFSET
  i32.atomic.load
  local.set $existingMagic
  local.get $existingMagic
  global.get $src/ts/assembly/memory/MAGIC_NUMBER
  i32.eq
  if
   i32.const 0
   return
  end
  local.get $capacity
  call $src/ts/assembly/memory/isPowerOf2
  if (result i32)
   local.get $capacity
  else
   local.get $capacity
   call $src/ts/assembly/memory/nextPowerOf2
  end
  local.set $actualCapacity
  local.get $actualCapacity
  i32.const 1
  i32.sub
  local.set $mask
  global.get $src/ts/assembly/memory/HEADER_MAGIC_OFFSET
  global.get $src/ts/assembly/memory/MAGIC_NUMBER
  i32.atomic.store
  global.get $src/ts/assembly/memory/HEADER_VERSION_OFFSET
  global.get $src/ts/assembly/memory/VERSION
  i32.atomic.store
  global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/memory/HEADER_CAPACITY_OFFSET
  local.get $actualCapacity
  i32.atomic.store
  global.get $src/ts/assembly/memory/HEADER_MASK_OFFSET
  local.get $mask
  i32.atomic.store
  global.get $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET
  i32.const 0
  i32.atomic.store
  global.get $src/ts/assembly/memory/HEADER_SIZE
  local.get $actualCapacity
  i32.const 8
  i32.mul
  i32.add
  local.set $slotsBase
  global.get $src/ts/assembly/memory/HEADER_SLOTS_BASE_OFFSET
  local.get $slotsBase
  i32.atomic.store
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $actualCapacity
   i32.lt_u
   if
    i32.const 64
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    i64.const 0
    i64.atomic.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 1
  return
 )
 (func $src/ts/assembly/memory/validateMemory (result i32)
  (local $magic i32)
  (local $version i32)
  global.get $src/ts/assembly/memory/HEADER_MAGIC_OFFSET
  i32.atomic.load
  local.set $magic
  global.get $src/ts/assembly/memory/HEADER_VERSION_OFFSET
  i32.atomic.load
  local.set $version
  local.get $magic
  global.get $src/ts/assembly/memory/MAGIC_NUMBER
  i32.eq
  if (result i32)
   local.get $version
   global.get $src/ts/assembly/memory/VERSION
   i32.eq
  else
   i32.const 0
  end
  return
 )
 (func $src/ts/assembly/memory/getCapacity (result i32)
  global.get $src/ts/assembly/memory/HEADER_CAPACITY_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/memory/getMask (result i32)
  global.get $src/ts/assembly/memory/HEADER_MASK_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/memory/getSlotsBase (result i32)
  global.get $src/ts/assembly/memory/HEADER_SLOTS_BASE_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/memory/getHead (result i64)
  global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/memory/getTail (result i64)
  global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/memory/getSlotAddress (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  return
 )
 (func $src/ts/assembly/ring-buffer/packEntry (param $slotIndex i32) (param $priority i32) (result i64)
  local.get $priority
  i64.extend_i32_u
  i64.const 32
  i64.shl
  local.get $slotIndex
  i32.const 1
  i32.add
  i64.extend_i32_u
  i64.or
  return
 )
 (func $src/ts/assembly/ring-buffer/unpackSlotIndex (param $entry i64) (result i32)
  local.get $entry
  i64.const 4294967295
  i64.and
  i64.const 1
  i64.sub
  i32.wrap_i64
  return
 )
 (func $src/ts/assembly/ring-buffer/unpackPriority (param $entry i64) (result i32)
  local.get $entry
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  return
 )
 (func $src/ts/assembly/ring-buffer/getEntryAddress (param $index i64) (result i32)
  (local $mask i32)
  (local $wrappedIndex i32)
  call $src/ts/assembly/memory/getMask
  local.set $mask
  local.get $index
  local.get $mask
  i64.extend_i32_u
  i64.and
  i32.wrap_i64
  local.set $wrappedIndex
  global.get $src/ts/assembly/memory/HEADER_SIZE
  local.get $wrappedIndex
  i32.const 8
  i32.mul
  i32.add
  return
 )
 (func $src/ts/assembly/ring-buffer/push (param $slotIndex i32) (param $priority i32) (result i32)
  (local $capacity i64)
  (local $entry i64)
  (local $tail i64)
  (local $head i64)
  (local $entryAddr i32)
  (local $oldEntry i64)
  (local $swapped i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  call $src/ts/assembly/memory/getCapacity
  i64.extend_i32_u
  local.set $capacity
  local.get $slotIndex
  local.get $priority
  call $src/ts/assembly/ring-buffer/packEntry
  local.set $entry
  loop $while-continue|0
   i32.const 1
   if
    global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
    i64.atomic.load
    local.set $tail
    global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
    i64.atomic.load
    local.set $head
    local.get $tail
    local.get $head
    i64.sub
    local.get $capacity
    i64.ge_u
    if
     i32.const 0
     return
    end
    local.get $tail
    call $src/ts/assembly/ring-buffer/getEntryAddress
    local.set $entryAddr
    local.get $entryAddr
    i64.atomic.load
    local.set $oldEntry
    local.get $oldEntry
    global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
    i64.ne
    if
     i32.const 0
     return
    end
    local.get $entryAddr
    global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
    local.get $entry
    i64.atomic.rmw.cmpxchg
    local.set $swapped
    local.get $swapped
    global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
    i64.eq
    if
     global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
     i64.const 1
     i64.atomic.rmw.add
     drop
     i32.const 1
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/ring-buffer/push@varargs (param $slotIndex i32) (param $priority i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   local.set $priority
  end
  local.get $slotIndex
  local.get $priority
  call $src/ts/assembly/ring-buffer/push
 )
 (func $src/ts/assembly/ring-buffer/pop (result i64)
  (local $head i64)
  (local $tail i64)
  (local $entryAddr i32)
  (local $entry i64)
  (local $swapped i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
   return
  end
  loop $while-continue|0
   i32.const 1
   if
    global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
    i64.atomic.load
    local.set $head
    global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
    i64.atomic.load
    local.set $tail
    local.get $head
    local.get $tail
    i64.ge_u
    if
     global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
     return
    end
    local.get $head
    call $src/ts/assembly/ring-buffer/getEntryAddress
    local.set $entryAddr
    local.get $entryAddr
    i64.atomic.load
    local.set $entry
    local.get $entry
    global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
    i64.eq
    if
     global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
     return
    end
    global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
    local.get $head
    local.get $head
    i64.const 1
    i64.add
    i64.atomic.rmw.cmpxchg
    local.set $swapped
    local.get $swapped
    local.get $head
    i64.eq
    if
     local.get $entryAddr
     global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
     i64.atomic.store
     local.get $entry
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/ring-buffer/size (result i32)
  (local $head i64)
  (local $tail i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
  i64.atomic.load
  local.set $head
  global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
  i64.atomic.load
  local.set $tail
  local.get $tail
  local.get $head
  i64.ge_u
  if
   local.get $tail
   local.get $head
   i64.sub
   i32.wrap_i64
   return
  end
  i32.const 0
  return
 )
 (func $src/ts/assembly/ring-buffer/isEmpty (result i32)
  call $src/ts/assembly/ring-buffer/size
  i32.const 0
  i32.eq
  return
 )
 (func $src/ts/assembly/ring-buffer/isFull (result i32)
  (local $capacity i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 1
   return
  end
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  call $src/ts/assembly/ring-buffer/size
  local.get $capacity
  i32.ge_u
  return
 )
 (func $src/ts/assembly/ring-buffer/clear
  (local $capacity i32)
  (local $i i32)
  (local $entryAddr i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
  i64.const 0
  i64.atomic.store
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $capacity
   i32.lt_u
   if
    global.get $src/ts/assembly/memory/HEADER_SIZE
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    local.set $entryAddr
    local.get $entryAddr
    global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
    i64.atomic.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $src/ts/assembly/ring-buffer/contains (param $slotIndex i32) (result i32)
  (local $head i64)
  (local $tail i64)
  (local $mask i32)
  (local $i i64)
  (local $wrappedIndex i32)
  (local $entryAddr i32)
  (local $entry i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  global.get $src/ts/assembly/memory/HEADER_HEAD_OFFSET
  i64.atomic.load
  local.set $head
  global.get $src/ts/assembly/memory/HEADER_TAIL_OFFSET
  i64.atomic.load
  local.set $tail
  call $src/ts/assembly/memory/getMask
  local.set $mask
  local.get $head
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $tail
   i64.lt_u
   if
    local.get $i
    local.get $mask
    i64.extend_i32_u
    i64.and
    i32.wrap_i64
    local.set $wrappedIndex
    global.get $src/ts/assembly/memory/HEADER_SIZE
    local.get $wrappedIndex
    i32.const 8
    i32.mul
    i32.add
    local.set $entryAddr
    local.get $entryAddr
    i64.atomic.load
    local.set $entry
    local.get $entry
    global.get $src/ts/assembly/ring-buffer/ENTRY_EMPTY
    i64.ne
    if (result i32)
     local.get $entry
     call $src/ts/assembly/ring-buffer/unpackSlotIndex
     local.get $slotIndex
     i32.eq
    else
     i32.const 0
    end
    if
     i32.const 1
     return
    end
    local.get $i
    i64.const 1
    i64.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  return
 )
 (func $src/ts/assembly/task-slots/initTaskSlots
  (local $capacity i32)
  (local $slotsBase i32)
  (local $i i32)
  (local $slotAddr i32)
  (local $nextFree i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $capacity
   i32.lt_u
   if
    local.get $slotsBase
    local.get $i
    global.get $src/ts/assembly/memory/SLOT_SIZE
    i32.mul
    i32.add
    local.set $slotAddr
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_STATE_OFFSET
    i32.add
    global.get $src/ts/assembly/task-slots/SLOT_FREE
    i32.atomic.store
    local.get $i
    local.get $capacity
    i32.const 1
    i32.sub
    i32.lt_u
    if (result i32)
     local.get $i
     i32.const 1
     i32.add
    else
     global.get $src/ts/assembly/task-slots/FREE_LIST_END
    end
    local.set $nextFree
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_NEXT_OR_ID_OFFSET
    i32.add
    local.get $nextFree
    i32.atomic.store
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_PRIORITY_OFFSET
    i32.add
    i32.const 0
    i32.atomic.store
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_TIMESTAMP_OFFSET
    i32.add
    i64.const 0
    i64.atomic.store
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_METHOD_OFFSET
    i32.add
    i32.const 0
    i32.atomic.store
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_REFCOUNT_OFFSET
    i32.add
    i32.const 0
    i32.atomic.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  global.get $src/ts/assembly/task-slots/FREE_LIST_HEAD_OFFSET
  i32.const 0
  i32.atomic.store
  global.get $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/task-slots/allocateSlot (result i32)
  (local $slotsBase i32)
  (local $head i32)
  (local $slotAddr i32)
  (local $nextFree i32)
  (local $swapped i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   global.get $src/ts/assembly/task-slots/FREE_LIST_END
   return
  end
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  loop $while-continue|0
   i32.const 1
   if
    global.get $src/ts/assembly/task-slots/FREE_LIST_HEAD_OFFSET
    i32.atomic.load
    local.set $head
    local.get $head
    global.get $src/ts/assembly/task-slots/FREE_LIST_END
    i32.eq
    if
     global.get $src/ts/assembly/task-slots/FREE_LIST_END
     return
    end
    local.get $slotsBase
    local.get $head
    global.get $src/ts/assembly/memory/SLOT_SIZE
    i32.mul
    i32.add
    local.set $slotAddr
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_NEXT_OR_ID_OFFSET
    i32.add
    i32.atomic.load
    local.set $nextFree
    global.get $src/ts/assembly/task-slots/FREE_LIST_HEAD_OFFSET
    local.get $head
    local.get $nextFree
    i32.atomic.rmw.cmpxchg
    local.set $swapped
    local.get $swapped
    local.get $head
    i32.eq
    if
     local.get $slotAddr
     global.get $src/ts/assembly/task-slots/SLOT_STATE_OFFSET
     i32.add
     global.get $src/ts/assembly/task-slots/SLOT_ALLOCATED
     i32.atomic.store
     local.get $slotAddr
     global.get $src/ts/assembly/task-slots/SLOT_REFCOUNT_OFFSET
     i32.add
     i32.const 1
     i32.atomic.store
     global.get $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET
     i32.const 1
     i32.atomic.rmw.add
     drop
     local.get $head
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/task-slots/freeSlot (param $slotIndex i32)
  (local $capacity i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  (local $state i32)
  (local $head i32)
  (local $swapped i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  local.get $slotIndex
  local.get $capacity
  i32.ge_u
  if
   return
  end
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_STATE_OFFSET
  i32.add
  i32.atomic.load
  local.set $state
  local.get $state
  global.get $src/ts/assembly/task-slots/SLOT_FREE
  i32.eq
  if
   return
  end
  loop $while-continue|0
   i32.const 1
   if
    global.get $src/ts/assembly/task-slots/FREE_LIST_HEAD_OFFSET
    i32.atomic.load
    local.set $head
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_NEXT_OR_ID_OFFSET
    i32.add
    local.get $head
    i32.atomic.store
    local.get $slotAddr
    global.get $src/ts/assembly/task-slots/SLOT_STATE_OFFSET
    i32.add
    global.get $src/ts/assembly/task-slots/SLOT_FREE
    i32.atomic.store
    global.get $src/ts/assembly/task-slots/FREE_LIST_HEAD_OFFSET
    local.get $head
    local.get $slotIndex
    i32.atomic.rmw.cmpxchg
    local.set $swapped
    local.get $swapped
    local.get $head
    i32.eq
    if
     global.get $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET
     i32.const 1
     i32.atomic.rmw.sub
     drop
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/task-slots/setTaskId (param $slotIndex i32) (param $taskId i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_NEXT_OR_ID_OFFSET
  i32.add
  local.get $taskId
  i32.atomic.store
 )
 (func $src/ts/assembly/task-slots/getTaskId (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_NEXT_OR_ID_OFFSET
  i32.add
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/task-slots/setPriority (param $slotIndex i32) (param $priority i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_PRIORITY_OFFSET
  i32.add
  local.get $priority
  i32.atomic.store
 )
 (func $src/ts/assembly/task-slots/getPriority (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_PRIORITY_OFFSET
  i32.add
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/task-slots/setTimestamp (param $slotIndex i32) (param $timestamp i64)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_TIMESTAMP_OFFSET
  i32.add
  local.get $timestamp
  i64.atomic.store
 )
 (func $src/ts/assembly/task-slots/getTimestamp (param $slotIndex i32) (result i64)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_TIMESTAMP_OFFSET
  i32.add
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/task-slots/setMethodId (param $slotIndex i32) (param $methodId i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_METHOD_OFFSET
  i32.add
  local.get $methodId
  i32.atomic.store
 )
 (func $src/ts/assembly/task-slots/getMethodId (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_METHOD_OFFSET
  i32.add
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/task-slots/addRef (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_REFCOUNT_OFFSET
  i32.add
  i32.const 1
  i32.atomic.rmw.add
  i32.const 1
  i32.add
  return
 )
 (func $src/ts/assembly/task-slots/release (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  (local $newCount i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_REFCOUNT_OFFSET
  i32.add
  i32.const 1
  i32.atomic.rmw.sub
  i32.const 1
  i32.sub
  local.set $newCount
  local.get $newCount
  i32.const 0
  i32.eq
  if
   local.get $slotIndex
   call $src/ts/assembly/task-slots/freeSlot
  end
  local.get $newCount
  return
 )
 (func $src/ts/assembly/task-slots/getRefCount (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_REFCOUNT_OFFSET
  i32.add
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/task-slots/getAllocatedCount (result i32)
  global.get $src/ts/assembly/memory/HEADER_ALLOCATED_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/task-slots/isAllocated (param $slotIndex i32) (result i32)
  (local $slotsBase i32)
  (local $slotAddr i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  local.get $slotsBase
  local.get $slotIndex
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  local.set $slotAddr
  local.get $slotAddr
  global.get $src/ts/assembly/task-slots/SLOT_STATE_OFFSET
  i32.add
  i32.atomic.load
  global.get $src/ts/assembly/task-slots/SLOT_ALLOCATED
  i32.eq
  return
 )
 (func $src/ts/assembly/priority-queue/initPriorityQueue
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/priority-queue/getPriorityQueueSize (result i32)
  global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/priority-queue/isPriorityQueueEmpty (result i32)
  call $src/ts/assembly/priority-queue/getPriorityQueueSize
  i32.const 0
  i32.eq
  return
 )
 (func $src/ts/assembly/priority-queue/packHeapEntry (param $priority i32) (param $slotIndex i32) (result i64)
  (local $invertedPriority i32)
  i32.const -1
  local.get $priority
  i32.sub
  local.set $invertedPriority
  local.get $invertedPriority
  i64.extend_i32_u
  i64.const 32
  i64.shl
  local.get $slotIndex
  i64.extend_i32_u
  i64.or
  return
 )
 (func $src/ts/assembly/priority-queue/getHeapBase (result i32)
  (local $slotsBase i32)
  (local $capacity i32)
  call $src/ts/assembly/memory/getSlotsBase
  local.set $slotsBase
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  local.get $slotsBase
  local.get $capacity
  global.get $src/ts/assembly/memory/SLOT_SIZE
  i32.mul
  i32.add
  return
 )
 (func $src/ts/assembly/priority-queue/getHeapEntryAddr (param $index i32) (result i32)
  call $src/ts/assembly/priority-queue/getHeapBase
  local.get $index
  global.get $src/ts/assembly/priority-queue/HEAP_ENTRY_SIZE
  i32.mul
  i32.add
  return
 )
 (func $src/ts/assembly/priority-queue/parentIndex (param $i i32) (result i32)
  local.get $i
  i32.const 1
  i32.sub
  i32.const 1
  i32.shr_u
  return
 )
 (func $src/ts/assembly/priority-queue/siftUp (param $index i32)
  (local $parent i32)
  (local $parentAddr i32)
  (local $currentAddr i32)
  (local $parentEntry i64)
  (local $currentEntry i64)
  block $while-break|0
   loop $while-continue|0
    local.get $index
    i32.const 0
    i32.gt_u
    if
     local.get $index
     call $src/ts/assembly/priority-queue/parentIndex
     local.set $parent
     local.get $parent
     call $src/ts/assembly/priority-queue/getHeapEntryAddr
     local.set $parentAddr
     local.get $index
     call $src/ts/assembly/priority-queue/getHeapEntryAddr
     local.set $currentAddr
     local.get $parentAddr
     i64.atomic.load
     local.set $parentEntry
     local.get $currentAddr
     i64.atomic.load
     local.set $currentEntry
     local.get $parentEntry
     local.get $currentEntry
     i64.gt_u
     if
      local.get $parentAddr
      local.get $currentEntry
      i64.atomic.store
      local.get $currentAddr
      local.get $parentEntry
      i64.atomic.store
      local.get $parent
      local.set $index
     else
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePush (param $slotIndex i32) (param $priority i32) (result i32)
  (local $capacity i32)
  (local $currentSize i32)
  (local $newSize i32)
  (local $swapped i32)
  (local $entry i64)
  (local $entryAddr i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  loop $while-continue|0
   i32.const 1
   if
    global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
    i32.atomic.load
    local.set $currentSize
    local.get $currentSize
    local.get $capacity
    i32.ge_u
    if
     i32.const 0
     return
    end
    local.get $currentSize
    i32.const 1
    i32.add
    local.set $newSize
    global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
    local.get $currentSize
    local.get $newSize
    i32.atomic.rmw.cmpxchg
    local.set $swapped
    local.get $swapped
    local.get $currentSize
    i32.eq
    if
     local.get $priority
     local.get $slotIndex
     call $src/ts/assembly/priority-queue/packHeapEntry
     local.set $entry
     local.get $currentSize
     call $src/ts/assembly/priority-queue/getHeapEntryAddr
     local.set $entryAddr
     local.get $entryAddr
     local.get $entry
     i64.atomic.store
     local.get $currentSize
     call $src/ts/assembly/priority-queue/siftUp
     i32.const 1
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/priority-queue/unpackSlotIndex (param $entry i64) (result i32)
  local.get $entry
  i64.const 4294967295
  i64.and
  i32.wrap_i64
  return
 )
 (func $src/ts/assembly/priority-queue/leftChildIndex (param $i i32) (result i32)
  local.get $i
  i32.const 1
  i32.shl
  i32.const 1
  i32.add
  return
 )
 (func $src/ts/assembly/priority-queue/rightChildIndex (param $i i32) (result i32)
  local.get $i
  i32.const 1
  i32.shl
  i32.const 2
  i32.add
  return
 )
 (func $src/ts/assembly/priority-queue/siftDown (param $index i32) (param $heapSize i32)
  (local $left i32)
  (local $right i32)
  (local $smallest i32)
  (local $currentAddr i32)
  (local $currentEntry i64)
  (local $leftAddr i32)
  (local $leftEntry i64)
  (local $rightAddr i32)
  (local $rightEntry i64)
  (local $smallestAddr i32)
  (local $smallestEntry i64)
  (local $smallestAddr|13 i32)
  (local $smallestEntry|14 i64)
  block $while-break|0
   loop $while-continue|0
    i32.const 1
    if
     local.get $index
     call $src/ts/assembly/priority-queue/leftChildIndex
     local.set $left
     local.get $index
     call $src/ts/assembly/priority-queue/rightChildIndex
     local.set $right
     local.get $index
     local.set $smallest
     local.get $index
     call $src/ts/assembly/priority-queue/getHeapEntryAddr
     local.set $currentAddr
     local.get $currentAddr
     i64.atomic.load
     local.set $currentEntry
     local.get $left
     local.get $heapSize
     i32.lt_u
     if
      local.get $left
      call $src/ts/assembly/priority-queue/getHeapEntryAddr
      local.set $leftAddr
      local.get $leftAddr
      i64.atomic.load
      local.set $leftEntry
      local.get $leftEntry
      local.get $currentEntry
      i64.lt_u
      if
       local.get $left
       local.set $smallest
      end
     end
     local.get $right
     local.get $heapSize
     i32.lt_u
     if
      local.get $right
      call $src/ts/assembly/priority-queue/getHeapEntryAddr
      local.set $rightAddr
      local.get $rightAddr
      i64.atomic.load
      local.set $rightEntry
      local.get $smallest
      call $src/ts/assembly/priority-queue/getHeapEntryAddr
      local.set $smallestAddr
      local.get $smallestAddr
      i64.atomic.load
      local.set $smallestEntry
      local.get $rightEntry
      local.get $smallestEntry
      i64.lt_u
      if
       local.get $right
       local.set $smallest
      end
     end
     local.get $smallest
     local.get $index
     i32.ne
     if
      local.get $smallest
      call $src/ts/assembly/priority-queue/getHeapEntryAddr
      local.set $smallestAddr|13
      local.get $smallestAddr|13
      i64.atomic.load
      local.set $smallestEntry|14
      local.get $smallestAddr|13
      local.get $currentEntry
      i64.atomic.store
      local.get $currentAddr
      local.get $smallestEntry|14
      i64.atomic.store
      local.get $smallest
      local.set $index
     else
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePop (result i32)
  (local $currentSize i32)
  (local $newSize i32)
  (local $swapped i32)
  (local $rootAddr i32)
  (local $rootEntry i64)
  (local $slotIndex i32)
  (local $lastAddr i32)
  (local $lastEntry i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const -1
   return
  end
  loop $while-continue|0
   i32.const 1
   if
    global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
    i32.atomic.load
    local.set $currentSize
    local.get $currentSize
    i32.const 0
    i32.eq
    if
     i32.const -1
     return
    end
    local.get $currentSize
    i32.const 1
    i32.sub
    local.set $newSize
    global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
    local.get $currentSize
    local.get $newSize
    i32.atomic.rmw.cmpxchg
    local.set $swapped
    local.get $swapped
    local.get $currentSize
    i32.eq
    if
     i32.const 0
     call $src/ts/assembly/priority-queue/getHeapEntryAddr
     local.set $rootAddr
     local.get $rootAddr
     i64.atomic.load
     local.set $rootEntry
     local.get $rootEntry
     call $src/ts/assembly/priority-queue/unpackSlotIndex
     local.set $slotIndex
     local.get $newSize
     i32.const 0
     i32.gt_u
     if
      local.get $newSize
      call $src/ts/assembly/priority-queue/getHeapEntryAddr
      local.set $lastAddr
      local.get $lastAddr
      i64.atomic.load
      local.set $lastEntry
      local.get $rootAddr
      local.get $lastEntry
      i64.atomic.store
      local.get $lastAddr
      i64.const 0
      i64.atomic.store
      i32.const 0
      local.get $newSize
      call $src/ts/assembly/priority-queue/siftDown
     else
      local.get $rootAddr
      i64.const 0
      i64.atomic.store
     end
     local.get $slotIndex
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePeek (result i32)
  (local $size i32)
  (local $rootAddr i32)
  (local $rootEntry i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const -1
   return
  end
  call $src/ts/assembly/priority-queue/getPriorityQueueSize
  local.set $size
  local.get $size
  i32.const 0
  i32.eq
  if
   i32.const -1
   return
  end
  i32.const 0
  call $src/ts/assembly/priority-queue/getHeapEntryAddr
  local.set $rootAddr
  local.get $rootAddr
  i64.atomic.load
  local.set $rootEntry
  local.get $rootEntry
  call $src/ts/assembly/priority-queue/unpackSlotIndex
  return
 )
 (func $src/ts/assembly/priority-queue/unpackPriority (param $entry i64) (result i32)
  (local $invertedPriority i32)
  local.get $entry
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.set $invertedPriority
  i32.const -1
  local.get $invertedPriority
  i32.sub
  return
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePeekPriority (result i32)
  (local $size i32)
  (local $rootAddr i32)
  (local $rootEntry i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  call $src/ts/assembly/priority-queue/getPriorityQueueSize
  local.set $size
  local.get $size
  i32.const 0
  i32.eq
  if
   i32.const 0
   return
  end
  i32.const 0
  call $src/ts/assembly/priority-queue/getHeapEntryAddr
  local.set $rootAddr
  local.get $rootAddr
  i64.atomic.load
  local.set $rootEntry
  local.get $rootEntry
  call $src/ts/assembly/priority-queue/unpackPriority
  return
 )
 (func $src/ts/assembly/priority-queue/priorityQueueClear
  (local $size i32)
  (local $heapBase i32)
  (local $i i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
  i32.atomic.load
  local.set $size
  call $src/ts/assembly/priority-queue/getHeapBase
  local.set $heapBase
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $size
   i32.lt_u
   if
    local.get $heapBase
    local.get $i
    global.get $src/ts/assembly/priority-queue/HEAP_ENTRY_SIZE
    i32.mul
    i32.add
    i64.const 0
    i64.atomic.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  global.get $src/ts/assembly/priority-queue/PQ_SIZE_OFFSET
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/priority-queue/isPriorityQueueFull (result i32)
  (local $capacity i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 1
   return
  end
  call $src/ts/assembly/memory/getCapacity
  local.set $capacity
  call $src/ts/assembly/priority-queue/getPriorityQueueSize
  local.get $capacity
  i32.ge_u
  return
 )
 (func $src/ts/assembly/circular-buffer/initBuffer (param $requestedCapacity i32)
  (local $capacity i32)
  i32.const 1
  local.set $capacity
  loop $while-continue|0
   local.get $capacity
   local.get $requestedCapacity
   i32.lt_u
   if
    local.get $capacity
    i32.const 1
    i32.shl
    local.set $capacity
    br $while-continue|0
   end
  end
  local.get $capacity
  global.set $src/ts/assembly/circular-buffer/bufferCapacity
  local.get $capacity
  i32.const 1
  i32.sub
  global.set $src/ts/assembly/circular-buffer/bufferMask
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferHead
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferTail
 )
 (func $src/ts/assembly/circular-buffer/getBufferCapacity (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  return
 )
 (func $src/ts/assembly/circular-buffer/getBufferSize (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  return
 )
 (func $src/ts/assembly/circular-buffer/isEmpty (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  i32.eq
  return
 )
 (func $src/ts/assembly/circular-buffer/isFull (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.eq
  return
 )
 (func $src/ts/assembly/circular-buffer/grow
  (local $newCapacity i32)
  (local $newMask i32)
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.const 1
  i32.shl
  local.set $newCapacity
  local.get $newCapacity
  i32.const 1
  i32.sub
  local.set $newMask
  local.get $newCapacity
  global.set $src/ts/assembly/circular-buffer/bufferCapacity
  local.get $newMask
  global.set $src/ts/assembly/circular-buffer/bufferMask
 )
 (func $src/ts/assembly/circular-buffer/pushGrowable (param $item i32) (result i32)
  (local $index i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.eq
  if
   call $src/ts/assembly/circular-buffer/grow
  end
  global.get $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  local.set $index
  global.get $src/ts/assembly/circular-buffer/bufferTail
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferSize
  local.get $index
  return
 )
 (func $src/ts/assembly/circular-buffer/pushWithEviction (param $item i32) (result i32)
  (local $evictedIndex i32)
  (local $index i32)
  i32.const -1
  local.set $evictedIndex
  global.get $src/ts/assembly/circular-buffer/bufferSize
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.eq
  if
   global.get $src/ts/assembly/circular-buffer/bufferHead
   global.get $src/ts/assembly/circular-buffer/bufferMask
   i32.and
   local.set $evictedIndex
   global.get $src/ts/assembly/circular-buffer/bufferHead
   i32.const 1
   i32.add
   global.set $src/ts/assembly/circular-buffer/bufferHead
   global.get $src/ts/assembly/circular-buffer/bufferSize
   i32.const 1
   i32.sub
   global.set $src/ts/assembly/circular-buffer/bufferSize
  end
  global.get $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  local.set $index
  global.get $src/ts/assembly/circular-buffer/bufferTail
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferSize
  local.get $evictedIndex
  return
 )
 (func $src/ts/assembly/circular-buffer/shift (result i32)
  (local $index i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  i32.eq
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferHead
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  local.set $index
  global.get $src/ts/assembly/circular-buffer/bufferHead
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferHead
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 1
  i32.sub
  global.set $src/ts/assembly/circular-buffer/bufferSize
  local.get $index
  return
 )
 (func $src/ts/assembly/circular-buffer/peekHead (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  i32.eq
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferHead
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  return
 )
 (func $src/ts/assembly/circular-buffer/peekTail (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  i32.eq
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferTail
  i32.const 1
  i32.sub
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  return
 )
 (func $src/ts/assembly/circular-buffer/at (param $logicalIndex i32) (result i32)
  local.get $logicalIndex
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.ge_u
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferHead
  local.get $logicalIndex
  i32.add
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  return
 )
 (func $src/ts/assembly/circular-buffer/clear
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferHead
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferTail
 )
 (func $src/ts/assembly/circular-buffer/drain (result i32)
  (local $count i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  local.set $count
  call $src/ts/assembly/circular-buffer/clear
  local.get $count
  return
 )
 (func $src/ts/assembly/circular-buffer/getStats (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.const 16
  i32.shl
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.or
  return
 )
 (func $src/ts/assembly/circular-buffer/logicalToPhysical (param $logicalIndex i32) (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferHead
  local.get $logicalIndex
  i32.add
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  return
 )
 (func $src/ts/assembly/circular-buffer/getHead (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferHead
  return
 )
 (func $src/ts/assembly/circular-buffer/getTail (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferTail
  return
 )
 (func $src/ts/assembly/circular-buffer/getBufferMask (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferMask
  return
 )
 (func $src/ts/assembly/errors/packResult (param $errorCode i32) (param $value i32) (result i64)
  local.get $errorCode
  i64.extend_i32_u
  i64.const 32
  i64.shl
  local.get $value
  i64.extend_i32_u
  i64.or
  return
 )
 (func $src/ts/assembly/errors/unpackErrorCode (param $result i64) (result i32)
  local.get $result
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  return
 )
 (func $src/ts/assembly/errors/unpackValue (param $result i64) (result i32)
  local.get $result
  i64.const 4294967295
  i64.and
  i32.wrap_i64
  return
 )
 (func $src/ts/assembly/errors/isSuccess (param $result i64) (result i32)
  local.get $result
  call $src/ts/assembly/errors/unpackErrorCode
  global.get $src/ts/assembly/errors/SUCCESS
  i32.eq
  return
 )
 (func $src/ts/assembly/errors/successResult (param $value i32) (result i64)
  global.get $src/ts/assembly/errors/SUCCESS
  local.get $value
  call $src/ts/assembly/errors/packResult
  return
 )
 (func $src/ts/assembly/errors/errorResult (param $errorCode i32) (result i64)
  local.get $errorCode
  i32.const 0
  call $src/ts/assembly/errors/packResult
  return
 )
 (func $src/ts/assembly/stats/initStats
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  global.get $src/ts/assembly/stats/STATS_PUSH_COUNT_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_POP_COUNT_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_PUSH_FAILURES_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_POP_FAILURES_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_CAS_RETRIES_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_ALLOC_COUNT_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_FREE_COUNT_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/stats/STATS_PEAK_SIZE_OFFSET
  i32.const 0
  i32.atomic.store
  global.get $src/ts/assembly/stats/STATS_PEAK_ALLOCATED_OFFSET
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/stats/recordPush
  global.get $src/ts/assembly/stats/STATS_PUSH_COUNT_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordPop
  global.get $src/ts/assembly/stats/STATS_POP_COUNT_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordPushFailure
  global.get $src/ts/assembly/stats/STATS_PUSH_FAILURES_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordPopFailure
  global.get $src/ts/assembly/stats/STATS_POP_FAILURES_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordCASRetry
  global.get $src/ts/assembly/stats/STATS_CAS_RETRIES_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordAllocation
  global.get $src/ts/assembly/stats/STATS_ALLOC_COUNT_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordFree
  global.get $src/ts/assembly/stats/STATS_FREE_COUNT_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/updatePeakSize (param $currentSize i32)
  (local $peak i32)
  (local $swapped i32)
  block $while-break|0
   loop $while-continue|0
    i32.const 1
    if
     global.get $src/ts/assembly/stats/STATS_PEAK_SIZE_OFFSET
     i32.atomic.load
     local.set $peak
     local.get $currentSize
     local.get $peak
     i32.le_u
     if
      br $while-break|0
     end
     global.get $src/ts/assembly/stats/STATS_PEAK_SIZE_OFFSET
     local.get $peak
     local.get $currentSize
     i32.atomic.rmw.cmpxchg
     local.set $swapped
     local.get $swapped
     local.get $peak
     i32.eq
     if
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
 )
 (func $src/ts/assembly/stats/updatePeakAllocated (param $currentAllocated i32)
  (local $peak i32)
  (local $swapped i32)
  block $while-break|0
   loop $while-continue|0
    i32.const 1
    if
     global.get $src/ts/assembly/stats/STATS_PEAK_ALLOCATED_OFFSET
     i32.atomic.load
     local.set $peak
     local.get $currentAllocated
     local.get $peak
     i32.le_u
     if
      br $while-break|0
     end
     global.get $src/ts/assembly/stats/STATS_PEAK_ALLOCATED_OFFSET
     local.get $peak
     local.get $currentAllocated
     i32.atomic.rmw.cmpxchg
     local.set $swapped
     local.get $swapped
     local.get $peak
     i32.eq
     if
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
 )
 (func $src/ts/assembly/stats/getPushCount (result i64)
  global.get $src/ts/assembly/stats/STATS_PUSH_COUNT_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getPopCount (result i64)
  global.get $src/ts/assembly/stats/STATS_POP_COUNT_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getPushFailures (result i64)
  global.get $src/ts/assembly/stats/STATS_PUSH_FAILURES_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getPopFailures (result i64)
  global.get $src/ts/assembly/stats/STATS_POP_FAILURES_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getCASRetries (result i64)
  global.get $src/ts/assembly/stats/STATS_CAS_RETRIES_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getAllocationCount (result i64)
  global.get $src/ts/assembly/stats/STATS_ALLOC_COUNT_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getFreeCount (result i64)
  global.get $src/ts/assembly/stats/STATS_FREE_COUNT_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getPeakSize (result i32)
  global.get $src/ts/assembly/stats/STATS_PEAK_SIZE_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/stats/getPeakAllocated (result i32)
  global.get $src/ts/assembly/stats/STATS_PEAK_ALLOCATED_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/stats/resetStats
  call $src/ts/assembly/stats/initStats
 )
 (func $src/ts/assembly/atomics/tryLock (param $lockAddr i32) (result i32)
  (local $old i32)
  local.get $lockAddr
  global.get $src/ts/assembly/atomics/LOCK_FREE
  global.get $src/ts/assembly/atomics/LOCK_HELD
  i32.atomic.rmw.cmpxchg
  local.set $old
  local.get $old
  global.get $src/ts/assembly/atomics/LOCK_FREE
  i32.eq
  return
 )
 (func $src/ts/assembly/atomics/acquireLock (param $lockAddr i32) (param $maxRetries i32) (result i32)
  (local $i i32)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $maxRetries
   i32.lt_u
   if
    local.get $lockAddr
    call $src/ts/assembly/atomics/tryLock
    if
     i32.const 1
     return
    end
    atomic.fence
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  i32.const 0
  return
 )
 (func $src/ts/assembly/atomics/acquireLock@varargs (param $lockAddr i32) (param $maxRetries i32) (result i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   global.get $src/ts/assembly/atomics/MAX_CAS_RETRIES
   local.set $maxRetries
  end
  local.get $lockAddr
  local.get $maxRetries
  call $src/ts/assembly/atomics/acquireLock
 )
 (func $src/ts/assembly/atomics/releaseLock (param $lockAddr i32)
  local.get $lockAddr
  global.get $src/ts/assembly/atomics/LOCK_FREE
  i32.atomic.store
 )
 (func $src/ts/assembly/atomics/atomicIncrement (param $addr i32) (result i32)
  local.get $addr
  i32.const 1
  i32.atomic.rmw.add
  i32.const 1
  i32.add
  return
 )
 (func $src/ts/assembly/atomics/atomicDecrement (param $addr i32) (result i32)
  local.get $addr
  i32.const 1
  i32.atomic.rmw.sub
  i32.const 1
  i32.sub
  return
 )
 (func $src/ts/assembly/atomics/atomicIncrement64 (param $addr i32) (result i64)
  local.get $addr
  i64.const 1
  i64.atomic.rmw.add
  i64.const 1
  i64.add
  return
 )
 (func $src/ts/assembly/atomics/atomicDecrement64 (param $addr i32) (result i64)
  local.get $addr
  i64.const 1
  i64.atomic.rmw.sub
  i64.const 1
  i64.sub
  return
 )
 (func $src/ts/assembly/atomics/atomicCompareExchange32 (param $addr i32) (param $expected i32) (param $desired i32) (result i32)
  (local $old i32)
  local.get $addr
  local.get $expected
  local.get $desired
  i32.atomic.rmw.cmpxchg
  local.set $old
  local.get $old
  local.get $expected
  i32.eq
  return
 )
 (func $src/ts/assembly/atomics/atomicCompareExchange64 (param $addr i32) (param $expected i64) (param $desired i64) (result i32)
  (local $old i64)
  local.get $addr
  local.get $expected
  local.get $desired
  i64.atomic.rmw.cmpxchg
  local.set $old
  local.get $old
  local.get $expected
  i64.eq
  return
 )
 (func $src/ts/assembly/atomics/atomicLoad32 (param $addr i32) (result i32)
  local.get $addr
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/atomics/atomicLoad64 (param $addr i32) (result i64)
  local.get $addr
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/atomics/atomicStore32 (param $addr i32) (param $value i32)
  local.get $addr
  local.get $value
  i32.atomic.store
 )
 (func $src/ts/assembly/atomics/atomicStore64 (param $addr i32) (param $value i64)
  local.get $addr
  local.get $value
  i64.atomic.store
 )
 (func $src/ts/assembly/atomics/atomicMax32 (param $addr i32) (param $value i32) (result i32)
  (local $current i32)
  (local $old i32)
  loop $while-continue|0
   i32.const 1
   if
    local.get $addr
    i32.atomic.load
    local.set $current
    local.get $value
    local.get $current
    i32.le_u
    if
     local.get $current
     return
    end
    local.get $addr
    local.get $current
    local.get $value
    i32.atomic.rmw.cmpxchg
    local.set $old
    local.get $old
    local.get $current
    i32.eq
    if
     local.get $current
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/atomics/atomicMin32 (param $addr i32) (param $value i32) (result i32)
  (local $current i32)
  (local $old i32)
  loop $while-continue|0
   i32.const 1
   if
    local.get $addr
    i32.atomic.load
    local.set $current
    local.get $value
    local.get $current
    i32.ge_u
    if
     local.get $current
     return
    end
    local.get $addr
    local.get $current
    local.get $value
    i32.atomic.rmw.cmpxchg
    local.set $old
    local.get $old
    local.get $current
    i32.eq
    if
     local.get $current
     return
    end
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/atomics/memoryFence
  atomic.fence
 )
 (func $src/ts/assembly/atomics/seqlockWriteBegin (param $seqAddr i32) (result i32)
  (local $seq i32)
  local.get $seqAddr
  i32.const 1
  i32.atomic.rmw.add
  local.set $seq
  atomic.fence
  local.get $seq
  i32.const 1
  i32.add
  return
 )
 (func $src/ts/assembly/atomics/seqlockWriteEnd (param $seqAddr i32)
  atomic.fence
  local.get $seqAddr
  i32.const 1
  i32.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/atomics/seqlockReadBegin (param $seqAddr i32) (result i32)
  (local $seq i32)
  loop $while-continue|0
   i32.const 1
   if
    local.get $seqAddr
    i32.atomic.load
    local.set $seq
    local.get $seq
    i32.const 1
    i32.and
    i32.const 0
    i32.eq
    if
     atomic.fence
     local.get $seq
     return
    end
    atomic.fence
    br $while-continue|0
   end
  end
  unreachable
 )
 (func $src/ts/assembly/atomics/seqlockReadValidate (param $seqAddr i32) (param $startSeq i32) (result i32)
  (local $endSeq i32)
  atomic.fence
  local.get $seqAddr
  i32.atomic.load
  local.set $endSeq
  local.get $endSeq
  local.get $startSeq
  i32.eq
  return
 )
 (func $~lib/rt/common/OBJECT#get:rtSize (param $this i32) (result i32)
  local.get $this
  i32.load offset=16
 )
 (func $~lib/staticarray/StaticArray<f64>#get:length (param $this i32) (result i32)
  local.get $this
  i32.const 20
  i32.sub
  call $~lib/rt/common/OBJECT#get:rtSize
  i32.const 3
  i32.shr_u
  return
 )
 (func $~lib/staticarray/StaticArray<f64>#__uget (param $this i32) (param $index i32) (result f64)
  local.get $this
  local.get $index
  i32.const 3
  i32.shl
  i32.add
  f64.load
  return
 )
 (func $src/ts/assembly/histogram/setBucketBoundary (param $index i32) (param $boundary f64)
  (local $bucketCount i32)
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  local.set $bucketCount
  local.get $index
  local.get $bucketCount
  i32.lt_u
  if
   global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
   local.get $index
   i32.const 8
   i32.mul
   i32.add
   local.get $boundary
   f64.store
  end
 )
 (func $src/ts/assembly/histogram/getBucketBoundary (param $index i32) (result f64)
  (local $bucketCount i32)
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  local.set $bucketCount
  local.get $index
  local.get $bucketCount
  i32.lt_u
  if
   global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
   local.get $index
   i32.const 8
   i32.mul
   i32.add
   f64.load
   return
  end
  f64.const -1
  return
 )
 (func $src/ts/assembly/histogram/findBucket (param $value f64) (param $bucketCount i32) (result i32)
  (local $i i32)
  (local $boundary f64)
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $bucketCount
   i32.lt_u
   if
    global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    f64.load
    local.set $boundary
    local.get $value
    local.get $boundary
    f64.le
    if
     local.get $i
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $bucketCount
  return
 )
 (func $src/ts/assembly/histogram/updateMin (param $value f64)
  (local $valueAsU64 i64)
  (local $currentMin f64)
  (local $currentAsU64 i64)
  (local $swapped i64)
  local.get $value
  i64.reinterpret_f64
  local.set $valueAsU64
  block $while-break|0
   loop $while-continue|0
    i32.const 1
    if
     global.get $src/ts/assembly/histogram/HIST_MIN_OFFSET
     f64.load
     local.set $currentMin
     local.get $value
     local.get $currentMin
     f64.ge
     if
      br $while-break|0
     end
     local.get $currentMin
     i64.reinterpret_f64
     local.set $currentAsU64
     global.get $src/ts/assembly/histogram/HIST_MIN_OFFSET
     local.get $currentAsU64
     local.get $valueAsU64
     i64.atomic.rmw.cmpxchg
     local.set $swapped
     local.get $swapped
     local.get $currentAsU64
     i64.eq
     if
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
 )
 (func $src/ts/assembly/histogram/updateMax (param $value f64)
  (local $valueAsU64 i64)
  (local $currentMax f64)
  (local $currentAsU64 i64)
  (local $swapped i64)
  local.get $value
  i64.reinterpret_f64
  local.set $valueAsU64
  block $while-break|0
   loop $while-continue|0
    i32.const 1
    if
     global.get $src/ts/assembly/histogram/HIST_MAX_OFFSET
     f64.load
     local.set $currentMax
     local.get $value
     local.get $currentMax
     f64.le
     if
      br $while-break|0
     end
     local.get $currentMax
     i64.reinterpret_f64
     local.set $currentAsU64
     global.get $src/ts/assembly/histogram/HIST_MAX_OFFSET
     local.get $currentAsU64
     local.get $valueAsU64
     i64.atomic.rmw.cmpxchg
     local.set $swapped
     local.get $swapped
     local.get $currentAsU64
     i64.eq
     if
      br $while-break|0
     end
     br $while-continue|0
    end
   end
  end
 )
 (func $src/ts/assembly/histogram/recordValue (param $value f64)
  (local $bucketCount i32)
  (local $bucketIndex i32)
  (local $currentSum f64)
  global.get $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET
  i32.atomic.load
  i32.const 1
  i32.ne
  if
   return
  end
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  local.set $bucketCount
  local.get $value
  local.get $bucketCount
  call $src/ts/assembly/histogram/findBucket
  local.set $bucketIndex
  global.get $src/ts/assembly/histogram/HIST_BUCKETS_OFFSET
  local.get $bucketIndex
  i32.const 8
  i32.mul
  i32.add
  i64.const 1
  i64.atomic.rmw.add
  drop
  global.get $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET
  i64.const 1
  i64.atomic.rmw.add
  drop
  global.get $src/ts/assembly/histogram/HIST_SUM_OFFSET
  f64.load
  local.set $currentSum
  global.get $src/ts/assembly/histogram/HIST_SUM_OFFSET
  local.get $currentSum
  local.get $value
  f64.add
  f64.store
  local.get $value
  call $src/ts/assembly/histogram/updateMin
  local.get $value
  call $src/ts/assembly/histogram/updateMax
 )
 (func $src/ts/assembly/histogram/getBucketCount (param $bucketIndex i32) (result i64)
  (local $bucketCount i32)
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  local.set $bucketCount
  local.get $bucketIndex
  local.get $bucketCount
  i32.le_u
  if
   global.get $src/ts/assembly/histogram/HIST_BUCKETS_OFFSET
   local.get $bucketIndex
   i32.const 8
   i32.mul
   i32.add
   i64.atomic.load
   return
  end
  i64.const 0
  return
 )
 (func $src/ts/assembly/histogram/getTotalCount (result i64)
  global.get $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET
  i64.atomic.load
  return
 )
 (func $src/ts/assembly/histogram/getSum (result f64)
  global.get $src/ts/assembly/histogram/HIST_SUM_OFFSET
  f64.load
  return
 )
 (func $src/ts/assembly/histogram/getMin (result f64)
  (local $min f64)
  global.get $src/ts/assembly/histogram/HIST_MIN_OFFSET
  f64.load
  local.set $min
  local.get $min
  global.get $~lib/builtins/f64.MAX_VALUE
  f64.eq
  if
   f64.const 0
   return
  end
  local.get $min
  return
 )
 (func $src/ts/assembly/histogram/getMax (result f64)
  (local $max f64)
  global.get $src/ts/assembly/histogram/HIST_MAX_OFFSET
  f64.load
  local.set $max
  local.get $max
  global.get $~lib/builtins/f64.MIN_VALUE
  f64.eq
  if
   f64.const 0
   return
  end
  local.get $max
  return
 )
 (func $src/ts/assembly/histogram/getAverage (result f64)
  (local $count i64)
  global.get $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET
  i64.atomic.load
  local.set $count
  local.get $count
  i64.const 0
  i64.eq
  if
   f64.const 0
   return
  end
  global.get $src/ts/assembly/histogram/HIST_SUM_OFFSET
  f64.load
  local.get $count
  f64.convert_i64_u
  f64.div
  return
 )
 (func $src/ts/assembly/histogram/getHistogramBucketCount (result i32)
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  return
 )
 (func $src/ts/assembly/histogram/calculatePercentile (param $percentile f64) (result f64)
  (local $totalCount i64)
  (local $bucketCount i32)
  (local $targetCount i64)
  (local $cumulativeCount i64)
  (local $prevBoundary f64)
  (local $i i32)
  (local $bucketCount64 i64)
  (local $nextCumulative i64)
  (local $boundary f64)
  (local $positionInBucket f64)
  local.get $percentile
  f64.const 0
  f64.lt
  if (result i32)
   i32.const 1
  else
   local.get $percentile
   f64.const 100
   f64.gt
  end
  if
   f64.const 0
   return
  end
  global.get $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET
  i64.atomic.load
  local.set $totalCount
  local.get $totalCount
  i64.const 0
  i64.eq
  if
   f64.const 0
   return
  end
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  local.set $bucketCount
  local.get $totalCount
  f64.convert_i64_u
  local.get $percentile
  f64.mul
  f64.const 100
  f64.div
  i64.trunc_sat_f64_u
  local.set $targetCount
  i64.const 0
  local.set $cumulativeCount
  f64.const 0
  local.set $prevBoundary
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $bucketCount
   i32.le_u
   if
    global.get $src/ts/assembly/histogram/HIST_BUCKETS_OFFSET
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    i64.atomic.load
    local.set $bucketCount64
    local.get $cumulativeCount
    local.get $bucketCount64
    i64.add
    local.set $nextCumulative
    local.get $nextCumulative
    local.get $targetCount
    i64.ge_u
    if (result i32)
     local.get $bucketCount64
     i64.const 0
     i64.gt_u
    else
     i32.const 0
    end
    if
     local.get $i
     local.get $bucketCount
     i32.lt_u
     if
      global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
      local.get $i
      i32.const 8
      i32.mul
      i32.add
      f64.load
      local.set $boundary
     else
      global.get $src/ts/assembly/histogram/HIST_MAX_OFFSET
      f64.load
      local.set $boundary
      local.get $boundary
      global.get $~lib/builtins/f64.MIN_VALUE
      f64.eq
      if
       local.get $prevBoundary
       f64.const 2
       f64.mul
       local.set $boundary
      end
     end
     local.get $bucketCount64
     i64.const 0
     i64.gt_u
     if
      local.get $targetCount
      local.get $cumulativeCount
      i64.sub
      f64.convert_i64_u
      local.get $bucketCount64
      f64.convert_i64_u
      f64.div
      local.set $positionInBucket
      local.get $prevBoundary
      local.get $boundary
      local.get $prevBoundary
      f64.sub
      local.get $positionInBucket
      f64.mul
      f64.add
      return
     end
     local.get $boundary
     return
    end
    local.get $nextCumulative
    local.set $cumulativeCount
    local.get $i
    local.get $bucketCount
    i32.lt_u
    if
     global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
     local.get $i
     i32.const 8
     i32.mul
     i32.add
     f64.load
     local.set $prevBoundary
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  call $src/ts/assembly/histogram/getMax
  return
 )
 (func $src/ts/assembly/histogram/getP50 (result f64)
  f64.const 50
  call $src/ts/assembly/histogram/calculatePercentile
  return
 )
 (func $src/ts/assembly/histogram/getP90 (result f64)
  f64.const 90
  call $src/ts/assembly/histogram/calculatePercentile
  return
 )
 (func $src/ts/assembly/histogram/getP95 (result f64)
  f64.const 95
  call $src/ts/assembly/histogram/calculatePercentile
  return
 )
 (func $src/ts/assembly/histogram/getP99 (result f64)
  f64.const 99
  call $src/ts/assembly/histogram/calculatePercentile
  return
 )
 (func $src/ts/assembly/histogram/resetHistogram
  (local $bucketCount i32)
  (local $i i32)
  global.get $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET
  i32.atomic.load
  i32.const 1
  i32.ne
  if
   return
  end
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  i32.atomic.load
  local.set $bucketCount
  global.get $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/histogram/HIST_SUM_OFFSET
  f64.const 0
  f64.store
  global.get $src/ts/assembly/histogram/HIST_MIN_OFFSET
  global.get $~lib/builtins/f64.MAX_VALUE
  f64.store
  global.get $src/ts/assembly/histogram/HIST_MAX_OFFSET
  global.get $~lib/builtins/f64.MIN_VALUE
  f64.store
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $bucketCount
   i32.le_u
   if
    global.get $src/ts/assembly/histogram/HIST_BUCKETS_OFFSET
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    i64.const 0
    i64.atomic.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $src/ts/assembly/histogram/isHistogramInitialized (result i32)
  global.get $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET
  i32.atomic.load
  i32.const 1
  i32.eq
  return
 )
 (func $src/ts/assembly/histogram/recordValuesBatch (param $valuesPtr i32) (param $count i32)
  (local $i i32)
  (local $value f64)
  global.get $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET
  i32.atomic.load
  i32.const 1
  i32.ne
  if
   return
  end
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $count
   i32.lt_s
   if
    local.get $valuesPtr
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    f64.load
    local.set $value
    local.get $value
    call $src/ts/assembly/histogram/recordValue
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapMultiplyF32 (param $input i32) (param $output i32) (param $length i32) (param $scalar f32)
  (local $scalarVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  (local $val f32)
  local.get $scalar
  f32x4.splat
  local.set $scalarVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $scalarVec
    f32x4.mul
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $val
    local.get $scalar
    f32.mul
    f32.store
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapAddF32 (param $input i32) (param $output i32) (param $length i32) (param $scalar f32)
  (local $scalarVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  (local $val f32)
  local.get $scalar
  f32x4.splat
  local.set $scalarVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $scalarVec
    f32x4.add
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $val
    local.get $scalar
    f32.add
    f32.store
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapSquareF32 (param $input i32) (param $output i32) (param $length i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|10 i32)
  (local $idx i32)
  (local $val f32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $vec
    f32x4.mul
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|10
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $val
    local.get $val
    f32.mul
    f32.store
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapSqrtF32 (param $input i32) (param $output i32) (param $length i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|10 i32)
  (local $idx i32)
  (local $val f32)
  (local $x f32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    f32x4.sqrt
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|10
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    block $~lib/math/NativeMathf.sqrt|inlined.0 (result f32)
     local.get $val
     local.set $x
     local.get $x
     f32.sqrt
     br $~lib/math/NativeMathf.sqrt|inlined.0
    end
    f32.store
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdReduceSumF32 (param $input i32) (param $length i32) (result f32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $sumVec v128)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $sum f32)
  (local $remainderOffset i32)
  (local $i|10 i32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  f32.const 0
  f32x4.splat
  local.set $sumVec
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $sumVec
    local.get $vec
    f32x4.add
    local.set $sumVec
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $sumVec
  f32x4.extract_lane 0
  local.get $sumVec
  f32x4.extract_lane 1
  f32.add
  local.get $sumVec
  f32x4.extract_lane 2
  f32.add
  local.get $sumVec
  f32x4.extract_lane 3
  f32.add
  local.set $sum
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $sum
    local.get $input
    local.get $remainderOffset
    local.get $i|10
    i32.add
    i32.const 4
    i32.mul
    i32.add
    f32.load
    f32.add
    local.set $sum
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
  local.get $sum
  return
 )
 (func $src/ts/assembly/simd-batch/simdReduceMinF32 (param $input i32) (param $length i32) (result f32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $minVec v128)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $value1 f32)
  (local $value2 f32)
  (local $value1|10 f32)
  (local $value2|11 f32)
  (local $value1|12 f32)
  (local $value2|13 f32)
  (local $minVal f32)
  (local $remainderOffset i32)
  (local $i|16 i32)
  (local $val f32)
  local.get $length
  i32.const 0
  i32.eq
  if
   global.get $~lib/builtins/f32.MAX_VALUE
   return
  end
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  global.get $~lib/builtins/f32.MAX_VALUE
  f32x4.splat
  local.set $minVec
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $minVec
    local.get $vec
    f32x4.min
    local.set $minVec
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  block $~lib/math/NativeMathf.min|inlined.2 (result f32)
   block $~lib/math/NativeMathf.min|inlined.0 (result f32)
    local.get $minVec
    f32x4.extract_lane 0
    local.set $value1
    local.get $minVec
    f32x4.extract_lane 1
    local.set $value2
    local.get $value1
    local.get $value2
    f32.min
    br $~lib/math/NativeMathf.min|inlined.0
   end
   local.set $value1|12
   block $~lib/math/NativeMathf.min|inlined.1 (result f32)
    local.get $minVec
    f32x4.extract_lane 2
    local.set $value1|10
    local.get $minVec
    f32x4.extract_lane 3
    local.set $value2|11
    local.get $value1|10
    local.get $value2|11
    f32.min
    br $~lib/math/NativeMathf.min|inlined.1
   end
   local.set $value2|13
   local.get $value1|12
   local.get $value2|13
   f32.min
   br $~lib/math/NativeMathf.min|inlined.2
  end
  local.set $minVal
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|16
  loop $for-loop|1
   local.get $i|16
   local.get $remainder
   i32.lt_s
   if
    local.get $input
    local.get $remainderOffset
    local.get $i|16
    i32.add
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $val
    local.get $minVal
    f32.lt
    if
     local.get $val
     local.set $minVal
    end
    local.get $i|16
    i32.const 1
    i32.add
    local.set $i|16
    br $for-loop|1
   end
  end
  local.get $minVal
  return
 )
 (func $src/ts/assembly/simd-batch/simdReduceMaxF32 (param $input i32) (param $length i32) (result f32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $maxVec v128)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $value1 f32)
  (local $value2 f32)
  (local $value1|10 f32)
  (local $value2|11 f32)
  (local $value1|12 f32)
  (local $value2|13 f32)
  (local $maxVal f32)
  (local $remainderOffset i32)
  (local $i|16 i32)
  (local $val f32)
  local.get $length
  i32.const 0
  i32.eq
  if
   global.get $~lib/builtins/f32.MIN_VALUE
   return
  end
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  global.get $~lib/builtins/f32.MIN_VALUE
  f32x4.splat
  local.set $maxVec
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $maxVec
    local.get $vec
    f32x4.max
    local.set $maxVec
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  block $~lib/math/NativeMathf.max|inlined.2 (result f32)
   block $~lib/math/NativeMathf.max|inlined.0 (result f32)
    local.get $maxVec
    f32x4.extract_lane 0
    local.set $value1
    local.get $maxVec
    f32x4.extract_lane 1
    local.set $value2
    local.get $value1
    local.get $value2
    f32.max
    br $~lib/math/NativeMathf.max|inlined.0
   end
   local.set $value1|12
   block $~lib/math/NativeMathf.max|inlined.1 (result f32)
    local.get $maxVec
    f32x4.extract_lane 2
    local.set $value1|10
    local.get $maxVec
    f32x4.extract_lane 3
    local.set $value2|11
    local.get $value1|10
    local.get $value2|11
    f32.max
    br $~lib/math/NativeMathf.max|inlined.1
   end
   local.set $value2|13
   local.get $value1|12
   local.get $value2|13
   f32.max
   br $~lib/math/NativeMathf.max|inlined.2
  end
  local.set $maxVal
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|16
  loop $for-loop|1
   local.get $i|16
   local.get $remainder
   i32.lt_s
   if
    local.get $input
    local.get $remainderOffset
    local.get $i|16
    i32.add
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $val
    local.get $maxVal
    f32.gt
    if
     local.get $val
     local.set $maxVal
    end
    local.get $i|16
    i32.const 1
    i32.add
    local.set $i|16
    br $for-loop|1
   end
  end
  local.get $maxVal
  return
 )
 (func $src/ts/assembly/simd-batch/simdDotProductF32 (param $a i32) (param $b i32) (param $length i32) (result f32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $sumVec v128)
  (local $i i32)
  (local $offset i32)
  (local $vecA v128)
  (local $vecB v128)
  (local $product v128)
  (local $sum f32)
  (local $remainderOffset i32)
  (local $i|13 i32)
  (local $idx i32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  f32.const 0
  f32x4.splat
  local.set $sumVec
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $a
    local.get $offset
    i32.add
    v128.load
    local.set $vecA
    local.get $b
    local.get $offset
    i32.add
    v128.load
    local.set $vecB
    local.get $vecA
    local.get $vecB
    f32x4.mul
    local.set $product
    local.get $sumVec
    local.get $product
    f32x4.add
    local.set $sumVec
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $sumVec
  f32x4.extract_lane 0
  local.get $sumVec
  f32x4.extract_lane 1
  f32.add
  local.get $sumVec
  f32x4.extract_lane 2
  f32.add
  local.get $sumVec
  f32x4.extract_lane 3
  f32.add
  local.set $sum
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|13
  loop $for-loop|1
   local.get $i|13
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|13
    i32.add
    local.set $idx
    local.get $sum
    local.get $a
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.get $b
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    f32.mul
    f32.add
    local.set $sum
    local.get $i|13
    i32.const 1
    i32.add
    local.set $i|13
    br $for-loop|1
   end
  end
  local.get $sum
  return
 )
 (func $src/ts/assembly/simd-batch/simdAddArraysF32 (param $a i32) (param $b i32) (param $output i32) (param $length i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vecA v128)
  (local $vecB v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  (local $valA f32)
  (local $valB f32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $a
    local.get $offset
    i32.add
    v128.load
    local.set $vecA
    local.get $b
    local.get $offset
    i32.add
    v128.load
    local.set $vecB
    local.get $vecA
    local.get $vecB
    f32x4.add
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $a
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $valA
    local.get $b
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $valB
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $valA
    local.get $valB
    f32.add
    f32.store
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMultiplyArraysF32 (param $a i32) (param $b i32) (param $output i32) (param $length i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vecA v128)
  (local $vecB v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  (local $valA f32)
  (local $valB f32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $a
    local.get $offset
    i32.add
    v128.load
    local.set $vecA
    local.get $b
    local.get $offset
    i32.add
    v128.load
    local.set $vecB
    local.get $vecA
    local.get $vecB
    f32x4.mul
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $a
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $valA
    local.get $b
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $valB
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $valA
    local.get $valB
    f32.mul
    f32.store
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapAbsF32 (param $input i32) (param $output i32) (param $length i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|10 i32)
  (local $idx i32)
  (local $val f32)
  (local $x f32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    f32x4.abs
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|10
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    block $~lib/math/NativeMathf.abs|inlined.0 (result f32)
     local.get $val
     local.set $x
     local.get $x
     f32.abs
     br $~lib/math/NativeMathf.abs|inlined.0
    end
    f32.store
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapNegateF32 (param $input i32) (param $output i32) (param $length i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|10 i32)
  (local $idx i32)
  (local $val f32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    f32x4.neg
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|10
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $val
    f32.neg
    f32.store
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapClampF32 (param $input i32) (param $output i32) (param $length i32) (param $minVal f32) (param $maxVal f32)
  (local $minVec v128)
  (local $maxVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $clamped v128)
  (local $remainderOffset i32)
  (local $i|14 i32)
  (local $idx i32)
  (local $val f32)
  local.get $minVal
  f32x4.splat
  local.set $minVec
  local.get $maxVal
  f32x4.splat
  local.set $maxVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $minVec
    f32x4.max
    local.get $maxVec
    f32x4.min
    local.set $clamped
    local.get $output
    local.get $offset
    i32.add
    local.get $clamped
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|14
  loop $for-loop|1
   local.get $i|14
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|14
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $val
    local.get $minVal
    f32.lt
    if
     local.get $minVal
     local.set $val
    end
    local.get $val
    local.get $maxVal
    f32.gt
    if
     local.get $maxVal
     local.set $val
    end
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $val
    f32.store
    local.get $i|14
    i32.const 1
    i32.add
    local.set $i|14
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapMultiplyF64 (param $input i32) (param $output i32) (param $length i32) (param $scalar f64)
  (local $scalarVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  (local $val f64)
  local.get $scalar
  f64x2.splat
  local.set $scalarVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F64_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F64_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $scalarVec
    f64x2.mul
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F64_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 8
    i32.mul
    i32.add
    f64.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 8
    i32.mul
    i32.add
    local.get $val
    local.get $scalar
    f64.mul
    f64.store
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdReduceSumF64 (param $input i32) (param $length i32) (result f64)
  (local $vecCount i32)
  (local $remainder i32)
  (local $sumVec v128)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $sum f64)
  (local $remainderOffset i32)
  (local $i|10 i32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/F64_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F64_LANES
  i32.rem_s
  local.set $remainder
  f64.const 0
  f64x2.splat
  local.set $sumVec
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $sumVec
    local.get $vec
    f64x2.add
    local.set $sumVec
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $sumVec
  f64x2.extract_lane 0
  local.get $sumVec
  f64x2.extract_lane 1
  f64.add
  local.set $sum
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F64_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $sum
    local.get $input
    local.get $remainderOffset
    local.get $i|10
    i32.add
    i32.const 8
    i32.mul
    i32.add
    f64.load
    f64.add
    local.set $sum
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
  local.get $sum
  return
 )
 (func $src/ts/assembly/simd-batch/simdMapMultiplyI32 (param $input i32) (param $output i32) (param $length i32) (param $scalar i32)
  (local $scalarVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $result v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  (local $val i32)
  local.get $scalar
  i32x4.splat
  local.set $scalarVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $scalarVec
    i32x4.mul
    local.set $result
    local.get $output
    local.get $offset
    i32.add
    local.get $result
    v128.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    i32.load
    local.set $val
    local.get $output
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    local.get $val
    local.get $scalar
    i32.mul
    i32.store
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdReduceSumI32 (param $input i32) (param $length i32) (result i32)
  (local $vecCount i32)
  (local $remainder i32)
  (local $sumVec v128)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $sum i32)
  (local $remainderOffset i32)
  (local $i|10 i32)
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  i32x4.splat
  local.set $sumVec
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $sumVec
    local.get $vec
    i32x4.add
    local.set $sumVec
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $sumVec
  i32x4.extract_lane 0
  local.get $sumVec
  i32x4.extract_lane 1
  i32.add
  local.get $sumVec
  i32x4.extract_lane 2
  i32.add
  local.get $sumVec
  i32x4.extract_lane 3
  i32.add
  local.set $sum
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|10
  loop $for-loop|1
   local.get $i|10
   local.get $remainder
   i32.lt_s
   if
    local.get $sum
    local.get $input
    local.get $remainderOffset
    local.get $i|10
    i32.add
    i32.const 4
    i32.mul
    i32.add
    i32.load
    i32.add
    local.set $sum
    local.get $i|10
    i32.const 1
    i32.add
    local.set $i|10
    br $for-loop|1
   end
  end
  local.get $sum
  return
 )
 (func $~lib/rt/stub/maybeGrowMemory (param $newOffset i32)
  (local $pagesBefore i32)
  (local $maxOffset i32)
  (local $pagesNeeded i32)
  (local $4 i32)
  (local $5 i32)
  (local $pagesWanted i32)
  memory.size
  local.set $pagesBefore
  local.get $pagesBefore
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $maxOffset
  local.get $newOffset
  local.get $maxOffset
  i32.gt_u
  if
   local.get $newOffset
   local.get $maxOffset
   i32.sub
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $pagesNeeded
   local.get $pagesBefore
   local.tee $4
   local.get $pagesNeeded
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $pagesWanted
   local.get $pagesWanted
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $pagesNeeded
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $newOffset
  global.set $~lib/rt/stub/offset
 )
 (func $~lib/rt/common/BLOCK#set:mmInfo (param $this i32) (param $mmInfo i32)
  local.get $this
  local.get $mmInfo
  i32.store
 )
 (func $~lib/rt/stub/__alloc (param $size i32) (result i32)
  (local $block i32)
  (local $ptr i32)
  (local $size|3 i32)
  (local $payloadSize i32)
  local.get $size
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 160
   i32.const 224
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.set $block
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.set $ptr
  block $~lib/rt/stub/computeSize|inlined.0 (result i32)
   local.get $size
   local.set $size|3
   local.get $size|3
   i32.const 4
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   i32.const 4
   i32.sub
   br $~lib/rt/stub/computeSize|inlined.0
  end
  local.set $payloadSize
  local.get $ptr
  local.get $payloadSize
  i32.add
  call $~lib/rt/stub/maybeGrowMemory
  local.get $block
  local.get $payloadSize
  call $~lib/rt/common/BLOCK#set:mmInfo
  local.get $ptr
  return
 )
 (func $~lib/memory/heap.alloc (param $size i32) (result i32)
  local.get $size
  call $~lib/rt/stub/__alloc
  return
 )
 (func $src/ts/assembly/simd-batch/allocateAligned (param $size i32) (result i32)
  (local $aligned i32)
  local.get $size
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.set $aligned
  local.get $aligned
  call $~lib/memory/heap.alloc
  return
 )
 (func $~lib/rt/common/BLOCK#get:mmInfo (param $this i32) (result i32)
  local.get $this
  i32.load
 )
 (func $~lib/rt/stub/__free (param $ptr i32)
  (local $block i32)
  local.get $ptr
  i32.const 0
  i32.ne
  if (result i32)
   local.get $ptr
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 224
   i32.const 70
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $block
  local.get $ptr
  local.get $block
  call $~lib/rt/common/BLOCK#get:mmInfo
  i32.add
  global.get $~lib/rt/stub/offset
  i32.eq
  if
   local.get $block
   global.set $~lib/rt/stub/offset
  end
 )
 (func $~lib/memory/heap.free (param $ptr i32)
  local.get $ptr
  call $~lib/rt/stub/__free
 )
 (func $src/ts/assembly/simd-batch/freeAligned (param $ptr i32)
  local.get $ptr
  call $~lib/memory/heap.free
 )
 (func $src/ts/assembly/simd-batch/copyToWasm (param $dest i32) (param $src i32) (param $length i32)
  local.get $dest
  local.get $src
  local.get $length
  memory.copy
 )
 (func $src/ts/assembly/simd-batch/copyFromWasm (param $dest i32) (param $src i32) (param $length i32)
  local.get $dest
  local.get $src
  local.get $length
  memory.copy
 )
 (func $src/ts/assembly/simd-batch/simdCountI32 (param $input i32) (param $length i32) (param $value i32) (result i32)
  (local $valueVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $count i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $cmp v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  local.get $value
  i32x4.splat
  local.set $valueVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $count
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $valueVec
    i32x4.eq
    local.set $cmp
    local.get $count
    local.get $cmp
    i32x4.extract_lane 0
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 1
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 2
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 3
    i32.sub
    local.set $count
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    i32.load
    local.get $value
    i32.eq
    if
     local.get $count
     i32.const 1
     i32.add
     local.set $count
    end
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
  local.get $count
  return
 )
 (func $src/ts/assembly/simd-batch/simdCountF32 (param $input i32) (param $length i32) (param $value f32) (result i32)
  (local $valueVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $count i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $cmp v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  local.get $value
  f32x4.splat
  local.set $valueVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $count
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $valueVec
    f32x4.eq
    local.set $cmp
    local.get $count
    local.get $cmp
    i32x4.extract_lane 0
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 1
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 2
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 3
    i32.sub
    local.set $count
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.get $value
    f32.eq
    if
     local.get $count
     i32.const 1
     i32.add
     local.set $count
    end
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
  local.get $count
  return
 )
 (func $src/ts/assembly/simd-batch/simdIndexOfI32 (param $input i32) (param $length i32) (param $value i32) (result i32)
  (local $valueVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $cmp v128)
  (local $remainderOffset i32)
  (local $i|11 i32)
  (local $idx i32)
  local.get $value
  i32x4.splat
  local.set $valueVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $valueVec
    i32x4.eq
    local.set $cmp
    local.get $cmp
    i32x4.extract_lane 0
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/I32_LANES
     i32.mul
     i32.const 0
     i32.add
     return
    end
    local.get $cmp
    i32x4.extract_lane 1
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/I32_LANES
     i32.mul
     i32.const 1
     i32.add
     return
    end
    local.get $cmp
    i32x4.extract_lane 2
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/I32_LANES
     i32.mul
     i32.const 2
     i32.add
     return
    end
    local.get $cmp
    i32x4.extract_lane 3
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/I32_LANES
     i32.mul
     i32.const 3
     i32.add
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/I32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|11
  loop $for-loop|1
   local.get $i|11
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|11
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    i32.load
    local.get $value
    i32.eq
    if
     local.get $idx
     return
    end
    local.get $i|11
    i32.const 1
    i32.add
    local.set $i|11
    br $for-loop|1
   end
  end
  i32.const -1
  return
 )
 (func $src/ts/assembly/simd-batch/simdIndexOfF32 (param $input i32) (param $length i32) (param $value f32) (result i32)
  (local $valueVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $cmp v128)
  (local $remainderOffset i32)
  (local $i|11 i32)
  (local $idx i32)
  local.get $value
  f32x4.splat
  local.set $valueVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $valueVec
    f32x4.eq
    local.set $cmp
    local.get $cmp
    i32x4.extract_lane 0
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/F32_LANES
     i32.mul
     i32.const 0
     i32.add
     return
    end
    local.get $cmp
    i32x4.extract_lane 1
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/F32_LANES
     i32.mul
     i32.const 1
     i32.add
     return
    end
    local.get $cmp
    i32x4.extract_lane 2
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/F32_LANES
     i32.mul
     i32.const 2
     i32.add
     return
    end
    local.get $cmp
    i32x4.extract_lane 3
    i32.const 0
    i32.ne
    if
     local.get $i
     global.get $src/ts/assembly/simd-batch/F32_LANES
     i32.mul
     i32.const 3
     i32.add
     return
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|11
  loop $for-loop|1
   local.get $i|11
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|11
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.get $value
    f32.eq
    if
     local.get $idx
     return
    end
    local.get $i|11
    i32.const 1
    i32.add
    local.set $i|11
    br $for-loop|1
   end
  end
  i32.const -1
  return
 )
 (func $src/ts/assembly/simd-batch/simdIncludesI32 (param $input i32) (param $length i32) (param $value i32) (result i32)
  local.get $input
  local.get $length
  local.get $value
  call $src/ts/assembly/simd-batch/simdIndexOfI32
  i32.const 0
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  return
 )
 (func $src/ts/assembly/simd-batch/simdIncludesF32 (param $input i32) (param $length i32) (param $value f32) (result i32)
  local.get $input
  local.get $length
  local.get $value
  call $src/ts/assembly/simd-batch/simdIndexOfF32
  i32.const 0
  i32.ge_s
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  return
 )
 (func $src/ts/assembly/simd-batch/simdCountGreaterThanF32 (param $input i32) (param $length i32) (param $threshold f32) (result i32)
  (local $thresholdVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $count i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $cmp v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  local.get $threshold
  f32x4.splat
  local.set $thresholdVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $count
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $thresholdVec
    f32x4.gt
    local.set $cmp
    local.get $count
    local.get $cmp
    i32x4.extract_lane 0
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 1
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 2
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 3
    i32.sub
    local.set $count
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.get $threshold
    f32.gt
    if
     local.get $count
     i32.const 1
     i32.add
     local.set $count
    end
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
  local.get $count
  return
 )
 (func $src/ts/assembly/simd-batch/simdCountLessThanF32 (param $input i32) (param $length i32) (param $threshold f32) (result i32)
  (local $thresholdVec v128)
  (local $vecCount i32)
  (local $remainder i32)
  (local $count i32)
  (local $i i32)
  (local $offset i32)
  (local $vec v128)
  (local $cmp v128)
  (local $remainderOffset i32)
  (local $i|12 i32)
  (local $idx i32)
  local.get $threshold
  f32x4.splat
  local.set $thresholdVec
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.div_s
  local.set $vecCount
  local.get $length
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.rem_s
  local.set $remainder
  i32.const 0
  local.set $count
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $vecCount
   i32.lt_s
   if
    local.get $i
    i32.const 16
    i32.mul
    local.set $offset
    local.get $input
    local.get $offset
    i32.add
    v128.load
    local.set $vec
    local.get $vec
    local.get $thresholdVec
    f32x4.lt
    local.set $cmp
    local.get $count
    local.get $cmp
    i32x4.extract_lane 0
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 1
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 2
    i32.sub
    local.set $count
    local.get $count
    local.get $cmp
    i32x4.extract_lane 3
    i32.sub
    local.set $count
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $vecCount
  global.get $src/ts/assembly/simd-batch/F32_LANES
  i32.mul
  local.set $remainderOffset
  i32.const 0
  local.set $i|12
  loop $for-loop|1
   local.get $i|12
   local.get $remainder
   i32.lt_s
   if
    local.get $remainderOffset
    local.get $i|12
    i32.add
    local.set $idx
    local.get $input
    local.get $idx
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.get $threshold
    f32.lt
    if
     local.get $count
     i32.const 1
     i32.add
     local.set $count
    end
    local.get $i|12
    i32.const 1
    i32.add
    local.set $i|12
    br $for-loop|1
   end
  end
  local.get $count
  return
 )
 (func $src/ts/assembly/simd-batch/simdPartitionF32 (param $input i32) (param $length i32) (param $threshold f32) (param $outputLess i32) (param $outputGreaterOrEqual i32) (result i32)
  (local $lessCount i32)
  (local $greaterOrEqualCount i32)
  (local $i i32)
  (local $val f32)
  i32.const 0
  local.set $lessCount
  i32.const 0
  local.set $greaterOrEqualCount
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $length
   i32.lt_s
   if
    local.get $input
    local.get $i
    i32.const 4
    i32.mul
    i32.add
    f32.load
    local.set $val
    local.get $val
    local.get $threshold
    f32.lt
    if
     local.get $outputLess
     local.get $lessCount
     i32.const 4
     i32.mul
     i32.add
     local.get $val
     f32.store
     local.get $lessCount
     i32.const 1
     i32.add
     local.set $lessCount
    else
     local.get $outputGreaterOrEqual
     local.get $greaterOrEqualCount
     i32.const 4
     i32.mul
     i32.add
     local.get $val
     f32.store
     local.get $greaterOrEqualCount
     i32.const 1
     i32.add
     local.set $greaterOrEqualCount
    end
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $lessCount
  return
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo (param $this i32) (param $gcInfo i32)
  local.get $this
  local.get $gcInfo
  i32.store offset=4
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo2 (param $this i32) (param $gcInfo2 i32)
  local.get $this
  local.get $gcInfo2
  i32.store offset=8
 )
 (func $~lib/rt/common/OBJECT#set:rtId (param $this i32) (param $rtId i32)
  local.get $this
  local.get $rtId
  i32.store offset=12
 )
 (func $~lib/rt/common/OBJECT#set:rtSize (param $this i32) (param $rtSize i32)
  local.get $this
  local.get $rtSize
  i32.store offset=16
 )
 (func $~lib/rt/stub/__new (param $size i32) (param $id i32) (result i32)
  (local $ptr i32)
  (local $object i32)
  local.get $size
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 160
   i32.const 224
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 16
  local.get $size
  i32.add
  call $~lib/rt/stub/__alloc
  local.set $ptr
  local.get $ptr
  i32.const 4
  i32.sub
  local.set $object
  local.get $object
  i32.const 0
  call $~lib/rt/common/OBJECT#set:gcInfo
  local.get $object
  i32.const 0
  call $~lib/rt/common/OBJECT#set:gcInfo2
  local.get $object
  local.get $id
  call $~lib/rt/common/OBJECT#set:rtId
  local.get $object
  local.get $size
  call $~lib/rt/common/OBJECT#set:rtSize
  local.get $ptr
  i32.const 16
  i32.add
  return
 )
 (func $~lib/rt/stub/__pin (param $ptr i32) (result i32)
  local.get $ptr
  return
 )
 (func $~lib/rt/stub/__unpin (param $ptr i32)
 )
 (func $~lib/rt/stub/__collect
 )
 (func $~setArgumentsLength (param $0 i32)
  local.get $0
  global.set $~argumentsLength
 )
 (func $~start
  global.get $~started
  if
   return
  end
  i32.const 1
  global.set $~started
  global.get $~lib/memory/__heap_base
  i32.const 4
  i32.add
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  i32.const 4
  i32.sub
  global.set $~lib/rt/stub/startOffset
  global.get $~lib/rt/stub/startOffset
  global.set $~lib/rt/stub/offset
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  global.get $~lib/memory/__data_end
  i32.lt_s
  if
   i32.const 33088
   i32.const 33136
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $src/ts/assembly/histogram/initHistogramWithBuckets (param $bucketCount i32) (result i32)
  (local $i i32)
  (local $2 i32)
  (local $3 i32)
  (local $boundaryCount i32)
  (local $i|5 i32)
  (local $i|6 i32)
  (local $7 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  local.get $bucketCount
  i32.const 0
  i32.le_s
  if (result i32)
   i32.const 1
  else
   local.get $bucketCount
   global.get $src/ts/assembly/histogram/MAX_HISTOGRAM_BUCKETS
   i32.gt_s
  end
  if
   i32.const 0
   local.set $7
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $7
   return
  end
  global.get $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET
  i32.atomic.load
  i32.const 1
  i32.eq
  if
   i32.const 0
   local.set $7
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   local.get $7
   return
  end
  global.get $src/ts/assembly/histogram/HIST_BUCKET_COUNT_OFFSET
  local.get $bucketCount
  i32.atomic.store
  global.get $src/ts/assembly/histogram/HIST_TOTAL_COUNT_OFFSET
  i64.const 0
  i64.atomic.store
  global.get $src/ts/assembly/histogram/HIST_SUM_OFFSET
  f64.const 0
  f64.store
  global.get $src/ts/assembly/histogram/HIST_MIN_OFFSET
  global.get $~lib/builtins/f64.MAX_VALUE
  f64.store
  global.get $src/ts/assembly/histogram/HIST_MAX_OFFSET
  global.get $~lib/builtins/f64.MIN_VALUE
  f64.store
  i32.const 0
  local.set $i
  loop $for-loop|0
   local.get $i
   local.get $bucketCount
   i32.le_u
   if
    global.get $src/ts/assembly/histogram/HIST_BUCKETS_OFFSET
    local.get $i
    i32.const 8
    i32.mul
    i32.add
    i64.const 0
    i64.atomic.store
    local.get $i
    i32.const 1
    i32.add
    local.set $i
    br $for-loop|0
   end
  end
  local.get $bucketCount
  local.tee $2
  global.get $src/ts/assembly/histogram/DEFAULT_BOUNDARIES
  local.set $7
  global.get $~lib/memory/__stack_pointer
  local.get $7
  i32.store
  local.get $7
  call $~lib/staticarray/StaticArray<f64>#get:length
  local.tee $3
  local.get $2
  local.get $3
  i32.lt_s
  select
  local.set $boundaryCount
  i32.const 0
  local.set $i|5
  loop $for-loop|1
   local.get $i|5
   local.get $boundaryCount
   i32.lt_s
   if
    global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
    local.get $i|5
    i32.const 8
    i32.mul
    i32.add
    global.get $src/ts/assembly/histogram/DEFAULT_BOUNDARIES
    local.set $7
    global.get $~lib/memory/__stack_pointer
    local.get $7
    i32.store
    local.get $7
    local.get $i|5
    call $~lib/staticarray/StaticArray<f64>#__uget
    f64.store
    local.get $i|5
    i32.const 1
    i32.add
    local.set $i|5
    br $for-loop|1
   end
  end
  local.get $boundaryCount
  local.set $i|6
  loop $for-loop|2
   local.get $i|6
   local.get $bucketCount
   i32.lt_s
   if
    global.get $src/ts/assembly/histogram/HIST_BOUNDARIES_OFFSET
    local.get $i|6
    i32.const 8
    i32.mul
    i32.add
    global.get $~lib/builtins/f64.MAX_VALUE
    f64.store
    local.get $i|6
    i32.const 1
    i32.add
    local.set $i|6
    br $for-loop|2
   end
  end
  global.get $src/ts/assembly/histogram/HIST_INITIALIZED_OFFSET
  i32.const 1
  i32.atomic.store
  i32.const 1
  local.set $7
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $7
  return
 )
 (func $src/ts/assembly/histogram/initHistogram (result i32)
  (local $0 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  global.get $src/ts/assembly/histogram/DEFAULT_BOUNDARIES
  local.set $0
  global.get $~lib/memory/__stack_pointer
  local.get $0
  i32.store
  local.get $0
  call $~lib/staticarray/StaticArray<f64>#get:length
  call $src/ts/assembly/histogram/initHistogramWithBuckets
  local.set $0
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  local.get $0
  return
 )
)
