
const BaseGenerator = require('generator-jhipster/generators/generator-base');
const writeFiles = require('./files').writeFiles;

module.exports = class extends BaseGenerator {

    constructor(args, opts) {
        super(args, opts);
        this.configOptions = this.options.configOptions || {};
 
        if (opts.entities) {
            this.config.set('baseName', opts.appsName)
            this.config.set('appsName', opts.appsName)
            this.config.set('packageName', opts.packageName)
            this.config.set('packageFolder', opts.appsName)
            this.config.set('android', opts.android);
            this.config.set('ios', opts.ios);
            this.config.set('stateManageType', opts.stateManageType);
        }
    }

    get initializing() {

        return {
            init(args) {
                if (args === 'default') {
                    // do something when argument is 'default'
                }
            },
            readConfig() {
                this.baseName = this.config.get('appsName');
                this.appsName = this.config.get('appsName');
                this.packageName = this.config.get('packageName');
                this.android = this.config.get('android');
                this.ios = this.config.get('ios');
                this.packageFolder = `${this.destinationRoot()}/${this.appsName}`;
            },
        };
    }

    get prompting() {
        return {

            setSharedConfigOptions() {
                this.configOptions.packageName = this.packageName;
                this.configOptions.baseName = this.baseName;
            }
        };
    }

    get configuring() {
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
        return writeFiles(this.config);
    }

    install() {
        this.spawnCommand('flutter', ['create', '--org', `${this.packageName}`, '--project-name', `${this.appsName}`, '-a', `${this.android}`, '-i', `${this.ios}`, `${this.appsName}`]);
        // this.spawnCommand('pub', ['get']);
    }

    end() {
        this.log('Congratulation! Your Flutter Apps has been generated!');
    }
};
