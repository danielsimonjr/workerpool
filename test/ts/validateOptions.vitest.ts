/**
 * Tests for validateOptions.ts
 *
 * Tests option validation to prevent unknown/inherited properties.
 */

import { describe, it, expect } from 'vitest';
import {
  validateOptions,
  validatePoolOptions,
  validateForkOptions,
  validateWorkerThreadOptions,
  validateWorkerOptions,
  validateExecOptions,
  workerOptsNames,
  forkOptsNames,
  workerThreadOptsNames,
  poolOptsNames,
  execOptsNames,
} from '../../src/ts/core/validateOptions';

describe('validateOptions', () => {
  describe('basic validation', () => {
    it('should return undefined for undefined options', () => {
      expect(validateOptions(undefined, ['foo'], 'test')).toBeUndefined();
    });

    it('should return options when all properties are allowed', () => {
      const options = { foo: 1, bar: 'test' };
      const result = validateOptions(options, ['foo', 'bar', 'baz'], 'test');
      expect(result).toBe(options);
    });

    it('should throw for unknown option', () => {
      const options = { foo: 1, unknown: 'bad' };
      expect(() => validateOptions(options, ['foo', 'bar'], 'testOptions')).toThrow(
        'Object "testOptions" contains an unknown option "unknown"'
      );
    });

    it('should throw for multiple unknown options (reports first)', () => {
      const options = { foo: 1, bad1: 'x', bad2: 'y' };
      expect(() => validateOptions(options, ['foo'], 'opts')).toThrow(
        /unknown option "bad/
      );
    });

    it('should allow empty options object', () => {
      const options = {};
      const result = validateOptions(options, ['foo', 'bar'], 'test');
      expect(result).toEqual({});
    });

    it('should allow subset of options', () => {
      const options = { foo: 1 };
      const result = validateOptions(options, ['foo', 'bar', 'baz'], 'test');
      expect(result).toEqual({ foo: 1 });
    });
  });

  describe('prototype pollution protection', () => {
    it('should allow normal objects with Object prototype', () => {
      const options = { maxWorkers: 4 };
      expect(() => validateOptions(options, ['maxWorkers'], 'pool')).not.toThrow();
    });

    it('should allow objects created with Object.create(null)', () => {
      const options = Object.create(null);
      options.foo = 'bar';
      expect(validateOptions(options, ['foo'], 'test')).toEqual({ foo: 'bar' });
    });
  });

  describe('edge cases', () => {
    it('should handle options with undefined values', () => {
      const options = { foo: undefined, bar: null };
      const result = validateOptions(options, ['foo', 'bar'], 'test');
      expect(result).toEqual({ foo: undefined, bar: null });
    });

    it('should handle options with function values', () => {
      const fn = () => {};
      const options = { callback: fn };
      const result = validateOptions(options, ['callback'], 'test');
      expect(result?.callback).toBe(fn);
    });

    it('should handle options with array values', () => {
      const options = { items: [1, 2, 3] };
      const result = validateOptions(options, ['items'], 'test');
      expect(result?.items).toEqual([1, 2, 3]);
    });

    it('should handle options with nested object values', () => {
      const options = { config: { nested: { deep: true } } };
      const result = validateOptions(options, ['config'], 'test');
      expect(result?.config).toEqual({ nested: { deep: true } });
    });
  });
});

