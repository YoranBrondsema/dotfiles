const { exec } = require("child_process");
const readline = require("readline");

async function executeStep(commandFn, confirmationQuestion) {
  try {
    await confirm(confirmationQuestion);
    await commandFn();
  } catch(e) {
  }
}

function cmd(command) {
  return new Promise((resolve, reject) => {
    console.log(`$ ${command}`);

    exec(command, (error, stdout, stderr) => {
      if (error) {
        reject(error);
        console.log(`error: ${error.message}`);
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

async function confirm(question) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });

  await new Promise((resolve, reject) => {
    rl.question(`${question} (y/n) `, (answer) => {
      rl.close();

      if (answer === 'y') {
        resolve(answer);
      } else {
        reject();
      }
    });
  });
}

module.exports = {
  executeStep,
  cmd
};
