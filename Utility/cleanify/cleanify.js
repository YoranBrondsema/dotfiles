// Cleans the system by removing caches and so on.

const { executeStep, cmd, prettyShellCommand, multiline } = require('./utils');

(
  async function() {
    await cleanNpmCache();
    await cleanYarnCache();
    await cleanVimSwapFiles();
    await emptyTrash();
    await emptyChromiumCache();
    await emptyChromeCache();
  }
)();

async function cleanNpmCache() {
  const COMMAND = 'npm cache clean --force';

  await executeStep(
    multiline(
      'Clean the NPM cache?',
      prettyShellCommand(COMMAND)
    ),
    async () => {
      await cmd(COMMAND);
    }
  );
}

async function cleanYarnCache() {
  const COMMAND = 'yarn cache clean';

  await executeStep(
    multiline(
      'Clean the NPM cache?',
      prettyShellCommand(COMMAND)
    ),
    async () => {
      await cmd(COMMAND);
    }
  );
}

async function cleanVimSwapFiles() {
  const DIR = '~/.vim/_tmp';
  const COMMAND = `rm -r ${DIR}/*`;

  await executeStep(
    multiline(
      `Clean the Vim swap files?`,
      prettyShellCommand(COMMAND)
    ),
    async () => {
      await cmd(COMMAND);
    }
  );
}

async function emptyTrash() {
  const DIR = '~/.local/share/Trash';
  const COMMAND = `rm -r ${DIR}/*`;

  await executeStep(
    multiline(
      `Empty the Trash?`,
      prettyShellCommand(COMMAND)
    ),
    async () => {
      await cmd(COMMAND);
    }
  );
}

async function emptyChromiumCache() {
  const COMMAND = `rm -rf ~/.cache/chromium`;

  await executeStep(
    multiline(
      `Empty Chromium cache?`,
      prettyShellCommand(COMMAND)
    ),
    async () => {
      await cmd(COMMAND);
    }
  );
}

async function emptyChromeCache() {
  const COMMAND = `rm -rf ~/.cache/google-chrome`;

  await executeStep(
    multiline(
      `Empty Chrome cache?`,
      prettyShellCommand(COMMAND)
    ),
    async () => {
      await cmd(COMMAND);
    }
  );
}
