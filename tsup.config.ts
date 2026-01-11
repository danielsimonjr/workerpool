import { defineConfig } from 'tsup';

// Common externals for all builds
const commonExternal = [
  // Node.js builtins
  'os',
  'worker_threads',
  'child_process',
  'path',
  'fs',
  'url',
  // Generated at runtime by Rollup build
  /embeddedWorker/,
];

export default defineConfig([
  // Main TypeScript library builds (modern API)
  {
    entry: {
      'index': 'src/ts/index.ts',
      'minimal': 'src/ts/minimal.ts',
      'full': 'src/ts/full.ts',
      'errors': 'src/ts/errors.ts',
      'debug': 'src/ts/debug.ts',
    },
    format: ['esm', 'cjs'],
    dts: true,
    splitting: false,
    sourcemap: true,
    clean: false, // Don't clean - Rollup outputs to same dist/
    outDir: 'dist/ts',
    target: 'node18',
    shims: true,
    external: commonExternal,
  },
  // WASM module entry
  {
    entry: {
      'wasm/index': 'src/ts/wasm/index.ts',
    },
    format: ['esm', 'cjs'],
    dts: true,
    splitting: false,
    sourcemap: true,
    clean: false,
    outDir: 'dist/ts',
    target: 'node18',
    shims: true,
    external: commonExternal,
  },
  // Worker file (must be separate for dynamic loading)
  {
    entry: {
      'workers/worker': 'src/ts/workers/worker.ts',
    },
    format: ['esm', 'cjs'],
    dts: false,
    splitting: false,
    sourcemap: true,
    clean: false,
    outDir: 'dist/ts',
    target: 'node18',
    shims: true,
    external: commonExternal,
  },
]);
