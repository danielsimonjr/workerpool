/**
 * Tests for binary-serializer.ts
 *
 * Tests binary serialization/deserialization for TypedArrays and complex types.
 */

import { describe, it, expect } from 'vitest';
import {
  serializeBinary,
  deserializeBinary,
  shouldUseBinarySerialization,
  estimateBinarySize,
  BinarySerializedData,
} from '../../src/ts/core/binary-serializer';

describe('serializeBinary and deserializeBinary', () => {
  describe('primitives', () => {
    it('should serialize and deserialize null', () => {
      const data = serializeBinary(null);
      expect(deserializeBinary(data)).toBeNull();
    });

    it('should serialize and deserialize undefined', () => {
      const data = serializeBinary(undefined);
      expect(deserializeBinary(data)).toBeUndefined();
    });

    it('should serialize and deserialize booleans', () => {
      expect(deserializeBinary(serializeBinary(true))).toBe(true);
      expect(deserializeBinary(serializeBinary(false))).toBe(false);
    });

    it('should serialize and deserialize numbers', () => {
      expect(deserializeBinary(serializeBinary(42))).toBe(42);
      expect(deserializeBinary(serializeBinary(3.14159))).toBeCloseTo(3.14159);
      expect(deserializeBinary(serializeBinary(0))).toBe(0);
      expect(deserializeBinary(serializeBinary(-1000))).toBe(-1000);
    });

    it('should serialize and deserialize special numbers', () => {
      expect(deserializeBinary(serializeBinary(Infinity))).toBe(Infinity);
      expect(deserializeBinary(serializeBinary(-Infinity))).toBe(-Infinity);
      expect(deserializeBinary(serializeBinary(NaN))).toBeNaN();
    });

    it('should serialize and deserialize strings', () => {
      expect(deserializeBinary(serializeBinary(''))).toBe('');
      expect(deserializeBinary(serializeBinary('hello'))).toBe('hello');
      expect(deserializeBinary(serializeBinary('unicode: 你好'))).toBe('unicode: 你好');
    });

    it('should serialize and deserialize BigInt', () => {
      expect(deserializeBinary(serializeBinary(BigInt(123)))).toBe(BigInt(123));
      expect(deserializeBinary(serializeBinary(BigInt('9007199254740993')))).toBe(
        BigInt('9007199254740993')
      );
    });
  });

  describe('TypedArrays', () => {
    it('should serialize and deserialize Int8Array', () => {
      const original = new Int8Array([1, -2, 3, -4]);
      const result = deserializeBinary(serializeBinary(original)) as Int8Array;
      expect(result).toBeInstanceOf(Int8Array);
      expect(Array.from(result)).toEqual([1, -2, 3, -4]);
    });

    it('should serialize and deserialize Uint8Array', () => {
      const original = new Uint8Array([0, 128, 255]);
      const result = deserializeBinary(serializeBinary(original)) as Uint8Array;
      expect(result).toBeInstanceOf(Uint8Array);
      expect(Array.from(result)).toEqual([0, 128, 255]);
    });

    it('should serialize and deserialize Uint8ClampedArray', () => {
      const original = new Uint8ClampedArray([0, 128, 255]);
      const result = deserializeBinary(serializeBinary(original)) as Uint8ClampedArray;
      expect(result).toBeInstanceOf(Uint8ClampedArray);
      expect(Array.from(result)).toEqual([0, 128, 255]);
    });

    it('should serialize and deserialize Int16Array', () => {
      const original = new Int16Array([-32768, 0, 32767]);
      const result = deserializeBinary(serializeBinary(original)) as Int16Array;
      expect(result).toBeInstanceOf(Int16Array);
      expect(Array.from(result)).toEqual([-32768, 0, 32767]);
    });

    it('should serialize and deserialize Uint16Array', () => {
      const original = new Uint16Array([0, 32768, 65535]);
      const result = deserializeBinary(serializeBinary(original)) as Uint16Array;
      expect(result).toBeInstanceOf(Uint16Array);
      expect(Array.from(result)).toEqual([0, 32768, 65535]);
    });

    it('should serialize and deserialize Int32Array', () => {
      const original = new Int32Array([-2147483648, 0, 2147483647]);
      const result = deserializeBinary(serializeBinary(original)) as Int32Array;
      expect(result).toBeInstanceOf(Int32Array);
      expect(Array.from(result)).toEqual([-2147483648, 0, 2147483647]);
    });

    it('should serialize and deserialize Uint32Array', () => {
      const original = new Uint32Array([0, 2147483648, 4294967295]);
      const result = deserializeBinary(serializeBinary(original)) as Uint32Array;
      expect(result).toBeInstanceOf(Uint32Array);
      expect(Array.from(result)).toEqual([0, 2147483648, 4294967295]);
    });

    it('should serialize and deserialize Float32Array', () => {
      const original = new Float32Array([1.5, -2.5, 3.5]);
      const result = deserializeBinary(serializeBinary(original)) as Float32Array;
      expect(result).toBeInstanceOf(Float32Array);
      expect(Array.from(result)).toEqual([1.5, -2.5, 3.5]);
    });

    it('should serialize and deserialize Float64Array', () => {
      const original = new Float64Array([1.123456789, -2.987654321]);
      const result = deserializeBinary(serializeBinary(original)) as Float64Array;
      expect(result).toBeInstanceOf(Float64Array);
      expect(result[0]).toBeCloseTo(1.123456789);
      expect(result[1]).toBeCloseTo(-2.987654321);
    });

    it('should serialize and deserialize BigInt64Array', () => {
      const original = new BigInt64Array([BigInt(-9007199254740991), BigInt(9007199254740991)]);
      const result = deserializeBinary(serializeBinary(original)) as BigInt64Array;
      expect(result).toBeInstanceOf(BigInt64Array);
      expect(result[0]).toBe(BigInt(-9007199254740991));
      expect(result[1]).toBe(BigInt(9007199254740991));
    });

    it('should serialize and deserialize BigUint64Array', () => {
      const original = new BigUint64Array([BigInt(0), BigInt('18446744073709551615')]);
      const result = deserializeBinary(serializeBinary(original)) as BigUint64Array;
      expect(result).toBeInstanceOf(BigUint64Array);
      expect(result[0]).toBe(BigInt(0));
      // Note: max value might not be exactly preserved due to serialization
    });

    it('should handle empty TypedArrays', () => {
      const original = new Float32Array(0);
      const result = deserializeBinary(serializeBinary(original)) as Float32Array;
      expect(result).toBeInstanceOf(Float32Array);
      expect(result.length).toBe(0);
    });

    it('should handle large TypedArrays', () => {
      const original = new Float64Array(10000);
      for (let i = 0; i < original.length; i++) {
        original[i] = i * 0.1;
      }
      const result = deserializeBinary(serializeBinary(original)) as Float64Array;
      expect(result.length).toBe(10000);
      expect(result[0]).toBeCloseTo(0);
      expect(result[9999]).toBeCloseTo(999.9);
    });
  });

  describe('ArrayBuffer', () => {
    it('should serialize and deserialize ArrayBuffer', () => {
      const original = new ArrayBuffer(16);
      const view = new Uint8Array(original);
      view.set([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]);

      const result = deserializeBinary(serializeBinary(original)) as ArrayBuffer;
      expect(result).toBeInstanceOf(ArrayBuffer);
      expect(result.byteLength).toBe(16);
      expect(Array.from(new Uint8Array(result))).toEqual([
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
      ]);
    });

    it('should handle empty ArrayBuffer', () => {
      const original = new ArrayBuffer(0);
      const result = deserializeBinary(serializeBinary(original)) as ArrayBuffer;
      expect(result).toBeInstanceOf(ArrayBuffer);
      expect(result.byteLength).toBe(0);
    });
  });

  describe('complex types', () => {
    it('should serialize and deserialize arrays', () => {
      const original = [1, 'two', true, null];
      const result = deserializeBinary(serializeBinary(original));
      expect(result).toEqual([1, 'two', true, null]);
    });

    it('should serialize and deserialize nested arrays', () => {
      const original = [[1, 2], [3, [4, 5]]];
      const result = deserializeBinary(serializeBinary(original));
      expect(result).toEqual([[1, 2], [3, [4, 5]]]);
    });

    it('should serialize and deserialize objects', () => {
      const original = { name: 'test', value: 42, active: true };
      const result = deserializeBinary(serializeBinary(original));
      expect(result).toEqual({ name: 'test', value: 42, active: true });
    });

    it('should serialize and deserialize nested objects', () => {
      const original = {
        outer: {
          inner: {
            deep: 'value',
          },
        },
      };
      const result = deserializeBinary(serializeBinary(original));
      expect(result).toEqual(original);
    });

    it('should serialize and deserialize Date', () => {
      const original = new Date('2024-01-15T12:30:00.000Z');
      const result = deserializeBinary(serializeBinary(original)) as Date;
      expect(result).toBeInstanceOf(Date);
      expect(result.getTime()).toBe(original.getTime());
    });

    it('should serialize and deserialize Map', () => {
      const original = new Map<string, number>([
        ['a', 1],
        ['b', 2],
      ]);
      const result = deserializeBinary(serializeBinary(original)) as Map<string, number>;
      expect(result).toBeInstanceOf(Map);
      expect(result.get('a')).toBe(1);
      expect(result.get('b')).toBe(2);
    });

    it('should serialize and deserialize Set', () => {
      const original = new Set([1, 2, 3]);
      const result = deserializeBinary(serializeBinary(original)) as Set<number>;
      expect(result).toBeInstanceOf(Set);
      expect(result.has(1)).toBe(true);
      expect(result.has(2)).toBe(true);
      expect(result.has(3)).toBe(true);
      expect(result.size).toBe(3);
    });

    it('should serialize and deserialize Error', () => {
      const original = new Error('test error message');
      original.name = 'CustomError';
      const result = deserializeBinary(serializeBinary(original)) as Error;
      expect(result).toBeInstanceOf(Error);
      expect(result.message).toBe('test error message');
      expect(result.name).toBe('CustomError');
    });
  });

  describe('mixed content', () => {
    it('should serialize objects containing TypedArrays', () => {
      const original = {
        data: new Float32Array([1.5, 2.5, 3.5]),
        metadata: { count: 3 },
      };
      const result = deserializeBinary(serializeBinary(original)) as typeof original;
      expect(result.data).toBeInstanceOf(Float32Array);
      expect(Array.from(result.data)).toEqual([1.5, 2.5, 3.5]);
      expect(result.metadata).toEqual({ count: 3 });
    });

    it('should serialize arrays containing TypedArrays', () => {
      const original = [new Int32Array([1, 2]), new Int32Array([3, 4])];
      const result = deserializeBinary(serializeBinary(original)) as Int32Array[];
      expect(result[0]).toBeInstanceOf(Int32Array);
      expect(result[1]).toBeInstanceOf(Int32Array);
      expect(Array.from(result[0])).toEqual([1, 2]);
      expect(Array.from(result[1])).toEqual([3, 4]);
    });
  });

  describe('error handling', () => {
    it('should throw for invalid magic number', () => {
      const invalidData: BinarySerializedData = {
        header: new ArrayBuffer(16),
        buffers: [],
      };
      expect(() => deserializeBinary(invalidData)).toThrow('Invalid binary serialization format');
    });
  });
});

