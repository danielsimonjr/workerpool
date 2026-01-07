(module
 (type $0 (func (result i32)))
 (type $1 (func (param i32) (result i32)))
 (type $2 (func))
 (type $3 (func (result i64)))
 (type $4 (func (param i32)))
 (type $5 (func (param i32 i32) (result i32)))
 (type $6 (func (result f64)))
 (type $7 (func (param i32) (result i64)))
 (type $8 (func (param i64) (result i32)))
 (type $9 (func (param i32 i32)))
 (type $10 (func (param i32 i32 i32)))
 (type $11 (func (param i32 i32 f32) (result i32)))
 (type $12 (func (param i32 i32 i32) (result i32)))
 (type $13 (func (param i32 i32 i32 i32)))
 (type $14 (func (param i32 i32) (result f32)))
 (type $15 (func (param i32 i32) (result i64)))
 (type $16 (func (param i32 i64)))
 (type $17 (func (param i32 i32 i32 f32)))
 (type $18 (func (param i32 i64 i64) (result i32)))
 (type $19 (func (param i32 f64)))
 (type $20 (func (param i32) (result f64)))
 (type $21 (func (param f64)))
 (type $22 (func (param f64) (result f64)))
 (type $23 (func (param i32 i32 i32) (result f32)))
 (type $24 (func (param i32 i32 i32 f32 f32)))
 (type $25 (func (param i32 i32 i32 f64)))
 (type $26 (func (param i32 i32) (result f64)))
 (type $27 (func (param i32 i32 f32 i32 i32) (result i32)))
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
 (global $src/ts/assembly/atomics/MAX_CAS_RETRIES i32 (i32.const 1000))
 (global $src/ts/assembly/histogram/MAX_HISTOGRAM_BUCKETS i32 (i32.const 32))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 1296))
 (global $~lib/memory/__stack_pointer (mut i32) (i32.const 34088))
 (global $~started (mut i32) (i32.const 0))
 (data $0 (i32.const 1036) "|\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00`\00\00\00\00\00\00\00\00\00\f0?\00\00\00\00\00\00\14@\00\00\00\00\00\00$@\00\00\00\00\00\009@\00\00\00\00\00\00I@\00\00\00\00\00\00Y@\00\00\00\00\00@o@\00\00\00\00\00@\7f@\00\00\00\00\00@\8f@\00\00\00\00\00\88\a3@\00\00\00\00\00\88\b3@\00\00\00\00\00\88\c3@\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 1164) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $2 (i32.const 1228) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 1296) "\05\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00$\1a\00\00")
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
 (export "unpackErrorCode" (func $src/ts/assembly/ring-buffer/unpackPriority))
 (export "unpackValue" (func $src/ts/assembly/priority-queue/unpackSlotIndex))
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
 (export "seqlockWriteBegin" (func $src/ts/assembly/atomics/atomicIncrement))
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
 (export "copyFromWasm" (func $src/ts/assembly/simd-batch/copyToWasm))
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
 (export "__collect" (func $src/ts/assembly/atomics/memoryFence))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "memory" (memory $0))
 (export "__setArgumentsLength" (func $~setArgumentsLength))
 (export "_initialize" (func $~start))
 (func $src/ts/assembly/memory/isPowerOf2 (param $0 i32) (result i32)
  local.get $0
  local.get $0
  i32.const 1
  i32.sub
  i32.and
  i32.const 1
  local.get $0
  select
  i32.eqz
 )
 (func $src/ts/assembly/memory/nextPowerOf2 (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 1
   return
  end
  local.get $0
  i32.const 1
  i32.sub
  local.tee $0
  i32.const 1
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 2
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 4
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 8
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 16
  i32.shr_u
  local.get $0
  i32.or
  i32.const 1
  i32.add
 )
 (func $src/ts/assembly/memory/calculateMemorySize (param $0 i32) (result i32)
  local.get $0
  call $src/ts/assembly/memory/isPowerOf2
  i32.eqz
  if
   local.get $0
   call $src/ts/assembly/memory/nextPowerOf2
   local.set $0
  end
  local.get $0
  i32.const 3
  i32.shl
  i32.const -64
  i32.sub
  local.get $0
  i32.const 6
  i32.shl
  i32.add
 )
 (func $src/ts/assembly/memory/initMemory (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 0
  i32.atomic.load
  i32.const 1464880972
  i32.eq
  if
   i32.const 0
   return
  end
  local.get $0
  call $src/ts/assembly/memory/isPowerOf2
  i32.eqz
  if
   local.get $0
   call $src/ts/assembly/memory/nextPowerOf2
   local.set $0
  end
  i32.const 0
  i32.const 1464880972
  i32.atomic.store
  i32.const 4
  i32.const 1
  i32.atomic.store
  i32.const 8
  i64.const 0
  i64.atomic.store
  i32.const 16
  i64.const 0
  i64.atomic.store
  i32.const 24
  local.get $0
  i32.atomic.store
  i32.const 28
  local.get $0
  i32.const 1
  i32.sub
  i32.atomic.store
  i32.const 32
  i32.const 0
  i32.atomic.store
  i32.const 40
  local.get $0
  i32.const 3
  i32.shl
  i32.const -64
  i32.sub
  i32.atomic.store
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.gt_u
   if
    local.get $1
    i32.const 3
    i32.shl
    i32.const -64
    i32.sub
    i64.const 0
    i64.atomic.store
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 1
 )
 (func $src/ts/assembly/memory/validateMemory (result i32)
  (local $0 i32)
  i32.const 0
  i32.atomic.load
  local.set $0
  i32.const 4
  i32.atomic.load
  i32.const 1
  i32.eq
  local.get $0
  i32.const 1464880972
  i32.eq
  i32.and
 )
 (func $src/ts/assembly/memory/getCapacity (result i32)
  i32.const 24
  i32.atomic.load
 )
 (func $src/ts/assembly/memory/getMask (result i32)
  i32.const 28
  i32.atomic.load
 )
 (func $src/ts/assembly/memory/getSlotsBase (result i32)
  i32.const 40
  i32.atomic.load
 )
 (func $src/ts/assembly/memory/getHead (result i64)
  i32.const 8
  i64.atomic.load
 )
 (func $src/ts/assembly/memory/getTail (result i64)
  i32.const 16
  i64.atomic.load
 )
 (func $src/ts/assembly/memory/getSlotAddress (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
 )
 (func $src/ts/assembly/ring-buffer/packEntry (param $0 i32) (param $1 i32) (result i64)
  local.get $0
  i32.const 1
  i32.add
  i64.extend_i32_u
  local.get $1
  i64.extend_i32_u
  i64.const 32
  i64.shl
  i64.or
 )
 (func $src/ts/assembly/ring-buffer/unpackSlotIndex (param $0 i64) (result i32)
  local.get $0
  i64.const 4294967295
  i64.and
  i64.const 1
  i64.sub
  i32.wrap_i64
 )
 (func $src/ts/assembly/ring-buffer/unpackPriority (param $0 i64) (result i32)
  local.get $0
  i64.const 32
  i64.shr_u
  i32.wrap_i64
 )
 (func $src/ts/assembly/ring-buffer/getEntryAddress (param $0 i64) (result i32)
  local.get $0
  i32.const 28
  i64.atomic.load32_u
  i64.and
  i32.wrap_i64
  i32.const 3
  i32.shl
  i32.const -64
  i32.sub
 )
 (func $src/ts/assembly/ring-buffer/push@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
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
   local.set $1
  end
  block $__inlined_func$src/ts/assembly/ring-buffer/push$68 (result i32)
   i32.const 0
   call $src/ts/assembly/memory/validateMemory
   i32.eqz
   br_if $__inlined_func$src/ts/assembly/ring-buffer/push$68
   drop
   i32.const 24
   i64.atomic.load32_u
   local.set $2
   local.get $0
   local.get $1
   call $src/ts/assembly/ring-buffer/packEntry
   local.set $3
   loop $while-continue|0
    i32.const 0
    i32.const 16
    i64.atomic.load
    local.tee $4
    i32.const 8
    i64.atomic.load
    i64.sub
    local.get $2
    i64.ge_u
    br_if $__inlined_func$src/ts/assembly/ring-buffer/push$68
    drop
    i32.const 0
    local.get $4
    call $src/ts/assembly/ring-buffer/getEntryAddress
    local.tee $0
    i64.atomic.load
    i64.const 0
    i64.ne
    br_if $__inlined_func$src/ts/assembly/ring-buffer/push$68
    drop
    local.get $0
    i64.const 0
    local.get $3
    i64.atomic.rmw.cmpxchg
    i64.eqz
    i32.eqz
    br_if $while-continue|0
   end
   i32.const 16
   i64.const 1
   i64.atomic.rmw.add
   drop
   i32.const 1
  end
 )
 (func $src/ts/assembly/ring-buffer/pop (result i64)
  (local $0 i64)
  (local $1 i32)
  (local $2 i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i64.const 0
   return
  end
  loop $while-continue|0
   i32.const 8
   i64.atomic.load
   local.tee $0
   i32.const 16
   i64.atomic.load
   i64.ge_u
   if
    i64.const 0
    return
   end
   local.get $0
   call $src/ts/assembly/ring-buffer/getEntryAddress
   local.tee $1
   i64.atomic.load
   local.tee $2
   i64.eqz
   if
    i64.const 0
    return
   end
   local.get $0
   i32.const 8
   local.get $0
   local.get $0
   i64.const 1
   i64.add
   i64.atomic.rmw.cmpxchg
   i64.ne
   br_if $while-continue|0
  end
  local.get $1
  i64.const 0
  i64.atomic.store
  local.get $2
 )
 (func $src/ts/assembly/ring-buffer/size (result i32)
  (local $0 i64)
  (local $1 i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 8
  i64.atomic.load
  local.tee $0
  i32.const 16
  i64.atomic.load
  local.tee $1
  i64.le_u
  if
   local.get $1
   local.get $0
   i64.sub
   i32.wrap_i64
   return
  end
  i32.const 0
 )
 (func $src/ts/assembly/ring-buffer/isEmpty (result i32)
  call $src/ts/assembly/ring-buffer/size
  i32.eqz
 )
 (func $src/ts/assembly/ring-buffer/isFull (result i32)
  (local $0 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 1
   return
  end
  i32.const 24
  i32.atomic.load
  local.set $0
  call $src/ts/assembly/ring-buffer/size
  local.get $0
  i32.ge_u
 )
 (func $src/ts/assembly/ring-buffer/clear
  (local $0 i32)
  (local $1 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  i32.const 24
  i32.atomic.load
  local.set $1
  i32.const 8
  i64.const 0
  i64.atomic.store
  i32.const 16
  i64.const 0
  i64.atomic.store
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $0
    i32.const 3
    i32.shl
    i32.const -64
    i32.sub
    i64.const 0
    i64.atomic.store
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
 )
 (func $src/ts/assembly/ring-buffer/contains (param $0 i32) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 8
  i64.atomic.load
  local.set $1
  i32.const 16
  i64.atomic.load
  local.set $2
  i32.const 28
  i32.atomic.load
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i64.lt_u
   if
    local.get $0
    local.get $1
    local.get $3
    i64.extend_i32_u
    i64.and
    i32.wrap_i64
    i32.const 3
    i32.shl
    i32.const -64
    i32.sub
    i64.atomic.load
    local.tee $4
    i64.const 4294967295
    i64.and
    i64.const 1
    i64.sub
    i32.wrap_i64
    i32.eq
    local.get $4
    i64.const 0
    i64.ne
    i32.and
    if
     i32.const 1
     return
    end
    local.get $1
    i64.const 1
    i64.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 0
 )
 (func $src/ts/assembly/task-slots/initTaskSlots
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  i32.const 24
  i32.atomic.load
  local.set $3
  i32.const 40
  i32.atomic.load
  local.set $2
  loop $for-loop|0
   local.get $1
   local.get $3
   i32.lt_u
   if
    local.get $2
    local.get $1
    i32.const 6
    i32.shl
    i32.add
    local.tee $4
    i32.const 0
    i32.atomic.store
    local.get $4
    i32.const -1
    local.get $1
    i32.const 1
    i32.add
    local.tee $0
    local.get $1
    local.get $3
    i32.const 1
    i32.sub
    i32.ge_u
    select
    i32.atomic.store offset=4
    local.get $4
    i32.const 0
    i32.atomic.store offset=8
    local.get $4
    i64.const 0
    i64.atomic.store offset=16
    local.get $4
    i32.const 0
    i32.atomic.store offset=24
    local.get $4
    i32.const 0
    i32.atomic.store offset=28
    local.get $0
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 48
  i32.const 0
  i32.atomic.store
  i32.const 32
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/task-slots/allocateSlot (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const -1
   return
  end
  i32.const 40
  i32.atomic.load
  local.set $2
  loop $while-continue|0
   i32.const 48
   i32.atomic.load
   local.tee $0
   i32.const -1
   i32.eq
   if
    i32.const -1
    return
   end
   local.get $0
   i32.const 48
   local.get $0
   local.get $2
   local.get $0
   i32.const 6
   i32.shl
   i32.add
   local.tee $1
   i32.atomic.load offset=4
   i32.atomic.rmw.cmpxchg
   i32.ne
   br_if $while-continue|0
  end
  local.get $1
  i32.const 1
  i32.atomic.store
  local.get $1
  i32.const 1
  i32.atomic.store offset=28
  i32.const 32
  i32.const 1
  i32.atomic.rmw.add
  drop
  local.get $0
 )
 (func $src/ts/assembly/task-slots/freeSlot (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  i32.const 24
  i32.atomic.load
  local.get $0
  i32.le_u
  if
   return
  end
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  local.tee $1
  i32.atomic.load
  i32.eqz
  if
   return
  end
  loop $while-continue|0
   local.get $1
   i32.const 48
   i32.atomic.load
   local.tee $2
   i32.atomic.store offset=4
   local.get $1
   i32.const 0
   i32.atomic.store
   local.get $2
   i32.const 48
   local.get $2
   local.get $0
   i32.atomic.rmw.cmpxchg
   i32.ne
   br_if $while-continue|0
  end
  i32.const 32
  i32.const 1
  i32.atomic.rmw.sub
  drop
 )
 (func $src/ts/assembly/task-slots/setTaskId (param $0 i32) (param $1 i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  local.get $1
  i32.atomic.store offset=4
 )
 (func $src/ts/assembly/task-slots/getTaskId (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.atomic.load offset=4
 )
 (func $src/ts/assembly/task-slots/setPriority (param $0 i32) (param $1 i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  local.get $1
  i32.atomic.store offset=8
 )
 (func $src/ts/assembly/task-slots/getPriority (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.atomic.load offset=8
 )
 (func $src/ts/assembly/task-slots/setTimestamp (param $0 i32) (param $1 i64)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  local.get $1
  i64.atomic.store offset=16
 )
 (func $src/ts/assembly/task-slots/getTimestamp (param $0 i32) (result i64)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i64.atomic.load offset=16
 )
 (func $src/ts/assembly/task-slots/setMethodId (param $0 i32) (param $1 i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  local.get $1
  i32.atomic.store offset=24
 )
 (func $src/ts/assembly/task-slots/getMethodId (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.atomic.load offset=24
 )
 (func $src/ts/assembly/task-slots/addRef (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.const 28
  i32.add
  i32.const 1
  i32.atomic.rmw.add
  i32.const 1
  i32.add
 )
 (func $src/ts/assembly/task-slots/release (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.const 28
  i32.add
  i32.const 1
  i32.atomic.rmw.sub
  i32.const 1
  i32.sub
  local.tee $1
  i32.eqz
  if
   local.get $0
   call $src/ts/assembly/task-slots/freeSlot
  end
  local.get $1
 )
 (func $src/ts/assembly/task-slots/getRefCount (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.atomic.load offset=28
 )
 (func $src/ts/assembly/task-slots/getAllocatedCount (result i32)
  i32.const 32
  i32.atomic.load
 )
 (func $src/ts/assembly/task-slots/isAllocated (param $0 i32) (result i32)
  i32.const 40
  i32.atomic.load
  local.get $0
  i32.const 6
  i32.shl
  i32.add
  i32.atomic.load
  i32.const 1
  i32.eq
 )
 (func $src/ts/assembly/priority-queue/initPriorityQueue
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  i32.const 52
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/priority-queue/getPriorityQueueSize (result i32)
  i32.const 52
  i32.atomic.load
 )
 (func $src/ts/assembly/priority-queue/isPriorityQueueEmpty (result i32)
  i32.const 52
  i32.atomic.load
  i32.eqz
 )
 (func $src/ts/assembly/priority-queue/getHeapBase (result i32)
  i32.const 40
  i32.atomic.load
  i32.const 24
  i32.atomic.load
  i32.const 6
  i32.shl
  i32.add
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePush (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 24
  i32.atomic.load
  local.set $3
  loop $while-continue|0
   local.get $3
   i32.const 52
   i32.atomic.load
   local.tee $2
   i32.le_u
   if
    i32.const 0
    return
   end
   local.get $2
   i32.const 52
   local.get $2
   local.get $2
   i32.const 1
   i32.add
   i32.atomic.rmw.cmpxchg
   i32.ne
   br_if $while-continue|0
  end
  call $src/ts/assembly/priority-queue/getHeapBase
  local.get $2
  i32.const 3
  i32.shl
  i32.add
  local.get $0
  i64.extend_i32_u
  i32.const -1
  local.get $1
  i32.sub
  i64.extend_i32_u
  i64.const 32
  i64.shl
  i64.or
  i64.atomic.store
  local.get $2
  local.set $0
  loop $while-continue|01
   local.get $0
   if
    block $while-break|00
     call $src/ts/assembly/priority-queue/getHeapBase
     local.get $0
     i32.const 1
     i32.sub
     i32.const 1
     i32.shr_u
     local.tee $1
     i32.const 3
     i32.shl
     i32.add
     local.set $2
     call $src/ts/assembly/priority-queue/getHeapBase
     local.get $0
     i32.const 3
     i32.shl
     i32.add
     local.set $0
     local.get $2
     i64.atomic.load
     local.tee $4
     local.get $0
     i64.atomic.load
     local.tee $5
     i64.le_u
     br_if $while-break|00
     local.get $2
     local.get $5
     i64.atomic.store
     local.get $0
     local.get $4
     i64.atomic.store
     local.get $1
     local.set $0
     br $while-continue|01
    end
   end
  end
  i32.const 1
 )
 (func $src/ts/assembly/priority-queue/unpackSlotIndex (param $0 i64) (result i32)
  local.get $0
  i64.const 4294967295
  i64.and
  i32.wrap_i64
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePop (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const -1
   return
  end
  loop $while-continue|0
   i32.const 52
   i32.atomic.load
   local.tee $0
   i32.eqz
   if
    i32.const -1
    return
   end
   local.get $0
   i32.const 52
   local.get $0
   local.get $0
   i32.const 1
   i32.sub
   local.tee $7
   i32.atomic.rmw.cmpxchg
   i32.ne
   br_if $while-continue|0
  end
  call $src/ts/assembly/priority-queue/getHeapBase
  local.tee $0
  i64.atomic.load
  i64.const 4294967295
  i64.and
  i32.wrap_i64
  local.get $7
  if
   local.get $0
   call $src/ts/assembly/priority-queue/getHeapBase
   local.get $7
   i32.const 3
   i32.shl
   i32.add
   local.tee $0
   i64.atomic.load
   i64.atomic.store
   local.get $0
   i64.const 0
   i64.atomic.store
   loop $while-continue|00
    local.get $1
    i32.const 1
    i32.shl
    local.tee $0
    i32.const 2
    i32.add
    local.set $6
    call $src/ts/assembly/priority-queue/getHeapBase
    local.get $1
    i32.const 3
    i32.shl
    i32.add
    local.tee $3
    i64.atomic.load
    local.set $5
    local.get $0
    i32.const 1
    i32.add
    local.tee $0
    local.get $7
    i32.lt_u
    if (result i32)
     local.get $0
     local.get $1
     call $src/ts/assembly/priority-queue/getHeapBase
     local.get $0
     i32.const 3
     i32.shl
     i32.add
     i64.atomic.load
     local.get $5
     i64.lt_u
     select
    else
     local.get $1
    end
    local.set $0
    local.get $1
    local.get $6
    local.get $7
    i32.lt_u
    if (result i32)
     local.get $6
     local.get $0
     call $src/ts/assembly/priority-queue/getHeapBase
     local.get $6
     i32.const 3
     i32.shl
     i32.add
     i64.atomic.load
     call $src/ts/assembly/priority-queue/getHeapBase
     local.get $0
     i32.const 3
     i32.shl
     i32.add
     i64.atomic.load
     i64.lt_u
     select
    else
     local.get $0
    end
    local.tee $1
    i32.ne
    if
     call $src/ts/assembly/priority-queue/getHeapBase
     local.get $1
     i32.const 3
     i32.shl
     i32.add
     local.tee $0
     i64.atomic.load
     local.set $2
     local.get $0
     local.get $5
     i64.atomic.store
     local.get $3
     local.get $2
     i64.atomic.store
     br $while-continue|00
    end
   end
  else
   local.get $0
   i64.const 0
   i64.atomic.store
  end
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePeek (result i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const -1
   return
  end
  i32.const 52
  i32.atomic.load
  i32.eqz
  if
   i32.const -1
   return
  end
  call $src/ts/assembly/priority-queue/getHeapBase
  i64.atomic.load
  i64.const 4294967295
  i64.and
  i32.wrap_i64
 )
 (func $src/ts/assembly/priority-queue/priorityQueuePeekPriority (result i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const 52
  i32.atomic.load
  i32.eqz
  if
   i32.const 0
   return
  end
  i32.const -1
  call $src/ts/assembly/priority-queue/getHeapBase
  i64.atomic.load
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  i32.sub
 )
 (func $src/ts/assembly/priority-queue/priorityQueueClear
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  i32.const 52
  i32.atomic.load
  local.set $1
  call $src/ts/assembly/priority-queue/getHeapBase
  local.set $2
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $2
    local.get $0
    i32.const 3
    i32.shl
    i32.add
    i64.const 0
    i64.atomic.store
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
  i32.const 52
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/priority-queue/isPriorityQueueFull (result i32)
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   i32.const 1
   return
  end
  i32.const 24
  i32.atomic.load
  i32.const 52
  i32.atomic.load
  i32.le_u
 )
 (func $src/ts/assembly/circular-buffer/initBuffer (param $0 i32)
  (local $1 i32)
  i32.const 1
  local.set $1
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.gt_u
   if
    local.get $1
    i32.const 1
    i32.shl
    local.set $1
    br $while-continue|0
   end
  end
  local.get $1
  global.set $src/ts/assembly/circular-buffer/bufferCapacity
  local.get $1
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
 )
 (func $src/ts/assembly/circular-buffer/getBufferSize (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
 )
 (func $src/ts/assembly/circular-buffer/pushGrowable (param $0 i32) (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.eq
  if
   global.get $src/ts/assembly/circular-buffer/bufferCapacity
   i32.const 1
   i32.shl
   local.tee $0
   global.set $src/ts/assembly/circular-buffer/bufferCapacity
   local.get $0
   i32.const 1
   i32.sub
   global.set $src/ts/assembly/circular-buffer/bufferMask
  end
  global.get $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  global.get $src/ts/assembly/circular-buffer/bufferTail
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferSize
 )
 (func $src/ts/assembly/circular-buffer/pushWithEviction (param $0 i32) (result i32)
  i32.const -1
  local.set $0
  global.get $src/ts/assembly/circular-buffer/bufferSize
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.eq
  if
   global.get $src/ts/assembly/circular-buffer/bufferHead
   global.get $src/ts/assembly/circular-buffer/bufferMask
   i32.and
   local.set $0
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
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferTail
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferSize
  local.get $0
 )
 (func $src/ts/assembly/circular-buffer/shift (result i32)
  (local $0 i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.eqz
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferHead
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
  global.get $src/ts/assembly/circular-buffer/bufferHead
  i32.const 1
  i32.add
  global.set $src/ts/assembly/circular-buffer/bufferHead
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 1
  i32.sub
  global.set $src/ts/assembly/circular-buffer/bufferSize
 )
 (func $src/ts/assembly/circular-buffer/peekHead (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.eqz
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferHead
  global.get $src/ts/assembly/circular-buffer/bufferMask
  i32.and
 )
 (func $src/ts/assembly/circular-buffer/peekTail (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.eqz
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferMask
  global.get $src/ts/assembly/circular-buffer/bufferTail
  i32.const 1
  i32.sub
  i32.and
 )
 (func $src/ts/assembly/circular-buffer/at (param $0 i32) (result i32)
  local.get $0
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.ge_u
  if
   i32.const -1
   return
  end
  global.get $src/ts/assembly/circular-buffer/bufferMask
  global.get $src/ts/assembly/circular-buffer/bufferHead
  local.get $0
  i32.add
  i32.and
 )
 (func $src/ts/assembly/circular-buffer/drain (result i32)
  (local $0 i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferSize
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferHead
  i32.const 0
  global.set $src/ts/assembly/circular-buffer/bufferTail
 )
 (func $src/ts/assembly/circular-buffer/getStats (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferSize
  global.get $src/ts/assembly/circular-buffer/bufferCapacity
  i32.const 16
  i32.shl
  i32.or
 )
 (func $src/ts/assembly/circular-buffer/logicalToPhysical (param $0 i32) (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferMask
  global.get $src/ts/assembly/circular-buffer/bufferHead
  local.get $0
  i32.add
  i32.and
 )
 (func $src/ts/assembly/circular-buffer/getBufferMask (result i32)
  global.get $src/ts/assembly/circular-buffer/bufferMask
 )
 (func $src/ts/assembly/errors/packResult (param $0 i32) (param $1 i32) (result i64)
  local.get $1
  i64.extend_i32_u
  local.get $0
  i64.extend_i32_u
  i64.const 32
  i64.shl
  i64.or
 )
 (func $src/ts/assembly/errors/isSuccess (param $0 i64) (result i32)
  local.get $0
  i64.const 32
  i64.shr_u
  i64.eqz
 )
 (func $src/ts/assembly/errors/successResult (param $0 i32) (result i64)
  i32.const 0
  local.get $0
  call $src/ts/assembly/errors/packResult
 )
 (func $src/ts/assembly/errors/errorResult (param $0 i32) (result i64)
  local.get $0
  i32.const 0
  call $src/ts/assembly/errors/packResult
 )
 (func $src/ts/assembly/stats/initStats
  call $src/ts/assembly/memory/validateMemory
  i32.eqz
  if
   return
  end
  i32.const 128
  i64.const 0
  i64.atomic.store
  i32.const 136
  i64.const 0
  i64.atomic.store
  i32.const 144
  i64.const 0
  i64.atomic.store
  i32.const 152
  i64.const 0
  i64.atomic.store
  i32.const 160
  i64.const 0
  i64.atomic.store
  i32.const 168
  i64.const 0
  i64.atomic.store
  i32.const 176
  i64.const 0
  i64.atomic.store
  i32.const 184
  i32.const 0
  i32.atomic.store
  i32.const 188
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/stats/recordPush
  i32.const 128
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordPop
  i32.const 136
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordPushFailure
  i32.const 144
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordPopFailure
  i32.const 152
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordCASRetry
  i32.const 160
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordAllocation
  i32.const 168
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/recordFree
  i32.const 176
  i64.const 1
  i64.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/stats/updatePeakSize (param $0 i32)
  (local $1 i32)
  loop $while-continue|0
   i32.const 184
   i32.atomic.load
   local.tee $1
   local.get $0
   i32.lt_u
   if
    local.get $1
    i32.const 184
    local.get $1
    local.get $0
    i32.atomic.rmw.cmpxchg
    i32.ne
    br_if $while-continue|0
   end
  end
 )
 (func $src/ts/assembly/stats/updatePeakAllocated (param $0 i32)
  (local $1 i32)
  loop $while-continue|0
   i32.const 188
   i32.atomic.load
   local.tee $1
   local.get $0
   i32.lt_u
   if
    local.get $1
    i32.const 188
    local.get $1
    local.get $0
    i32.atomic.rmw.cmpxchg
    i32.ne
    br_if $while-continue|0
   end
  end
 )
 (func $src/ts/assembly/stats/getPushCount (result i64)
  i32.const 128
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getPopCount (result i64)
  i32.const 136
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getPushFailures (result i64)
  i32.const 144
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getPopFailures (result i64)
  i32.const 152
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getCASRetries (result i64)
  i32.const 160
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getAllocationCount (result i64)
  i32.const 168
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getFreeCount (result i64)
  i32.const 176
  i64.atomic.load
 )
 (func $src/ts/assembly/stats/getPeakSize (result i32)
  i32.const 184
  i32.atomic.load
 )
 (func $src/ts/assembly/stats/getPeakAllocated (result i32)
  i32.const 188
  i32.atomic.load
 )
 (func $src/ts/assembly/stats/resetStats
  call $src/ts/assembly/stats/initStats
 )
 (func $src/ts/assembly/atomics/tryLock (param $0 i32) (result i32)
  local.get $0
  i32.const 0
  i32.const 1
  i32.atomic.rmw.cmpxchg
  i32.eqz
 )
 (func $src/ts/assembly/atomics/acquireLock@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
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
   i32.const 1000
   local.set $1
  end
  block $__inlined_func$src/ts/assembly/atomics/acquireLock$53 (result i32)
   loop $for-loop|0
    local.get $1
    local.get $2
    i32.gt_u
    if
     i32.const 1
     local.get $0
     i32.const 0
     i32.const 1
     i32.atomic.rmw.cmpxchg
     i32.eqz
     br_if $__inlined_func$src/ts/assembly/atomics/acquireLock$53
     drop
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|0
    end
   end
   i32.const 0
  end
 )
 (func $src/ts/assembly/atomics/releaseLock (param $0 i32)
  local.get $0
  i32.const 0
  i32.atomic.store
 )
 (func $src/ts/assembly/atomics/atomicIncrement (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.atomic.rmw.add
  i32.const 1
  i32.add
 )
 (func $src/ts/assembly/atomics/atomicDecrement (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.atomic.rmw.sub
  i32.const 1
  i32.sub
 )
 (func $src/ts/assembly/atomics/atomicIncrement64 (param $0 i32) (result i64)
  local.get $0
  i64.const 1
  i64.atomic.rmw.add
  i64.const 1
  i64.add
 )
 (func $src/ts/assembly/atomics/atomicDecrement64 (param $0 i32) (result i64)
  local.get $0
  i64.const 1
  i64.atomic.rmw.sub
  i64.const 1
  i64.sub
 )
 (func $src/ts/assembly/atomics/atomicCompareExchange32 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $1
  local.get $2
  i32.atomic.rmw.cmpxchg
  local.get $1
  i32.eq
 )
 (func $src/ts/assembly/atomics/atomicCompareExchange64 (param $0 i32) (param $1 i64) (param $2 i64) (result i32)
  local.get $0
  local.get $1
  local.get $2
  i64.atomic.rmw.cmpxchg
  local.get $1
  i64.eq
 )
 (func $src/ts/assembly/atomics/atomicLoad32 (param $0 i32) (result i32)
  local.get $0
  i32.atomic.load
 )
 (func $src/ts/assembly/atomics/atomicLoad64 (param $0 i32) (result i64)
  local.get $0
  i64.atomic.load
 )
 (func $src/ts/assembly/atomics/atomicStore32 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.atomic.store
 )
 (func $src/ts/assembly/atomics/atomicStore64 (param $0 i32) (param $1 i64)
  local.get $0
  local.get $1
  i64.atomic.store
 )
 (func $src/ts/assembly/atomics/atomicMax32 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  loop $while-continue|0
   local.get $0
   i32.atomic.load
   local.tee $2
   local.get $1
   i32.ge_u
   if
    local.get $2
    return
   end
   local.get $2
   local.get $0
   local.get $2
   local.get $1
   i32.atomic.rmw.cmpxchg
   i32.ne
   br_if $while-continue|0
  end
  local.get $2
 )
 (func $src/ts/assembly/atomics/atomicMin32 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  loop $while-continue|0
   local.get $0
   i32.atomic.load
   local.tee $2
   local.get $1
   i32.le_u
   if
    local.get $2
    return
   end
   local.get $2
   local.get $0
   local.get $2
   local.get $1
   i32.atomic.rmw.cmpxchg
   i32.ne
   br_if $while-continue|0
  end
  local.get $2
 )
 (func $src/ts/assembly/atomics/memoryFence
 )
 (func $src/ts/assembly/atomics/seqlockWriteEnd (param $0 i32)
  local.get $0
  i32.const 1
  i32.atomic.rmw.add
  drop
 )
 (func $src/ts/assembly/atomics/seqlockReadBegin (param $0 i32) (result i32)
  (local $1 i32)
  loop $while-continue|0
   local.get $0
   i32.atomic.load
   local.tee $1
   i32.const 1
   i32.and
   br_if $while-continue|0
  end
  local.get $1
 )
 (func $src/ts/assembly/atomics/seqlockReadValidate (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.atomic.load
  local.get $1
  i32.eq
 )
 (func $src/ts/assembly/histogram/setBucketBoundary (param $0 i32) (param $1 f64)
  i32.const 256
  i32.atomic.load
  local.get $0
  i32.gt_u
  if
   local.get $0
   i32.const 3
   i32.shl
   local.get $1
   f64.store offset=584
  end
 )
 (func $src/ts/assembly/histogram/getBucketBoundary (param $0 i32) (result f64)
  i32.const 256
  i32.atomic.load
  local.get $0
  i32.gt_u
  if
   local.get $0
   i32.const 3
   i32.shl
   f64.load offset=584
   return
  end
  f64.const -1
 )
 (func $src/ts/assembly/histogram/recordValue (param $0 f64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 f64)
  (local $5 i64)
  i32.const 296
  i32.atomic.load
  i32.const 1
  i32.ne
  if
   return
  end
  i32.const 256
  i32.atomic.load
  local.set $2
  block $__inlined_func$src/ts/assembly/histogram/findBucket$55
   loop $for-loop|0
    local.get $1
    local.get $2
    i32.lt_u
    if
     local.get $1
     i32.const 3
     i32.shl
     f64.load offset=584
     local.get $0
     f64.ge
     br_if $__inlined_func$src/ts/assembly/histogram/findBucket$55
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|0
    end
   end
   local.get $2
   local.set $1
  end
  local.get $1
  i32.const 3
  i32.shl
  i32.const 320
  i32.add
  i64.const 1
  i64.atomic.rmw.add
  drop
  i32.const 260
  i64.const 1
  i64.atomic.rmw.add
  drop
  i32.const 272
  i32.const 272
  f64.load
  local.get $0
  f64.add
  f64.store
  local.get $0
  i64.reinterpret_f64
  local.set $5
  loop $while-continue|0
   i32.const 280
   f64.load
   local.tee $4
   local.get $0
   f64.le
   i32.eqz
   if
    i32.const 280
    local.get $4
    i64.reinterpret_f64
    local.tee $3
    local.get $5
    i64.atomic.rmw.cmpxchg
    local.get $3
    i64.ne
    br_if $while-continue|0
   end
  end
  local.get $0
  i64.reinterpret_f64
  local.set $5
  loop $while-continue|01
   i32.const 288
   f64.load
   local.tee $4
   local.get $0
   f64.ge
   i32.eqz
   if
    i32.const 288
    local.get $4
    i64.reinterpret_f64
    local.tee $3
    local.get $5
    i64.atomic.rmw.cmpxchg
    local.get $3
    i64.ne
    br_if $while-continue|01
   end
  end
 )
 (func $src/ts/assembly/histogram/getBucketCount (param $0 i32) (result i64)
  i32.const 256
  i32.atomic.load
  local.get $0
  i32.ge_u
  if
   local.get $0
   i32.const 3
   i32.shl
   i64.atomic.load offset=320
   return
  end
  i64.const 0
 )
 (func $src/ts/assembly/histogram/getTotalCount (result i64)
  i32.const 260
  i64.atomic.load
 )
 (func $src/ts/assembly/histogram/getSum (result f64)
  i32.const 272
  f64.load
 )
 (func $src/ts/assembly/histogram/getMin (result f64)
  (local $0 f64)
  i32.const 280
  f64.load
  local.tee $0
  f64.const 1797693134862315708145274e284
  f64.eq
  if
   f64.const 0
   return
  end
  local.get $0
 )
 (func $src/ts/assembly/histogram/getMax (result f64)
  (local $0 f64)
  i32.const 288
  f64.load
  local.tee $0
  f64.const 5e-324
  f64.eq
  if
   f64.const 0
   return
  end
  local.get $0
 )
 (func $src/ts/assembly/histogram/getAverage (result f64)
  (local $0 i64)
  i32.const 260
  i64.atomic.load
  local.tee $0
  i64.eqz
  if
   f64.const 0
   return
  end
  i32.const 272
  f64.load
  local.get $0
  f64.convert_i64_u
  f64.div
 )
 (func $src/ts/assembly/histogram/getHistogramBucketCount (result i32)
  i32.const 256
  i32.atomic.load
 )
 (func $src/ts/assembly/histogram/calculatePercentile (param $0 f64) (result f64)
  (local $1 i64)
  (local $2 i64)
  (local $3 f64)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  f64.const 0
  f64.lt
  local.get $0
  f64.const 100
  f64.gt
  i32.or
  if
   f64.const 0
   return
  end
  i32.const 260
  i64.atomic.load
  local.tee $1
  i64.eqz
  if
   f64.const 0
   return
  end
  i32.const 256
  i32.atomic.load
  local.set $7
  local.get $1
  f64.convert_i64_u
  local.get $0
  f64.mul
  f64.const 100
  f64.div
  i64.trunc_sat_f64_u
  local.set $5
  f64.const 0
  local.set $0
  loop $for-loop|0
   local.get $7
   local.get $8
   i32.ge_u
   if
    local.get $2
    local.get $8
    i32.const 3
    i32.shl
    local.tee $4
    i64.atomic.load offset=320
    local.tee $6
    i64.add
    local.set $1
    local.get $6
    i64.const 0
    i64.ne
    local.get $1
    local.get $5
    i64.ge_u
    i32.and
    if
     local.get $7
     local.get $8
     i32.gt_u
     if (result f64)
      local.get $4
      f64.load offset=584
     else
      local.get $0
      local.get $0
      f64.add
      i32.const 288
      f64.load
      local.tee $3
      local.get $3
      f64.const 5e-324
      f64.eq
      select
     end
     local.set $3
     local.get $6
     i64.const 0
     i64.ne
     if
      local.get $0
      local.get $3
      local.get $0
      f64.sub
      local.get $5
      local.get $2
      i64.sub
      f64.convert_i64_u
      local.get $6
      f64.convert_i64_u
      f64.div
      f64.mul
      f64.add
      return
     end
     local.get $3
     return
    end
    local.get $1
    local.set $2
    local.get $7
    local.get $8
    i32.gt_u
    if
     local.get $8
     i32.const 3
     i32.shl
     f64.load offset=584
     local.set $0
    end
    local.get $8
    i32.const 1
    i32.add
    local.set $8
    br $for-loop|0
   end
  end
  call $src/ts/assembly/histogram/getMax
 )
 (func $src/ts/assembly/histogram/getP50 (result f64)
  f64.const 50
  call $src/ts/assembly/histogram/calculatePercentile
 )
 (func $src/ts/assembly/histogram/getP90 (result f64)
  f64.const 90
  call $src/ts/assembly/histogram/calculatePercentile
 )
 (func $src/ts/assembly/histogram/getP95 (result f64)
  f64.const 95
  call $src/ts/assembly/histogram/calculatePercentile
 )
 (func $src/ts/assembly/histogram/getP99 (result f64)
  f64.const 99
  call $src/ts/assembly/histogram/calculatePercentile
 )
 (func $src/ts/assembly/histogram/resetHistogram
  (local $0 i32)
  (local $1 i32)
  i32.const 296
  i32.atomic.load
  i32.const 1
  i32.ne
  if
   return
  end
  i32.const 256
  i32.atomic.load
  local.set $1
  i32.const 260
  i64.const 0
  i64.atomic.store
  i32.const 272
  f64.const 0
  f64.store
  i32.const 280
  f64.const 1797693134862315708145274e284
  f64.store
  i32.const 288
  f64.const 5e-324
  f64.store
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.le_u
   if
    local.get $0
    i32.const 3
    i32.shl
    i64.const 0
    i64.atomic.store offset=320
    local.get $0
    i32.const 1
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
 )
 (func $src/ts/assembly/histogram/isHistogramInitialized (result i32)
  i32.const 296
  i32.atomic.load
  i32.const 1
  i32.eq
 )
 (func $src/ts/assembly/histogram/recordValuesBatch (param $0 i32) (param $1 i32)
  (local $2 i32)
  i32.const 296
  i32.atomic.load
  i32.const 1
  i32.ne
  if
   return
  end
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.gt_s
   if
    local.get $0
    local.get $2
    i32.const 3
    i32.shl
    i32.add
    f64.load
    call $src/ts/assembly/histogram/recordValue
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapMultiplyF32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 f32)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $3
  f32x4.splat
  local.set $4
  local.get $2
  i32.const 4
  i32.div_s
  local.set $6
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $6
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    v128.load
    local.get $4
    f32x4.mul
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 2
  i32.shl
  local.set $6
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $6
    i32.add
    i32.const 2
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    f32.load
    local.get $3
    f32.mul
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapAddF32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 f32)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $3
  f32x4.splat
  local.set $4
  local.get $2
  i32.const 4
  i32.div_s
  local.set $6
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $6
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    v128.load
    local.get $4
    f32x4.add
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 2
  i32.shl
  local.set $6
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $6
    i32.add
    i32.const 2
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    f32.load
    local.get $3
    f32.add
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapSquareF32 (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 v128)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  i32.const 4
  i32.div_s
  local.set $6
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $6
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $7
    local.get $0
    i32.add
    v128.load
    local.set $3
    local.get $1
    local.get $7
    i32.add
    local.get $3
    local.get $3
    f32x4.mul
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 2
  i32.shl
  local.set $6
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $6
    i32.add
    i32.const 2
    i32.shl
    local.tee $7
    local.get $0
    i32.add
    f32.load
    local.set $4
    local.get $1
    local.get $7
    i32.add
    local.get $4
    local.get $4
    f32.mul
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapSqrtF32 (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 4
  i32.div_s
  local.set $4
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $3
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $4
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $5
    local.get $1
    i32.add
    local.get $0
    local.get $5
    i32.add
    v128.load
    f32x4.sqrt
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
  i32.const 2
  i32.shl
  local.set $4
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $3
   i32.lt_s
   if
    local.get $2
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    local.tee $5
    local.get $1
    i32.add
    local.get $0
    local.get $5
    i32.add
    f32.load
    f32.sqrt
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdReduceSumF32 (param $0 i32) (param $1 i32) (result f32)
  (local $2 v128)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 4
  i32.div_s
  local.set $5
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $4
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    f32x4.add
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
  f32x4.extract_lane 0
  local.get $2
  f32x4.extract_lane 1
  f32.add
  local.get $2
  f32x4.extract_lane 2
  f32.add
  local.get $2
  f32x4.extract_lane 3
  f32.add
  local.set $3
  local.get $5
  i32.const 2
  i32.shl
  local.set $5
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $4
   i32.lt_s
   if
    local.get $3
    local.get $0
    local.get $1
    local.get $5
    i32.add
    i32.const 2
    i32.shl
    i32.add
    f32.load
    f32.add
    local.set $3
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $3
 )
 (func $src/ts/assembly/simd-batch/simdReduceMinF32 (param $0 i32) (param $1 i32) (result f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 v128)
  local.get $1
  i32.eqz
  if
   f32.const 3402823466385288598117041e14
   return
  end
  local.get $1
  i32.const 4
  i32.div_s
  local.set $4
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $5
  v128.const i32x4 0x7f7fffff 0x7f7fffff 0x7f7fffff 0x7f7fffff
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $4
   i32.lt_s
   if
    local.get $6
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    f32x4.min
    local.set $6
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $6
  f32x4.extract_lane 0
  local.get $6
  f32x4.extract_lane 1
  f32.min
  local.get $6
  f32x4.extract_lane 2
  local.get $6
  f32x4.extract_lane 3
  f32.min
  f32.min
  local.set $3
  local.get $4
  i32.const 2
  i32.shl
  local.set $4
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $0
    local.get $1
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.tee $2
    local.get $3
    f32.lt
    if
     local.get $2
     local.set $3
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $3
 )
 (func $src/ts/assembly/simd-batch/simdReduceMaxF32 (param $0 i32) (param $1 i32) (result f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 v128)
  local.get $1
  i32.eqz
  if
   f32.const 1.401298464324817e-45
   return
  end
  local.get $1
  i32.const 4
  i32.div_s
  local.set $4
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $5
  v128.const i32x4 0x00000001 0x00000001 0x00000001 0x00000001
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $4
   i32.lt_s
   if
    local.get $6
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    f32x4.max
    local.set $6
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $6
  f32x4.extract_lane 0
  local.get $6
  f32x4.extract_lane 1
  f32.max
  local.get $6
  f32x4.extract_lane 2
  local.get $6
  f32x4.extract_lane 3
  f32.max
  f32.max
  local.set $3
  local.get $4
  i32.const 2
  i32.shl
  local.set $4
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $0
    local.get $1
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.tee $2
    local.get $3
    f32.gt
    if
     local.get $2
     local.set $3
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $3
 )
 (func $src/ts/assembly/simd-batch/simdDotProductF32 (param $0 i32) (param $1 i32) (param $2 i32) (result f32)
  (local $3 v128)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  i32.const 4
  i32.div_s
  local.set $6
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $6
   i32.lt_s
   if
    local.get $3
    local.get $2
    i32.const 4
    i32.shl
    local.tee $7
    local.get $0
    i32.add
    v128.load
    local.get $1
    local.get $7
    i32.add
    v128.load
    f32x4.mul
    f32x4.add
    local.set $3
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $3
  f32x4.extract_lane 0
  local.get $3
  f32x4.extract_lane 1
  f32.add
  local.get $3
  f32x4.extract_lane 2
  f32.add
  local.get $3
  f32x4.extract_lane 3
  f32.add
  local.set $4
  local.get $6
  i32.const 2
  i32.shl
  local.set $6
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $4
    local.get $2
    local.get $6
    i32.add
    i32.const 2
    i32.shl
    local.tee $7
    local.get $0
    i32.add
    f32.load
    local.get $1
    local.get $7
    i32.add
    f32.load
    f32.mul
    f32.add
    local.set $4
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $4
 )
 (func $src/ts/assembly/simd-batch/simdAddArraysF32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $3
  i32.const 4
  i32.div_s
  local.set $5
  local.get $3
  i32.const 4
  i32.rem_s
  local.set $4
  i32.const 0
  local.set $3
  loop $for-loop|0
   local.get $3
   local.get $5
   i32.lt_s
   if
    local.get $3
    i32.const 4
    i32.shl
    local.tee $6
    local.get $2
    i32.add
    local.get $0
    local.get $6
    i32.add
    v128.load
    local.get $1
    local.get $6
    i32.add
    v128.load
    f32x4.add
    v128.store
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $5
  i32.const 2
  i32.shl
  local.set $5
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $4
   i32.lt_s
   if
    local.get $3
    local.get $5
    i32.add
    i32.const 2
    i32.shl
    local.tee $6
    local.get $2
    i32.add
    local.get $0
    local.get $6
    i32.add
    f32.load
    local.get $1
    local.get $6
    i32.add
    f32.load
    f32.add
    f32.store
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMultiplyArraysF32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $3
  i32.const 4
  i32.div_s
  local.set $5
  local.get $3
  i32.const 4
  i32.rem_s
  local.set $4
  i32.const 0
  local.set $3
  loop $for-loop|0
   local.get $3
   local.get $5
   i32.lt_s
   if
    local.get $3
    i32.const 4
    i32.shl
    local.tee $6
    local.get $2
    i32.add
    local.get $0
    local.get $6
    i32.add
    v128.load
    local.get $1
    local.get $6
    i32.add
    v128.load
    f32x4.mul
    v128.store
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $5
  i32.const 2
  i32.shl
  local.set $5
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $4
   i32.lt_s
   if
    local.get $3
    local.get $5
    i32.add
    i32.const 2
    i32.shl
    local.tee $6
    local.get $2
    i32.add
    local.get $0
    local.get $6
    i32.add
    f32.load
    local.get $1
    local.get $6
    i32.add
    f32.load
    f32.mul
    f32.store
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapAbsF32 (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 4
  i32.div_s
  local.set $4
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $3
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $4
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $5
    local.get $1
    i32.add
    local.get $0
    local.get $5
    i32.add
    v128.load
    f32x4.abs
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
  i32.const 2
  i32.shl
  local.set $4
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $3
   i32.lt_s
   if
    local.get $2
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    local.tee $5
    local.get $1
    i32.add
    local.get $0
    local.get $5
    i32.add
    f32.load
    f32.abs
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapNegateF32 (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 4
  i32.div_s
  local.set $4
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $3
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $4
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $5
    local.get $1
    i32.add
    local.get $0
    local.get $5
    i32.add
    v128.load
    f32x4.neg
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
  i32.const 2
  i32.shl
  local.set $4
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $3
   i32.lt_s
   if
    local.get $2
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    local.tee $5
    local.get $1
    i32.add
    local.get $0
    local.get $5
    i32.add
    f32.load
    f32.neg
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapClampF32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 f32) (param $4 f32)
  (local $5 f32)
  (local $6 v128)
  (local $7 v128)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  local.get $3
  f32x4.splat
  local.set $6
  local.get $4
  f32x4.splat
  local.set $7
  local.get $2
  i32.const 4
  i32.div_s
  local.set $9
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $8
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $9
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $10
    local.get $1
    i32.add
    local.get $0
    local.get $10
    i32.add
    v128.load
    local.get $6
    f32x4.max
    local.get $7
    f32x4.min
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $9
  i32.const 2
  i32.shl
  local.set $9
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $8
   i32.lt_s
   if
    local.get $0
    local.get $2
    local.get $9
    i32.add
    local.tee $10
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.tee $5
    local.get $3
    f32.lt
    if
     local.get $3
     local.set $5
    end
    local.get $4
    local.get $5
    f32.lt
    if
     local.get $4
     local.set $5
    end
    local.get $1
    local.get $10
    i32.const 2
    i32.shl
    i32.add
    local.get $5
    f32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdMapMultiplyF64 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 f64)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $3
  f64x2.splat
  local.set $4
  local.get $2
  i32.const 2
  i32.div_s
  local.set $6
  local.get $2
  i32.const 2
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $6
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    v128.load
    local.get $4
    f64x2.mul
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 1
  i32.shl
  local.set $6
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $6
    i32.add
    i32.const 3
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    f64.load
    local.get $3
    f64.mul
    f64.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdReduceSumF64 (param $0 i32) (param $1 i32) (result f64)
  (local $2 v128)
  (local $3 f64)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 2
  i32.div_s
  local.set $5
  local.get $1
  i32.const 2
  i32.rem_s
  local.set $4
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    f64x2.add
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
  f64x2.extract_lane 0
  local.get $2
  f64x2.extract_lane 1
  f64.add
  local.set $3
  local.get $5
  i32.const 1
  i32.shl
  local.set $5
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $4
   i32.lt_s
   if
    local.get $3
    local.get $0
    local.get $1
    local.get $5
    i32.add
    i32.const 3
    i32.shl
    i32.add
    f64.load
    f64.add
    local.set $3
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $3
 )
 (func $src/ts/assembly/simd-batch/simdMapMultiplyI32 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $3
  i32x4.splat
  local.set $4
  local.get $2
  i32.const 4
  i32.div_s
  local.set $6
  local.get $2
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $6
   i32.lt_s
   if
    local.get $2
    i32.const 4
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    v128.load
    local.get $4
    i32x4.mul
    v128.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 2
  i32.shl
  local.set $6
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $6
    i32.add
    i32.const 2
    i32.shl
    local.tee $7
    local.get $1
    i32.add
    local.get $0
    local.get $7
    i32.add
    i32.load
    local.get $3
    i32.mul
    i32.store
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
 )
 (func $src/ts/assembly/simd-batch/simdReduceSumI32 (param $0 i32) (param $1 i32) (result i32)
  (local $2 v128)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.const 4
  i32.div_s
  local.set $5
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $4
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $2
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    i32x4.add
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
  i32x4.extract_lane 0
  local.get $2
  i32x4.extract_lane 1
  i32.add
  local.get $2
  i32x4.extract_lane 2
  i32.add
  local.get $2
  i32x4.extract_lane 3
  i32.add
  local.set $3
  local.get $5
  i32.const 2
  i32.shl
  local.set $5
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $4
   i32.lt_s
   if
    local.get $3
    local.get $0
    local.get $1
    local.get $5
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.add
    local.set $3
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $3
 )
 (func $~lib/rt/stub/__alloc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1184
   i32.const 1248
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.tee $2
  local.get $0
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $0
  i32.add
  local.tee $3
  memory.size
  local.tee $4
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $5
  i32.gt_u
  if
   local.get $4
   local.get $3
   local.get $5
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $5
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $3
  global.set $~lib/rt/stub/offset
  local.get $0
  i32.store
  local.get $2
 )
 (func $src/ts/assembly/simd-batch/allocateAligned (param $0 i32) (result i32)
  local.get $0
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  call $~lib/rt/stub/__alloc
 )
 (func $src/ts/assembly/simd-batch/freeAligned (param $0 i32)
  global.get $~lib/rt/stub/offset
  local.get $0
  local.get $0
  i32.const 4
  i32.sub
  local.tee $0
  i32.load
  i32.add
  i32.eq
  if
   local.get $0
   global.set $~lib/rt/stub/offset
  end
 )
 (func $src/ts/assembly/simd-batch/copyToWasm (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  local.get $2
  memory.copy
 )
 (func $src/ts/assembly/simd-batch/simdCountI32 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 v128)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  i32x4.splat
  local.set $5
  local.get $1
  i32.const 4
  i32.div_s
  local.set $7
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $3
   local.get $7
   i32.lt_s
   if
    local.get $1
    local.get $3
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    local.get $5
    i32x4.eq
    local.tee $4
    i32x4.extract_lane 0
    i32.sub
    local.get $4
    i32x4.extract_lane 1
    i32.sub
    local.get $4
    i32x4.extract_lane 2
    i32.sub
    local.get $4
    i32x4.extract_lane 3
    i32.sub
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $7
  i32.const 2
  i32.shl
  local.set $7
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $6
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.add
    local.get $1
    local.get $0
    local.get $3
    local.get $7
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $2
    i32.eq
    select
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $1
 )
 (func $src/ts/assembly/simd-batch/simdCountF32 (param $0 i32) (param $1 i32) (param $2 f32) (result i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 v128)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  f32x4.splat
  local.set $5
  local.get $1
  i32.const 4
  i32.div_s
  local.set $7
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $3
   local.get $7
   i32.lt_s
   if
    local.get $1
    local.get $3
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    local.get $5
    f32x4.eq
    local.tee $4
    i32x4.extract_lane 0
    i32.sub
    local.get $4
    i32x4.extract_lane 1
    i32.sub
    local.get $4
    i32x4.extract_lane 2
    i32.sub
    local.get $4
    i32x4.extract_lane 3
    i32.sub
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $7
  i32.const 2
  i32.shl
  local.set $7
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $6
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.add
    local.get $1
    local.get $0
    local.get $3
    local.get $7
    i32.add
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.get $2
    f32.eq
    select
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $1
 )
 (func $src/ts/assembly/simd-batch/simdIndexOfI32 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 v128)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  i32x4.splat
  local.set $4
  local.get $1
  i32.const 4
  i32.div_s
  local.set $6
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $6
   i32.lt_s
   if
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    local.get $4
    i32x4.eq
    local.tee $3
    i32x4.extract_lane 0
    if
     local.get $1
     i32.const 2
     i32.shl
     return
    end
    local.get $3
    i32x4.extract_lane 1
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 1
     i32.add
     return
    end
    local.get $3
    i32x4.extract_lane 2
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 2
     i32.add
     return
    end
    local.get $3
    i32x4.extract_lane 3
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 3
     i32.add
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 2
  i32.shl
  local.set $7
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $0
    local.get $1
    local.get $7
    i32.add
    local.tee $6
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.get $2
    i32.eq
    if
     local.get $6
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  i32.const -1
 )
 (func $src/ts/assembly/simd-batch/simdIndexOfF32 (param $0 i32) (param $1 i32) (param $2 f32) (result i32)
  (local $3 v128)
  (local $4 v128)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  f32x4.splat
  local.set $4
  local.get $1
  i32.const 4
  i32.div_s
  local.set $6
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $5
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   local.get $6
   i32.lt_s
   if
    local.get $1
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    local.get $4
    f32x4.eq
    local.tee $3
    i32x4.extract_lane 0
    if
     local.get $1
     i32.const 2
     i32.shl
     return
    end
    local.get $3
    i32x4.extract_lane 1
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 1
     i32.add
     return
    end
    local.get $3
    i32x4.extract_lane 2
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 2
     i32.add
     return
    end
    local.get $3
    i32x4.extract_lane 3
    if
     local.get $1
     i32.const 2
     i32.shl
     i32.const 3
     i32.add
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $6
  i32.const 2
  i32.shl
  local.set $7
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   local.get $5
   i32.lt_s
   if
    local.get $0
    local.get $1
    local.get $7
    i32.add
    local.tee $6
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.get $2
    f32.eq
    if
     local.get $6
     return
    end
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  i32.const -1
 )
 (func $src/ts/assembly/simd-batch/simdIncludesI32 (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  local.get $1
  local.get $2
  call $src/ts/assembly/simd-batch/simdIndexOfI32
  i32.const 0
  i32.ge_s
 )
 (func $src/ts/assembly/simd-batch/simdIncludesF32 (param $0 i32) (param $1 i32) (param $2 f32) (result i32)
  local.get $0
  local.get $1
  local.get $2
  call $src/ts/assembly/simd-batch/simdIndexOfF32
  i32.const 0
  i32.ge_s
 )
 (func $src/ts/assembly/simd-batch/simdCountGreaterThanF32 (param $0 i32) (param $1 i32) (param $2 f32) (result i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 v128)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  f32x4.splat
  local.set $5
  local.get $1
  i32.const 4
  i32.div_s
  local.set $7
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $3
   local.get $7
   i32.lt_s
   if
    local.get $1
    local.get $3
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    local.get $5
    f32x4.gt
    local.tee $4
    i32x4.extract_lane 0
    i32.sub
    local.get $4
    i32x4.extract_lane 1
    i32.sub
    local.get $4
    i32x4.extract_lane 2
    i32.sub
    local.get $4
    i32x4.extract_lane 3
    i32.sub
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $7
  i32.const 2
  i32.shl
  local.set $7
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $6
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.add
    local.get $1
    local.get $0
    local.get $3
    local.get $7
    i32.add
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.get $2
    f32.gt
    select
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $1
 )
 (func $src/ts/assembly/simd-batch/simdCountLessThanF32 (param $0 i32) (param $1 i32) (param $2 f32) (result i32)
  (local $3 i32)
  (local $4 v128)
  (local $5 v128)
  (local $6 i32)
  (local $7 i32)
  local.get $2
  f32x4.splat
  local.set $5
  local.get $1
  i32.const 4
  i32.div_s
  local.set $7
  local.get $1
  i32.const 4
  i32.rem_s
  local.set $6
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $3
   local.get $7
   i32.lt_s
   if
    local.get $1
    local.get $3
    i32.const 4
    i32.shl
    local.get $0
    i32.add
    v128.load
    local.get $5
    f32x4.lt
    local.tee $4
    i32x4.extract_lane 0
    i32.sub
    local.get $4
    i32x4.extract_lane 1
    i32.sub
    local.get $4
    i32x4.extract_lane 2
    i32.sub
    local.get $4
    i32x4.extract_lane 3
    i32.sub
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $7
  i32.const 2
  i32.shl
  local.set $7
  i32.const 0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $6
   i32.lt_s
   if
    local.get $1
    i32.const 1
    i32.add
    local.get $1
    local.get $0
    local.get $3
    local.get $7
    i32.add
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.get $2
    f32.lt
    select
    local.set $1
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $1
 )
 (func $src/ts/assembly/simd-batch/simdPartitionF32 (param $0 i32) (param $1 i32) (param $2 f32) (param $3 i32) (param $4 i32) (result i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 i32)
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.gt_s
   if
    local.get $0
    local.get $5
    i32.const 2
    i32.shl
    i32.add
    f32.load
    local.tee $7
    local.get $2
    f32.lt
    if
     local.get $3
     local.get $6
     i32.const 2
     i32.shl
     i32.add
     local.get $7
     f32.store
     local.get $6
     i32.const 1
     i32.add
     local.set $6
    else
     local.get $4
     local.get $8
     i32.const 2
     i32.shl
     i32.add
     local.get $7
     f32.store
     local.get $8
     i32.const 1
     i32.add
     local.set $8
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $6
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1184
   i32.const 1248
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/stub/__alloc
  local.tee $3
  i32.const 4
  i32.sub
  local.tee $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/rt/stub/__pin (param $0 i32) (result i32)
  local.get $0
 )
 (func $~lib/rt/stub/__unpin (param $0 i32)
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
  i32.const 34092
  global.set $~lib/rt/stub/offset
 )
 (func $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 1320
  i32.lt_s
  if
   i32.const 34112
   i32.const 34160
   i32.const 1
   i32.const 1
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $src/ts/assembly/histogram/initHistogramWithBuckets (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.sub
  global.set $~lib/memory/__stack_pointer
  call $~stack_check
  global.get $~lib/memory/__stack_pointer
  i32.const 0
  i32.store
  block $folding-inner0
   local.get $0
   i32.const 0
   i32.le_s
   local.get $0
   i32.const 32
   i32.gt_s
   i32.or
   br_if $folding-inner0
   i32.const 296
   i32.atomic.load
   i32.const 1
   i32.eq
   br_if $folding-inner0
   i32.const 256
   local.get $0
   i32.atomic.store
   i32.const 260
   i64.const 0
   i64.atomic.store
   i32.const 272
   f64.const 0
   f64.store
   i32.const 280
   f64.const 1797693134862315708145274e284
   f64.store
   i32.const 288
   f64.const 5e-324
   f64.store
   loop $for-loop|0
    local.get $0
    local.get $1
    i32.ge_u
    if
     local.get $1
     i32.const 3
     i32.shl
     i64.const 0
     i64.atomic.store offset=320
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|0
    end
   end
   global.get $~lib/memory/__stack_pointer
   i32.const 1056
   i32.store
   local.get $0
   i32.const 1052
   i32.load
   i32.const 3
   i32.shr_u
   local.tee $1
   local.get $0
   local.get $1
   i32.lt_s
   select
   local.set $1
   loop $for-loop|1
    local.get $1
    local.get $2
    i32.gt_s
    if
     global.get $~lib/memory/__stack_pointer
     i32.const 1056
     i32.store
     local.get $2
     i32.const 3
     i32.shl
     local.tee $3
     local.get $3
     i32.const 1056
     i32.add
     f64.load
     f64.store offset=584
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|1
    end
   end
   loop $for-loop|2
    local.get $0
    local.get $1
    i32.gt_s
    if
     local.get $1
     i32.const 3
     i32.shl
     f64.const 1797693134862315708145274e284
     f64.store offset=584
     local.get $1
     i32.const 1
     i32.add
     local.set $1
     br $for-loop|2
    end
   end
   i32.const 296
   i32.const 1
   i32.atomic.store
   global.get $~lib/memory/__stack_pointer
   i32.const 4
   i32.add
   global.set $~lib/memory/__stack_pointer
   i32.const 1
   return
  end
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
  i32.const 0
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
  global.get $~lib/memory/__stack_pointer
  i32.const 1056
  i32.store
  i32.const 1052
  i32.load
  i32.const 3
  i32.shr_u
  call $src/ts/assembly/histogram/initHistogramWithBuckets
  global.get $~lib/memory/__stack_pointer
  i32.const 4
  i32.add
  global.set $~lib/memory/__stack_pointer
 )
)
