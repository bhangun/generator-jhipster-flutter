const chalk = require('chalk');
const packagejs = require('../../package.json');
const semver = require('semver');
const BaseGenerator = require('generator-jhipster/generators/generator-base');
const jhipsterConstants = require('generator-jhipster/generators/generator-constants');

module.exports = class extends BaseGenerator {
    get initializing() {
        return {
            init(args) {
                if (args === 'default') {
                    // do something when argument is 'default'
                }
            },
            readConfig() {
                this.jhipsterAppConfig = this.getJhipsterAppConfig();
                if (!this.jhipsterAppConfig) {
                    this.error('Can\'t read .yo-rc.json');
                }
            },
            displayLogo() {
                this.log(`${chalk.bold.yellow('   _ _     ')}${chalk.bold.cyan('    ______      __  __           ')}`);
                this.log(`${chalk.bold.yellow('  (_) |__  ')}${chalk.bold.cyan('   / __/ /_  __/ /_/ /____  _____')}`);
                this.log(`${chalk.bold.yellow('  | | \'_ \\   ')}${chalk.bold.cyan('/ /_/ / / / / __/ __/ _ \\/ ___/')}`);
                this.log(`${chalk.bold.yellow('  | | | | |')}${chalk.bold.blue(' / __/ / /_/ / /_/ /_/  __/ /    ')}`);
                this.log(`${chalk.bold.yellow(' _/ |_| |_|')}${chalk.bold.blue('/_/ /_/\\__,_/\\__/\\__/\\___/_/     ')}`);
                this.log(`${chalk.bold.yellow('|__/       ')}${chalk.bold.blue('                                 ')}`);
                // Have Yeoman greet the user.
                this.log(`\nWelcome 1 to the ${chalk.bold.yellow('JHipster Flutter')} module generator! ${chalk.yellow(`v${packagejs.version}\n`)}`);
            },
            checkJhipster() {
                const currentJhipsterVersion = this.jhipsterAppConfig.jhipsterVersion;
                const minimumJhipsterVersion = packagejs.dependencies['generator-jhipster'];
                if (!semver.satisfies(currentJhipsterVersion, minimumJhipsterVersion)) {
                    this.warning(`\nYour generated project used an old JHipster version (${currentJhipsterVersion})... you need at least (${minimumJhipsterVersion})\n`);
                }
            }
        };
    }

    prompting() {
        const appsName = `${this.jhipsterAppConfig.baseName}Apps`;
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
                name: 'packageName',
                validate: input => (/^([a-z_]{1}[a-z0-9_]*(\.[a-z_]{1}[a-z0-9_]*)*)$/.test(input) ?
                    true : 'The package name you have provided is not a valid Java package name.'),
                message: 'What is your package name?',
                default: this.jhipsterAppConfig.packageName,
                store: true
            },
            {
                type: 'input',
                name: 'path',
                message: 'Where your apps path folder would be put?(relative/absolute)',
                default: '../'
            },
        ];

        const done = this.async();
        this.prompt(prompts).then((props) => {
            this.props = props;
            // this.log(this.props.packageName);
            done();
        });

        this.config.set('basis', 'bbbbb');
    }

    get configuring() {
        //
        // if (useBlueprint) return;
        return {
            saveConfig() {
                this.config.set('appsName', this.props.appsName);
                this.config.set('packageName', this.props.packageName);
                this.config.set('path', this.props.path);
                this.config.set('packageFolder', `${this.props.path}${this.props.appsName}`);
                this.log('-------00------');
                this.log('-------00------');

                this.config.set('anehyah', 'dsdfsdsfdsdf');

                this.config.set('namamu', 'bhangun');
                this.config.set('cobalgah', 'bhangun');

                this.config.set('ahkglg', 'qwqwqwqwqwqw');
            }
        };
    }

    writing() {
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
        this.path = this.props.path;
        this.packageFolder = `${this.props.path}${this.props.appsName}`;
        this.buildTool = this.props.buildTool;

        // use constants from generator-constants.js
        const javaDir = `${jhipsterConstants.SERVER_MAIN_SRC_DIR + this.path}/`;
        const resourceDir = jhipsterConstants.SERVER_MAIN_RES_DIR;
        // variable from questions
        // show all variables

        this.log('------22-------$this.config.appsName');
        this.log('\n--- some config read from config ---');
        this.log(`baseName=${this.baseName}`);
        this.log(`packageName=${this.packageName}`);
        this.log(`path=${this.path}`);
        this.log(`packageFolder=${this.packageFolder}`);
        this.log(`buildTool=${this.buildTool}`);

        this.log('\n--- some const ---');
        this.log(`javaDir=${javaDir}`);
        this.log(`resourceDir=${resourceDir}`);

        this.composeWith(require.resolve('../flutter'));

        this.log(this.config.get('basis') + ' <><>??;;;;;??<><> ' + this.baseName);

        try {
            this.registerModule('generator-jhipster-flutter', 'entity', 'post', 'entity', 'Generate Mobile Apps for Android & iOS using Flutter & Dart Language');
        } catch (err) {
            this.log(`${chalk.red.bold('WARN!')} Could not register as a jhipster entity post creation hook...\n`);
        }
    }


    install() {}

    end() {
        this.log(this.config.get('baseName') + ' <><>????<><> ' + this.baseName);
        
        this.log('End of flutter generator');
    }
};
