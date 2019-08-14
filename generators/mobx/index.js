
const BaseGenerator = require('generator-jhipster/generators/generator-base');
const writeFiles = require('./files').writeFiles;

// const jhipsterConstants = require('generator-jhipster/generators/generator-constants');

// let useBlueprint;

module.exports = class extends BaseGenerator {
    constructor(args, opts) {
        super(args, opts);
        this.configOptions = this.options.configOptions || {};
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
                this.android = this.config.get('android');
                this.ios = this.config.get('ios');
                this.packageFolder = `${this.destinationRoot()}/${this.appsName}`; // this.config.get('packageFolder');
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
                this.config.set('packageFolder', `${this.packageFolder}`);
            }
        };
    }

    get writing() {
        return writeFiles();
    }

    install() {
        this.spawnCommand('flutter', ['create', '--org', `${this.packageName}`, '--project-name', `${this.appsName}`, '-a', `${this.android}`, '-i', `${this.ios}`, `${this.appsName}`]);
        // this.spawnCommand('pub', ['get']);
    }

    end() {
        this.log('Congratulation! Your Flutter Apps has been generated!');
    }
};
