var assert = require('assert');
var path = require('path');
var childProcess = require('child_process');

var CHECK = path.join(__dirname, '..', 'runtime', 'worker-threads-check.js');

function runCheck(cmd) {
  return childProcess.spawnSync(cmd, [CHECK], { encoding: 'utf8', timeout: 20000 });
}

function hasBun() {
  var probe = childProcess.spawnSync('bun', ['--version'], { encoding: 'utf8', timeout: 10000 });
  return probe.status === 0;
}

describe('worker_threads worker (runtime check)', function () {
  this.timeout(25000);

  it('execs and terminates promptly under Node', function () {
    var res = runCheck(process.execPath);
    assert.strictEqual(res.status, 0, res.stdout + res.stderr);
    assert.match(res.stdout, /^OK exec=5/);
  });

  // Bun defines self/postMessage/addEventListener inside worker_threads
  // workers; the worker must still use parentPort. Skipped when bun is absent.
  it('execs and terminates promptly under Bun', function () {
    if (!hasBun()) {
      this.skip();
    }
    var res = runCheck('bun');
    assert.strictEqual(res.status, 0, res.stdout + res.stderr);
    assert.match(res.stdout, /^OK exec=5/);
  });
});
