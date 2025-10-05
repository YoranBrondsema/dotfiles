const { executeStep, cmd, prettyShellCommand, multiline, uniq } = require('./utils');

(
  async function() {
    await cleanXcode();
    await cleanAndroid();
    await cleanNpmCache();
    await cleanYarnCache();
    await cleanVimSwapFiles();
    await emptyTrash();
    await emptyChromiumCache();
    await emptyChromeCache();
    await cleanupBrew();
    await cleanupGems();
    await removeUnusedRubies();
  }
)();

async function removeUnusedRubies() {
  await executeStep(
    multiline('Remove the unused rubies?'),
    async () => {
      const installedRubiesStr = await cmd('rvm list');
      const installedRubies = installedRubiesStr
        .split('\n')
        .map((line) => line.match(/ruby-(\d\.\d\.\d)/))
        .filter((line) => line !== null)
        .map(([_, version]) => version);

      const usedRubiesStr = await cmd('find ~/Projects -name .ruby-version | xargs cat');
      const usedRubies = uniq(usedRubiesStr.split('\n').filter((ruby) => ruby !== ''));

      const unusedRubies = installedRubies.filter((ruby) => !usedRubies.includes(ruby));

      for (const ruby of unusedRubies) {
        await cmd(`rvm remove ruby-${ruby} --archive --gems`);
      }
    }
  );
}

async function cleanXcode() {
  await executeStep(
    multiline('Clean Xcode?'),
    async () => {
      // From https://www.freecodecamp.org/news/how-to-free-up-space-on-your-developer-mac-f542f66ddfb/
      await cmd('xcrun simctl delete unavailable');
      await cmd('rm -rf ~/Library/Caches/CocoaPods');
      await cmd('rm -rf ~/Library/Developer/Xcode/Archives');
      await cmd('rm -rf ~/Library/Developer/Xcode/DerivedData');
    }
  );
}

async function cleanAndroid() {
  await executeStep(
    multiline('Clean Android?'),
    async () => {
      // From https://dev.to/davidamunga/free-space-in-your-mac-for-mobile-development-5a60
      await cmd('rm -rf ~/.gradle/caches');
      await cmd('rm -rf ~/.gradle/daemon');
      await cmd('rm -rf ~/.gradle/wrapper');
    }
  );
}

async function cleanNpmCache() {
  const COMMAND = 'npm cache clean --force';

  await executeStep(
    multiline('Clean the NPM cache?', prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function cleanYarnCache() {
  const COMMAND = 'yarn cache clean';

  await executeStep(
    multiline('Clean the NPM cache?', prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function cleanVimSwapFiles() {
  const DIR = '~/.vim/_tmp';
  const COMMAND = `rm -r ${DIR}/*`;

  await executeStep(
    multiline(`Clean the Vim swap files?`, prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function emptyTrash() {
  const DIR = '~/.local/share/Trash';
  const COMMAND = `rm -r ${DIR}/*`;

  await executeStep(
    multiline(`Empty the Trash?`, prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function emptyChromiumCache() {
  const COMMAND = `rm -rf ~/.cache/chromium`;

  await executeStep(
    multiline(`Empty Chromium cache?`, prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function emptyChromeCache() {
  const COMMAND = `rm -rf ~/.cache/google-chrome`;

  await executeStep(
    multiline(`Empty Chrome cache?`, prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function cleanupBrew() {
  const COMMAND = `brew cleanup`;

  await executeStep(
    multiline(`Clean up brew?`, prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}

async function cleanupGems() {
  const COMMAND = `gem cleanup`;

  await executeStep(
    multiline(`Clean up gems?`, prettyShellCommand(COMMAND)),
    async () => await cmd(COMMAND)
  );
}
