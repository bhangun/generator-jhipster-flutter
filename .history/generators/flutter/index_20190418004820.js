// const chalk = require('chalk');

const BaseGenerator = require('generator-jhipster/generators/generator-base');
const writeFiles = require('./files').writeFiles;
// const jhipsterConstants = require('generator-jhipster/generators/generator-constants');

// let useBlueprint;

module.exports = class extends BaseGenerator {
    constructor(args, opts) {
        super(args, opts);
        this.configOptions = this.options.configOptions || {};

        // // This adds support for a `--[no-]client-hook` flag
        // this.option('client-hook', {
        //     desc: 'Enable gulp and bower hook from maven/gradle build',
        //     type: Boolean,
        //     defaults: false
        // });

        // // This adds support for a `--[no-]i18n` flag
        // this.option('i18n', {
        //     desc: 'Disable or enable i18n when skipping client side generation, has no effect otherwise',
        //     type: Boolean,
        //     defaults: true
        // });

        // const blueprint = this.options.blueprint || this.configOptions.blueprint || this.config.get('blueprint');
        // useBlueprint = this.composeBlueprint(blueprint, 'kotlin'); // use global variable since getters dont have access to instance property
    }

    get initializing() {
        return {
            init(args) {
                if (args === 'default') {
                    // do something when argument is 'default'
                }
            },
            readConfig() {
                this.baseName = this.config.get('baseName');
                this.appsName = this.config.get('appsName');
                this.packageName = this.config.get('packageName');
                this.packageFolder = this.config.get('packageFolder');
                this.log(`${this.config.get('basis')} <> ${this.baseName}`);
            },
        };
    }

    get prompting() {
        return {
        // askForModuleName: prompts.askForModuleName,
            setSharedConfigOptions() {
                this.configOptions.packageName = this.packageName;
                this.configOptions.baseName = this.baseName;
            }
        };
    }

    get configuring() {
    // if (useBlueprint) return;
        return {
            saveConfig() {
                this.config.set('baseName', this.baseName);
                this.config.set('appsName', this.appsName);
                this.config.set('packageName', this.packageName);
                this.config.set('packageFolder', this.packageFolder);
            }
        };
    }

    get writing() {
        return writeFiles();
    }

    install() {
        this.spawnCommand('flutter', ['packages', 'get']);
    }

    end() {
        this.log('Congratulation! Your Flutter Apps has been generated!');
    }
};