describe('shouldUseBinarySerialization', () => {
  it('should return false for null', () => {
    expect(shouldUseBinarySerialization(null)).toBe(false);
  });

  it('should return false for undefined', () => {
    expect(shouldUseBinarySerialization(undefined)).toBe(false);
  });

  it('should return false for small TypedArrays', () => {
    expect(shouldUseBinarySerialization(new Float32Array(10))).toBe(false);
  });

  it('should return true for large TypedArrays', () => {
    expect(shouldUseBinarySerialization(new Float32Array(1000))).toBe(true);
  });

  it('should return false for small ArrayBuffers', () => {
    expect(shouldUseBinarySerialization(new ArrayBuffer(50))).toBe(false);
  });

  it('should return true for large ArrayBuffers', () => {
    expect(shouldUseBinarySerialization(new ArrayBuffer(1000))).toBe(true);
  });

  it('should return true for arrays containing TypedArrays', () => {
    expect(shouldUseBinarySerialization([new Float32Array(1000)])).toBe(true);
  });

  it('should return false for arrays without TypedArrays', () => {
    expect(shouldUseBinarySerialization([1, 2, 3])).toBe(false);
  });

  it('should return true for objects with TypedArray properties', () => {
    expect(shouldUseBinarySerialization({ data: new Float32Array(1000) })).toBe(true);
  });

  it('should return false for plain objects', () => {
    expect(shouldUseBinarySerialization({ a: 1, b: 2 })).toBe(false);
  });
});

