// Cleans the system by removing caches and so on.

const { executeStep, cmd } = require('./utils');

(
  async function() {
    await cleanNpmCache();
    await cleanYarnCache();
  }
)();

async function cleanNpmCache() {
  await executeStep(
    async () => {
      await cmd('npm cache clean --force');
    },
    'Clean the NPM cache?'
  );
}

async function cleanYarnCache() {
  await executeStep(
    async () => {
      await cmd('yarn cache clean');
    },
    'Clean the Yarn cache?'
  );
}
