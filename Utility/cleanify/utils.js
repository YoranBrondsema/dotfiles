const { exec } = require("child_process");
const readline = require("readline");

async function executeStep(confirmationQuestion, commandFn) {
  try {
    await confirm(confirmationQuestion);
    await commandFn();
  } catch(e) {}

  console.log('\n');
}

function cmd(command) {
  return new Promise((resolve, reject) => {
    exec(command, (error, stdout, stderr) => {
      if (error) {
        reject(error);
        return;
      }

      if (stderr) {
        reject(stderr);
        return;
      }

      resolve(stdout);
    });
  });
}

function prettyShellCommand(command) {
  return `$ ${command}`;
}

async function confirm(question) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  await new Promise((resolve, reject) => {
    rl.question(`${question}\n(y/n) `, (answer) => {
      rl.close();

      if (answer === 'y') {
        console.log('ok');
        resolve(answer);
      } else {
        console.log('skip');
        reject();
      }
    });
  });
}

function multiline() {
  return [...arguments].join('\n');
}

module.exports = {
  executeStep,
  cmd,
  prettyShellCommand,
  multiline
};
