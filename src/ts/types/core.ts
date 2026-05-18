/**
 * Core Type Definitions
 *
 * This file contains the fundamental types that are shared across
 * multiple type definition files to avoid circular dependencies.
 */

/**
 * Options for task execution
 * @template T - Task metadata type
 */
export interface ExecOptions<T = unknown> {
  /**
   * Event listener for worker-emitted events during execution
   */
  on?: (payload: unknown) => void;

  /**
   * Transferable objects to send to worker (zero-copy transfer).
   * Not supported by 'process' worker type.
   */
  transfer?: Transferable[];

  /**
   * Custom metadata attached to the task.
   * Useful for custom queue implementations (e.g., priority).
   */
  metadata?: T;

  /**
   * AbortSignal for cooperative cancellation. When supplied:
   *   - if the signal is already aborted, `pool.exec(...)` returns a
   *     pre-rejected promise (`CancellationError`) without ever
   *     entering the queue;
   *   - otherwise the pool subscribes to the signal's `abort` event
   *     and calls `.cancel()` on the returned promise when it fires.
   *
   * The pool removes its listener when the promise settles so the
   * same signal can be reused for many submissions without piling up
   * listeners. This is the standard Node ecosystem cancellation
   * pattern, compatible with `fetch`, `child_process`, `fs`, etc.
   */
  signal?: AbortSignal;
}

/**
 * Workerpool Promise interface with cancel and timeout support
 * @template T - Resolved value type
 * @template E - Error type
 */
export interface WorkerpoolPromise<T, E = unknown> extends Promise<T> {
  /** Whether the promise has been resolved */
  readonly resolved: boolean;
  /** Whether the promise has been rejected */
  readonly rejected: boolean;
  /** Whether the promise is still pending */
  readonly pending: boolean;

  /**
   * Cancel the promise, rejecting with CancellationError
   */
  cancel(): this;

  /**
   * Set a timeout for the promise.
   * Rejects with TimeoutError if not resolved within delay.
   * @param delay - Timeout in milliseconds
   */
  timeout(delay: number): this;

  /**
   * Execute callback when promise resolves or rejects
   * @deprecated Use finally() instead
   */
  always<TResult>(fn: () => TResult | PromiseLike<TResult>): WorkerpoolPromise<TResult, unknown>;
}