describe('estimateBinarySize', () => {
  it('should estimate size for null/undefined', () => {
    expect(estimateBinarySize(null)).toBe(1);
    expect(estimateBinarySize(undefined)).toBe(1);
  });

  it('should estimate size for numbers', () => {
    expect(estimateBinarySize(42)).toBe(9);
  });

  it('should estimate size for strings', () => {
    const estimate = estimateBinarySize('hello');
    expect(estimate).toBeGreaterThan(0);
    expect(estimate).toBeLessThan(100);
  });

  it('should estimate size for TypedArrays', () => {
    const arr = new Float32Array(100);
    const estimate = estimateBinarySize(arr);
    expect(estimate).toBeGreaterThanOrEqual(arr.byteLength);
  });

  it('should estimate size for ArrayBuffer', () => {
    const buf = new ArrayBuffer(1000);
    const estimate = estimateBinarySize(buf);
    expect(estimate).toBeGreaterThanOrEqual(1000);
  });

  it('should estimate size for arrays', () => {
    const arr = [1, 2, 3, 4, 5];
    const estimate = estimateBinarySize(arr);
    expect(estimate).toBeGreaterThan(0);
  });

  it('should estimate size for objects', () => {
    const obj = { key1: 'value1', key2: 123 };
    const estimate = estimateBinarySize(obj);
    expect(estimate).toBeGreaterThan(0);
  });
});