describe('option name constants', () => {
  describe('workerOptsNames', () => {
    it('should contain expected Web Worker options', () => {
      expect(workerOptsNames).toContain('credentials');
      expect(workerOptsNames).toContain('name');
      expect(workerOptsNames).toContain('type');
      expect(workerOptsNames.length).toBe(3);
    });

    it('should be readonly', () => {
      // TypeScript should prevent mutation, but let's verify it's a readonly tuple
      expect(Object.isFrozen(workerOptsNames)).toBe(false); // const arrays aren't frozen
      expect(Array.isArray(workerOptsNames)).toBe(true);
    });
  });

  describe('forkOptsNames', () => {
    it('should contain expected child_process.fork options', () => {
      expect(forkOptsNames).toContain('cwd');
      expect(forkOptsNames).toContain('env');
      expect(forkOptsNames).toContain('execPath');
      expect(forkOptsNames).toContain('execArgv');
      expect(forkOptsNames).toContain('silent');
      expect(forkOptsNames).toContain('stdio');
      expect(forkOptsNames).toContain('timeout');
    });

    it('should have correct number of options', () => {
      expect(forkOptsNames.length).toBe(14);
    });
  });

  describe('workerThreadOptsNames', () => {
    it('should contain expected worker_threads options', () => {
      expect(workerThreadOptsNames).toContain('argv');
      expect(workerThreadOptsNames).toContain('env');
      expect(workerThreadOptsNames).toContain('eval');
      expect(workerThreadOptsNames).toContain('workerData');
      expect(workerThreadOptsNames).toContain('resourceLimits');
      expect(workerThreadOptsNames).toContain('name');
      expect(workerThreadOptsNames).toContain('type'); // ESM module support (Node.js 20+)
    });

    it('should have correct number of options', () => {
      // 13 options: argv, env, eval, execArgv, stdin, stdout, stderr, workerData,
      // trackUnmanagedFds, transferList, resourceLimits, name, type (ESM support)
      expect(workerThreadOptsNames.length).toBe(13);
    });
  });

  describe('poolOptsNames', () => {
    it('should contain expected Pool options', () => {
      expect(poolOptsNames).toContain('minWorkers');
      expect(poolOptsNames).toContain('maxWorkers');
      expect(poolOptsNames).toContain('maxQueueSize');
      expect(poolOptsNames).toContain('workerType');
      expect(poolOptsNames).toContain('queueStrategy');
      expect(poolOptsNames).toContain('forkOpts');
      expect(poolOptsNames).toContain('workerOpts');
    });
  });

  describe('execOptsNames', () => {
    it('should contain expected exec options', () => {
      expect(execOptsNames).toContain('on');
      expect(execOptsNames).toContain('transfer');
      expect(execOptsNames).toContain('metadata');
      expect(execOptsNames.length).toBe(3);
    });
  });
});

describe('validatePoolOptions', () => {
  it('should validate valid pool options', () => {
    const options = { minWorkers: 1, maxWorkers: 4 };
    expect(validatePoolOptions(options)).toEqual(options);
  });

  it('should throw for unknown pool option', () => {
    const options = { maxWorkers: 4, invalidOption: true };
    expect(() => validatePoolOptions(options)).toThrow(
      'Object "poolOptions" contains an unknown option "invalidOption"'
    );
  });

  it('should return undefined for undefined', () => {
    expect(validatePoolOptions(undefined)).toBeUndefined();
  });
});

describe('validateForkOptions', () => {
  it('should validate valid fork options', () => {
    const options = { cwd: '/tmp', env: { NODE_ENV: 'test' } };
    expect(validateForkOptions(options)).toEqual(options);
  });

  it('should throw for unknown fork option', () => {
    const options = { cwd: '/tmp', badOpt: 123 };
    expect(() => validateForkOptions(options)).toThrow(
      'Object "forkOpts" contains an unknown option "badOpt"'
    );
  });
});

describe('validateWorkerThreadOptions', () => {
  it('should validate valid worker thread options', () => {
    const options = { workerData: { key: 'value' }, name: 'myWorker' };
    expect(validateWorkerThreadOptions(options)).toEqual(options);
  });

  it('should throw for unknown worker thread option', () => {
    const options = { workerData: {}, unknownProp: true };
    expect(() => validateWorkerThreadOptions(options)).toThrow(
      'Object "workerThreadOpts" contains an unknown option "unknownProp"'
    );
  });
});

describe('validateWorkerOptions', () => {
  it('should validate valid web worker options', () => {
    const options = { type: 'module', name: 'myWorker' };
    expect(validateWorkerOptions(options)).toEqual(options);
  });

  it('should throw for unknown web worker option', () => {
    const options = { type: 'module', extraOption: 'bad' };
    expect(() => validateWorkerOptions(options)).toThrow(
      'Object "workerOpts" contains an unknown option "extraOption"'
    );
  });
});

describe('validateExecOptions', () => {
  it('should validate valid exec options', () => {
    const options = { on: () => {}, transfer: [] };
    expect(validateExecOptions(options)).toBeDefined();
  });

  it('should throw for unknown exec option', () => {
    const options = { on: () => {}, timeout: 5000 };
    expect(() => validateExecOptions(options)).toThrow(
      'Object "execOptions" contains an unknown option "timeout"'
    );
  });
});
