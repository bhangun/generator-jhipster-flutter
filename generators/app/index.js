const chalk = require('chalk');
// const semver = require('semver');
const shelljs = require('shelljs');
const BaseGenerator = require('generator-jhipster/generators/generator-base');
// const jhipsterConstants = require('generator-jhipster/generators/generator-constants');
const packagejs = require('../../package.json');


module.exports = class extends BaseGenerator {
    get initializing() {
        return {
            init(args) {
                if (args === 'default') {
                    // do something when argument is 'default'
                }
            },
            readConfig() {
                //  this.jhipsterAppConfig = this.getAllJhipsterConfig();
                /*  if (!this.jhipsterAppConfig) {
                    this.error('Can\'t read .yo-rc.json');
                }  */
                // this.log(this.destinationRoot());
            },
            displayLogo() {
                this.log(`${chalk.bold.cyan('_          _   _ _                   ')}`);
                this.log(`${chalk.bold.cyan('| |        | | (_) |                  ')}`);
                this.log(`${chalk.bold.cyan('| | ___   _| |_ _| | __ _ _ __   __ _ ')}`);
                this.log(`${chalk.bold.cyan('| |/ / | | | __| | |/ _` | \'_ \\ / _` |')}`);
                this.log(`${chalk.bold.cyan('|   <| |_| | |_| | | (_| | | | | (_| |')}`);
                this.log(`${chalk.bold.cyan('|_\\_\\\\__,_|\\__|_|_|\\__,_|_| |_|\\__,  |')}`);
                this.log(`${chalk.bold.cyan('                                 __/ |')}`);
                this.log(`${chalk.bold.cyan('                                |___/ ')}`);
<<<<<<< HEAD

                // Have Yeoman greet the user.
                this.log(`\nWelcome to the ${chalk.bold.yellow('Flutter Apps')} generator! ${chalk.yellow(`v${packagejs.version}\n`)}`);
=======
                this.log(`\nWelcome to the ${chalk.bold.yellow('JHipster-Flutter')} generator! ${chalk.yellow(`v${packagejs.version}\n`)}`);
>>>>>>> b14931bc79abc260f5f3efd9d859c19331b3aa0b
            },
        };
    }

    prompting() {
        /* this.getExistingEntities().forEach((entity) => {
            this.log(entity.name);
            this.log(entity);
        }); */
        // this.log(this.auditedEntities[0]);
        const appsName = this.getDefaultAppName();

        const prompts = [
            {
                type: 'input',
                name: 'appsName',
                message: 'What is your Flutter application name?',
                default: appsName,
                store: true
            },
            {
                type: 'input',
                name: 'directoryPath',
                message: 'Where JHipster app directory is located?',
                default: 'backend',
                store: true,
                validate: (input) => {
                    const path = this.destinationPath(input);
                    if (shelljs.test('-d', path)) {
                        const appsFolders = getAppFolder.call(this, input);
                        if (appsFolders.length === 0) {
                            return `No application found in ${path}`;
                        }
                        return true;
                    }
                    return `${path} is not a directory or doesn't exist`;
                }
            },
            {
                type: 'input',
                name: 'packageName',
                validate: input => (/^([a-z_]{1}[a-z0-9_]*(\.[a-z_]{1}[a-z0-9_]*)*)$/.test(input) ? true : 'The package name you have provided is not a valid Java package name.'),
                message: 'What is your package name?',
                // default: this.jhipsterAppConfig.packageName,
                store: true
            },
            {
                type: 'list',
                name: 'android',
                message: 'Which Android native code do you want to use?',
                choices: [
                    {
                        value: 'kotlin',
                        name: 'Kotlin'
                    },
                    {
                        value: 'java',
                        name: 'Java'
                    },
                ],
                default: 'kotlin'
            },
            {
                type: 'list',
                name: 'ios',
                message: 'Which iOS native code do you want to use?',
                choices: [
                    {
                        value: 'swift',
                        name: 'Swift'
                    },
                    {
                        value: 'objc',
                        name: 'Objective-C'
                    },
                ],
                default: 'swift'
            },
            {
                type: 'list',
                name: 'stateManageType',
                message: 'Which State-Management style do you want to use?',
                choices: [
                    /*  {
                         value: 'basic',
                         name: 'Basic state-management'
                     },
                     {
                         value: 'provider',
                         name: 'Provider state-management'
                     }, */
                    {
                        value: 'mobx',
                        name: 'MobX state-management'
                    },

                ],
                default: 'basic'
            },
        ];

        const done = this.async();
        this.prompt(prompts).then((props) => {
            this.props = props;
            done();
        });
    }

    get configuring() {
        return {
            saveConfig() {
                this.config.set('appsName', this.props.appsName);
                this.config.set('packageName', this.props.packageName);
                this.config.set('directoryPath', `${this.props.directoryPath}`);
                this.config.set('packageFolder', `${this.props.appsName}`);
                this.config.set('android', this.props.android);
                this.config.set('ios', this.props.ios);
                this.config.set('stateManageType', this.props.stateManageType);
            }
        };
    }

    writing() {
        const fromPath = `${this.props.directoryPath}/.yo-rc.json`;
        this.log(fromPath);
        this.jhipsterAppConfig = this.fs.readJSON(fromPath)['generator-jhipster'];

        // function to use directly template
        this.template = function (source, destination) {
            this.fs.copyTpl(
                this.templatePath(source),
                this.destinationPath(destination),
                this
            );
        };

        this.message = this.props.message;
        this.baseName = this.props.appsName;
        this.packageName = this.props.packageName;
        this.packageFolder = this.destinationRoot();
        this.buildTool = this.props.buildTool;

        // variable from questions
        // show all variables
        // this.log('\n--- some config read from config ---');
        this.log(`baseName=${this.baseName}`);
        this.log(`packageName=${this.packageName}`);
        this.log(`packageFolder=${this.packageFolder}`);

        if (this.props.stateManageType === 'provider') {
            this.composeWith(require.resolve('../provider'));
        } else if (this.props.stateManageType === 'mobx') {
            this.composeWith(require.resolve('../mobx'));
        } else {
            this.composeWith(require.resolve('../basic'));
        }

        // variable for native code
        this.nativeCode = ` -a ${this.props.android} -i ${this.props.ios} `;

        try {
            this.registerModule('generator-jhipster-kutilang', 'entity', 'post', 'entity', 'Generate Mobile (iOS/Andoird), Web and Desktop(Linux, MacOS, Windows) Apps using Flutter & Dart Language and JHipster as a backend');
        } catch (err) {
            this.log(`${chalk.red.bold('WARN!')} Could not register as a jhipster entity post creation hook...\n`);
        }
    }

    install() {
        this.spawnCommand('mv', ['.yo-rc.json', `${this.baseName}/`]);
        this.spawnCommand('chmod', 'a+x', ['run_watcher', `${this.baseName}/`]);
    }

    end() {
        this.log('Finish generated kutilang packages');
    }
};


/**
 * Get App Folders
 * @param input path to join to destination path
 * @returns {Array} array of string representing app folders
 */
function getAppFolder(input) {
    const destinationPath = this.destinationPath(input);
    const appsFolders = [];

    if (shelljs.test('-f', `${destinationPath}/.yo-rc.json`)) {
        try {
            const fileData = this.fs.readJSON(`${destinationPath}/.yo-rc.json`);
            if (fileData['generator-jhipster'].baseName !== undefined) {
                appsFolders.push(destinationPath);
            }
        } catch (err) {
            this.log(chalk.red(`The .yo-rc.json in ${destinationPath} can't be read!`));
            this.debug('Error:', err);
        }
    }

    return appsFolders;
}
