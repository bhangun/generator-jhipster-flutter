/**
 * Copyright 2013-2018 the original author or authors from the JHipster project.
 *
 * This file is part of the JHipster project, see http://www.jhipster.tech/
 * for more information.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
const chalk = require('chalk');
const path = require('path');
const _ = require('lodash');
const jhiCore = require('jhipster-core');
const shelljs = require('shelljs');

module.exports = {
    askForBackendJson,
    askForUpdate,
    askForFields,
    askForFieldsToRemove,
    askForRelationships,
    askForRelationsToRemove,
    askForFiltering,
    askForPagination
};

function askForBackendJson() {
    const context = this.context;
    if (this.useConfigurationFile) {
        return;
    }

    const done = this.async();

    const prompts = [
        {
            type: 'confirm',
            name: 'useBackendJson',
            message: 'Do you want to generate this entity from an existing app?',
            default: true
        },
        {
            when: response => response.useBackendJson === true,
            type: 'input',
            name: 'backendPath',
            message: 'Enter the path to your JHipster app\'s root directory:',
            default: '../',
            store: true,
            validate: (input) => {
                let fromPath = '';
                if (path.isAbsolute(input)) {
                    fromPath = `${input}/${context.filename}`;
                } else {
                    fromPath = this.destinationPath(`${input}/${context.filename}`);
                }

                if (shelljs.test('-f', fromPath)) {
                    return true;
                }
                return `${context.filename} not found in ${input}/`;
            }
        }
    ];

    this.prompt(prompts).then((props) => {
        if (props.backendPath) {
            this.log(chalk.green(`\nFound the ${context.filename} configuration file, entity can be automatically generated!\n`));
            if (path.isAbsolute(props.backendPath)) {
                context.backendPath = props.backendPath;
            } else {
                context.backendPath = path.resolve(props.backendPath);
            }
            context.fromPath = `${context.backendPath}/${context.jhipsterConfigDirectory}/${context.entityNameCapitalized}.json`;
            context.useConfigurationFile = true;
            context.useBackendJson = true;
            this.loadEntityJson();

            // this.loadEntityJson() has a gateway check, which won't work here, so simplify
            if (context.useMicroserviceJson) {
                context.microserviceName = context.fileData.microserviceName;
                if (!context.microserviceName) {
                    this.error(chalk.red('Microservice name for the entity is not found. Entity cannot be generated!'));
                }
                context.microserviceAppName = this.getMicroserviceAppName(context.microserviceName);
                context.skipServer = true;
            }
        }
        done();
    });
}

function askForUpdate() {
    const context = this.context;
    // ask only if running an existing entity without arg option --force or --regenerate
    const isForce = context.options.force || context.regenerate;
    context.updateEntity = 'regenerate'; // default if skipping questions by --force
    if (isForce || !context.useConfigurationFile) {
        return;
    }
    const done = this.async();
    const prompts = [
        {
            type: 'list',
            name: 'updateEntity',
            message: 'Do you want to update the entity? This will replace the existing files for this entity, all your custom code will be overwritten',
            choices: [
                {
                    value: 'regenerate',
                    name: 'Yes, re generate the entity'
                },
                {
                    value: 'add',
                    name: 'Yes, add more fields and relationships'
                },
                {
                    value: 'remove',
                    name: 'Yes, remove fields and relationships'
                },
                {
                    value: 'none',
                    name: 'No, exit'
                }
            ],
            default: 0
        }
    ];
    this.prompt(prompts).then((props) => {
        context.updateEntity = props.updateEntity;
        if (context.updateEntity === 'none') {
            this.env.error(chalk.green('Aborting entity update, no changes were made.'));
        }
        done();
    });
}

function askForFields() {
    const context = this.context;
    // don't prompt if data is imported from a file
    if (context.useConfigurationFile && context.updateEntity !== 'add') {
        return;
    }

    if (context.updateEntity === 'add') {
        logFieldsAndRelationships.call(this);
    }

    const done = this.async();

    askForField.call(this, done);
}

function askForFieldsToRemove() {
    const context = this.context;
    // prompt only if data is imported from a file
    if (!context.useConfigurationFile || context.updateEntity !== 'remove' || context.fieldNameChoices.length === 0) {
        return;
    }
    const done = this.async();

    const prompts = [
        {
            type: 'checkbox',
            name: 'fieldsToRemove',
            message: 'Please choose the fields you want to remove',
            choices: context.fieldNameChoices
        },
        {
            when: response => response.fieldsToRemove.length !== 0,
            type: 'confirm',
            name: 'confirmRemove',
            message: 'Are you sure to remove these fields?',
            default: true
        }
    ];
    this.prompt(prompts).then((props) => {
        if (props.confirmRemove) {
            this.log(chalk.red(`\nRemoving fields: ${props.fieldsToRemove}\n`));
            for (let i = context.fields.length - 1; i >= 0; i -= 1) {
                const field = context.fields[i];
                if (props.fieldsToRemove.filter(val => val === field.fieldName).length > 0) {
                    context.fields.splice(i, 1);
                }
            }
        }
        done();
    });
}

function askForRelationships() {
    const context = this.context;
    // don't prompt if data is imported from a file
    if (context.useConfigurationFile && context.updateEntity !== 'add') {
        return;
    }
    if (['cassandra', 'mongodb', 'couchbase'].includes(context.databaseType)) {
        return;
    }

    const done = this.async();

    askForRelationship.call(this, done);
}

function askForRelationsToRemove() {
    const context = this.context;
    // prompt only if data is imported from a file
    if (!context.useConfigurationFile || context.updateEntity !== 'remove' || context.relNameChoices.length === 0) {
        return;
    }
    if (['cassandra', 'mongodb', 'couchbase'].includes(context.databaseType)) {
        return;
    }

    const done = this.async();

    const prompts = [
        {
            type: 'checkbox',
            name: 'relsToRemove',
            message: 'Please choose the relationships you want to remove',
            choices: context.relNameChoices
        },
        {
            when: response => response.relsToRemove.length !== 0,
            type: 'confirm',
            name: 'confirmRemove',
            message: 'Are you sure to remove these relationships?',
            default: true
        }
    ];
    this.prompt(prompts).then((props) => {
        if (props.confirmRemove) {
            this.log(chalk.red(`\nRemoving relationships: ${props.relsToRemove}\n`));
            for (let i = context.relationships.length - 1; i >= 0; i -= 1) {
                const rel = context.relationships[i];
                if (props.relsToRemove.filter(val => val === `${rel.relationshipName}:${rel.relationshipType}`).length > 0) {
                    context.relationships.splice(i, 1);
                }
            }
        }
        done();
    });
}

function askForTableName() {
    const context = this.context;
    // don't prompt if there are no relationships
    const entityTableName = context.entityTableName;
    const prodDatabaseType = context.prodDatabaseType;
    if (!context.relationships || context.relationships.length === 0
        || !((prodDatabaseType === 'oracle' && entityTableName.length > 14) || entityTableName.length > 30)) {
        return;
    }
    const done = this.async();
    const prompts = [
        {
            type: 'input',
            name: 'entityTableName',
            message: 'The table name for this entity is too long to form constraint names. Please use a shorter table name',
            validate: (input) => {
                if (!(/^([a-zA-Z0-9_]*)$/.test(input))) {
                    return 'The table name cannot contain special characters';
                } if (input === '') {
                    return 'The table name cannot be empty';
                } if (prodDatabaseType === 'oracle' && input.length > 14) {
                    return 'The table name is too long for Oracle, try a shorter name';
                } if (input.length > 30) {
                    return 'The table name is too long, try a shorter name';
                }
                return true;
            },
            default: entityTableName
        }
    ];
    this.prompt(prompts).then((props) => {
        /* overwrite the table name for the entity using name obtained from the user */
        if (props.entityTableName !== context.entityTableName) {
            context.entityTableName = _.snakeCase(props.entityTableName).toLowerCase();
        }
        done();
    });
}

function askForFiltering() {
    const context = this.context;
    // don't prompt if server is skipped, or the backend is not sql, or no service requested
    if (context.useConfigurationFile || context.skipServer || context.databaseType !== 'sql' || context.service === 'no') {
        return;
    }
    const done = this.async();
    const prompts = [
        {
            type: 'list',
            name: 'filtering',
            message: 'Do you want to add filtering?',
            choices: [
                {
                    value: 'no',
                    name: 'Not needed'
                },
                {
                    name: 'Dynamic filtering for the entities with JPA Static metamodel',
                    value: 'jpaMetamodel'
                }
            ],
            default: 0
        }
    ];
    this.prompt(prompts).then((props) => {
        context.jpaMetamodelFiltering = props.filtering === 'jpaMetamodel';
        done();
    });
}

function askForPagination() {
    const context = this.context;
    // don't prompt if data are imported from a file
    if (context.useConfigurationFile) {
        return;
    }
    if (context.databaseType === 'cassandra') {
        return;
    }
    const done = this.async();
    let prompts = [
        {
            type: 'list',
            name: 'pagination',
            message: 'Do you want pagination on your entity?',
            choices: [
                {
                    value: 'no',
                    name: 'No'
                },
                {
                    value: 'pager',
                    name: 'Yes, with a simple pager'
                },
                {
                    value: 'pagination',
                    name: 'Yes, with pagination links'
                },
                {
                    value: 'infinite-scroll',
                    name: 'Yes, with infinite scroll'
                }
            ],
            default: 0
        }
    ];
    // Check the issue https://github.com/jhipster/generator-jhipster/issues/5007 for more details
    if (context.clientFramework !== 'angular1') {
        prompts = [
            {
                type: 'list',
                name: 'pagination',
                message: 'Do you want pagination on your entity?',
                choices: [
                    {
                        value: 'no',
                        name: 'No'
                    },
                    {
                        value: 'pagination',
                        name: 'Yes, with pagination links'
                    },
                    {
                        value: 'infinite-scroll',
                        name: 'Yes, with infinite scroll'
                    }
                ],
                default: 0
            }
        ];
    }
    this.prompt(prompts).then((props) => {
        context.pagination = props.pagination;
        this.log(chalk.green('\nEverything is configured, generating the entity...\n'));
        done();
    });
}

/**
 * ask question for a field creation
 */
function askForField(done) {
    const context = this.context;
    this.log(chalk.green(`\nGenerating field #${context.fields.length + 1}\n`));
    const skipServer = context.skipServer;
    const prodDatabaseType = context.prodDatabaseType;
    const databaseType = context.databaseType;
    const fieldNamesUnderscored = context.fieldNamesUnderscored;
    const prompts = [
        {
            type: 'confirm',
            name: 'fieldAdd',
            message: 'Do you want to add a field to your entity?',
            default: true
        },
        {
            when: response => response.fieldAdd === true,
            type: 'input',
            name: 'fieldName',
            validate: (input) => {
                if (!(/^([a-zA-Z0-9_]*)$/.test(input))) {
                    return 'Your field name cannot contain special characters';
                } if (input === '') {
                    return 'Your field name cannot be empty';
                } if (input.charAt(0) === input.charAt(0).toUpperCase()) {
                    return 'Your field name cannot start with an upper case letter';
                } if (input === 'id' || fieldNamesUnderscored.indexOf(_.snakeCase(input)) !== -1) {
                    return 'Your field name cannot use an already existing field name';
                } if (!skipServer && jhiCore.isReservedFieldName(input)) {
                    return 'Your field name cannot contain a Java or Angular reserved keyword';
                } if (prodDatabaseType === 'oracle' && input.length > 30) {
                    return 'The field name cannot be of more than 30 characters';
                }
                return true;
            },
            message: 'What is the name of your field?'
        },
        {
            when: response => response.fieldAdd === true && (skipServer || databaseType === 'sql' || databaseType === 'mongodb' || databaseType === 'couchbase'),
            type: 'list',
            name: 'fieldType',
            message: 'What is the type of your field?',
            choices: [
                {
                    value: 'String',
                    name: 'String'
                },
                {
                    value: 'Integer',
                    name: 'Integer'
                },
                {
                    value: 'Long',
                    name: 'Long'
                },
                {
                    value: 'Float',
                    name: 'Float'
                },
                {
                    value: 'Double',
                    name: 'Double'
                },
                {
                    value: 'BigDecimal',
                    name: 'BigDecimal'
                },
                {
                    value: 'LocalDate',
                    name: 'LocalDate'
                },
                {
                    value: 'Instant',
                    name: 'Instant'
                },
                {
                    value: 'ZonedDateTime',
                    name: 'ZonedDateTime'
                },
                {
                    value: 'Boolean',
                    name: 'Boolean'
                },
                {
                    value: 'enum',
                    name: 'Enumeration (Java enum type)'
                },
                {
                    value: 'byte[]',
                    name: '[BETA] Blob'
                }
            ],
            default: 0
        },
        {
            when: (response) => {
                if (response.fieldType === 'enum') {
                    response.fieldIsEnum = true;
                    return true;
                }
                response.fieldIsEnum = false;
                return false;
            },
            type: 'input',
            name: 'fieldType',
            validate: (input) => {
                if (input === '') {
                    return 'Your class name cannot be empty.';
                } if (jhiCore.isReservedKeyword(input, 'JAVA')) {
                    return 'Your enum name cannot contain a Java reserved keyword';
                }
                if (context.enums.indexOf(input) !== -1) {
                    context.existingEnum = true;
                } else {
                    context.enums.push(input);
                }
                return true;
            },
            message: 'What is the class name of your enumeration?'
        },
        {
            when: response => response.fieldIsEnum,
            type: 'input',
            name: 'fieldValues',
            validate: (input) => {
                if (input === '' && context.existingEnum) {
                    context.existingEnum = false;
                    return true;
                }
                if (input === '') {
                    return 'You must specify values for your enumeration';
                }
                if (!/^[A-Za-z0-9_,\s]*$/.test(input)) {
                    return 'Enum values cannot contain special characters (allowed characters: A-Z, a-z, 0-9 and _)';
                }
                const enums = input.replace(/\s/g, '').split(',');
                if (_.uniq(enums).length !== enums.length) {
                    return `Enum values cannot contain duplicates (typed values: ${input})`;
                }
                for (let i = 0; i < enums.length; i++) {
                    if (/^[0-9].*/.test(enums[i])) {
                        return `Enum value "${enums[i]}" cannot start with a number`;
                    }
                    if (enums[i] === '') {
                        return 'Enum value cannot be empty (did you accidentally type "," twice in a row?)';
                    }
                }

                return true;
            },
            message: (answers) => {
                if (!context.existingEnum) {
                    return 'What are the values of your enumeration (separated by comma)?';
                }
                return 'What are the new values of your enumeration (separated by comma)?\nThe new values will replace the old ones.\nNothing will be done if there are no new values.';
            }
        },
        {
            when: response => response.fieldAdd === true && databaseType === 'cassandra',
            type: 'list',
            name: 'fieldType',
            message: 'What is the type of your field?',
            choices: [
                {
                    value: 'UUID',
                    name: 'UUID'
                },
                {
                    value: 'String',
                    name: 'String'
                },
                {
                    value: 'Integer',
                    name: 'Integer'
                },
                {
                    value: 'Long',
                    name: 'Long'
                },
                {
                    value: 'Float',
                    name: 'Float'
                },
                {
                    value: 'Double',
                    name: 'Double'
                },
                {
                    value: 'BigDecimal',
                    name: 'BigDecimal'
                },
                {
                    value: 'LocalDate',
                    name: 'LocalDate (Warning: only compatible with Cassandra v3)'
                },
                {
                    value: 'Instant',
                    name: 'Instant'
                },
                {
                    value: 'ZonedDateTime',
                    name: 'ZonedDateTime'
                },
                {
                    value: 'Boolean',
                    name: 'Boolean'
                },
                {
                    value: 'ByteBuffer',
                    name: '[BETA] blob'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true && response.fieldType === 'byte[]',
            type: 'list',
            name: 'fieldTypeBlobContent',
            message: 'What is the content of the Blob field?',
            choices: [
                {
                    value: 'image',
                    name: 'An image'
                },
                {
                    value: 'any',
                    name: 'A binary file'
                },
                {
                    value: 'text',
                    name: 'A CLOB (Text field)'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true && response.fieldType === 'ByteBuffer',
            type: 'list',
            name: 'fieldTypeBlobContent',
            message: 'What is the content of the Blob field?',
            choices: [
                {
                    value: 'image',
                    name: 'An image'
                },
                {
                    value: 'any',
                    name: 'A binary file'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true,
            type: 'confirm',
            name: 'fieldValidate',
            message: 'Do you want to add validation rules to your field?',
            default: false
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && (response.fieldType === 'String'
                    || response.fieldTypeBlobContent === 'text'),
            type: 'checkbox',
            name: 'fieldValidateRules',
            message: 'Which validation rules do you want to add?',
            choices: [
                {
                    name: 'Required',
                    value: 'required'
                },
                {
                    name: 'Minimum length',
                    value: 'minlength'
                },
                {
                    name: 'Maximum length',
                    value: 'maxlength'
                },
                {
                    name: 'Regular expression pattern',
                    value: 'pattern'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && (response.fieldType === 'Integer'
                    || response.fieldType === 'Long'
                    || response.fieldType === 'Float'
                    || response.fieldType === 'Double'
                    || response.fieldType === 'BigDecimal'),
            type: 'checkbox',
            name: 'fieldValidateRules',
            message: 'Which validation rules do you want to add?',
            choices: [
                {
                    name: 'Required',
                    value: 'required'
                },
                {
                    name: 'Minimum',
                    value: 'min'
                },
                {
                    name: 'Maximum',
                    value: 'max'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldType === 'byte[]'
                    && response.fieldTypeBlobContent !== 'text',
            type: 'checkbox',
            name: 'fieldValidateRules',
            message: 'Which validation rules do you want to add?',
            choices: [
                {
                    name: 'Required',
                    value: 'required'
                },
                {
                    name: 'Minimum byte size',
                    value: 'minbytes'
                },
                {
                    name: 'Maximum byte size',
                    value: 'maxbytes'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && (response.fieldType === 'LocalDate'
                    || response.fieldType === 'Instant'
                    || response.fieldType === 'ZonedDateTime'
                    || response.fieldType === 'UUID'
                    || response.fieldType === 'Boolean'
                    || response.fieldType === 'ByteBuffer'
                    || response.fieldIsEnum === true),
            type: 'checkbox',
            name: 'fieldValidateRules',
            message: 'Which validation rules do you want to add?',
            choices: [
                {
                    name: 'Required',
                    value: 'required'
                }
            ],
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('minlength') !== -1,
            type: 'input',
            name: 'fieldValidateRulesMinlength',
            validate: input => (this.isNumber(input) ? true : 'Minimum length must be a positive number'),
            message: 'What is the minimum length of your field?',
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('maxlength') !== -1,
            type: 'input',
            name: 'fieldValidateRulesMaxlength',
            validate: input => (this.isNumber(input) ? true : 'Maximum length must be a positive number'),
            message: 'What is the maximum length of your field?',
            default: 20
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('min') !== -1
                    && (response.fieldType === 'Integer'
                    || response.fieldType === 'Long'),
            type: 'input',
            name: 'fieldValidateRulesMin',
            message: 'What is the minimum of your field?',
            validate: input => (this.isSignedNumber(input) ? true : 'Minimum must be a number'),
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('max') !== -1
                    && (response.fieldType === 'Integer'
                    || response.fieldType === 'Long'),
            type: 'input',
            name: 'fieldValidateRulesMax',
            message: 'What is the maximum of your field?',
            validate: input => (this.isSignedNumber(input) ? true : 'Maximum must be a number'),
            default: 100
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('min') !== -1
                    && (response.fieldType === 'Float'
                    || response.fieldType === 'Double'
                    || response.fieldType === 'BigDecimal'),
            type: 'input',
            name: 'fieldValidateRulesMin',
            message: 'What is the minimum of your field?',
            validate: input => (this.isSignedDecimalNumber(input, true) ? true : 'Minimum must be a decimal number'),
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('max') !== -1
                    && (response.fieldType === 'Float'
                    || response.fieldType === 'Double'
                    || response.fieldType === 'BigDecimal'),
            type: 'input',
            name: 'fieldValidateRulesMax',
            message: 'What is the maximum of your field?',
            validate: input => (this.isSignedDecimalNumber(input, true) ? true : 'Maximum must be a decimal number'),
            default: 100
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('minbytes') !== -1
                    && response.fieldType === 'byte[]'
                    && response.fieldTypeBlobContent !== 'text',
            type: 'input',
            name: 'fieldValidateRulesMinbytes',
            message: 'What is the minimum byte size of your field?',
            validate: input => (this.isNumber(input) ? true : 'Minimum byte size must be a positive number'),
            default: 0
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('maxbytes') !== -1
                    && response.fieldType === 'byte[]'
                    && response.fieldTypeBlobContent !== 'text',
            type: 'input',
            name: 'fieldValidateRulesMaxbytes',
            message: 'What is the maximum byte size of your field?',
            validate: input => (this.isNumber(input) ? true : 'Maximum byte size must be a positive number'),
            default: 5000000
        },
        {
            when: response => response.fieldAdd === true
                    && response.fieldValidate === true
                    && response.fieldValidateRules.indexOf('pattern') !== -1,
            type: 'input',
            name: 'fieldValidateRulesPattern',
            message: 'What is the regular expression pattern you want to apply on your field?',
            default: '^[a-zA-Z0-9]*$'
        }
    ];
    this.prompt(prompts).then((props) => {
        if (props.fieldAdd) {
            if (props.fieldIsEnum) {
                props.fieldType = _.upperFirst(props.fieldType);
            }

            const field = {
                fieldName: props.fieldName,
                fieldType: props.fieldType,
                fieldTypeBlobContent: props.fieldTypeBlobContent,
                fieldValues: props.fieldValues,
                fieldValidateRules: props.fieldValidateRules,
                fieldValidateRulesMinlength: props.fieldValidateRulesMinlength,
                fieldValidateRulesMaxlength: props.fieldValidateRulesMaxlength,
                fieldValidateRulesPattern: props.fieldValidateRulesPattern,
                fieldValidateRulesMin: props.fieldValidateRulesMin,
                fieldValidateRulesMax: props.fieldValidateRulesMax,
                fieldValidateRulesMinbytes: props.fieldValidateRulesMinbytes,
                fieldValidateRulesMaxbytes: props.fieldValidateRulesMaxbytes
            };

            fieldNamesUnderscored.push(_.snakeCase(props.fieldName));
            context.fields.push(field);
        }
        logFieldsAndRelationships.call(this);
        if (props.fieldAdd) {
            askForField.call(this, done);
        } else {
            done();
        }
    });
}

/**
 * ask question for a relationship creation
 */
function askForRelationship(done) {
    const context = this.context;
    const name = context.name;
    this.log(chalk.green('\nGenerating relationships to other entities\n'));
    const fieldNamesUnderscored = context.fieldNamesUnderscored;
    const prompts = [
        {
            type: 'confirm',
            name: 'relationshipAdd',
            message: 'Do you want to add a relationship to another entity?',
            default: true
        },
        {
            when: response => response.relationshipAdd === true,
            type: 'input',
            name: 'otherEntityName',
            validate: (input) => {
                if (!(/^([a-zA-Z0-9_]*)$/.test(input))) {
                    return 'Your other entity name cannot contain special characters';
                } if (input === '') {
                    return 'Your other entity name cannot be empty';
                } if (jhiCore.isReservedKeyword(input, 'JAVA')) {
                    return 'Your other entity name cannot contain a Java reserved keyword';
                } if ((input.toLowerCase() === 'user') && (context.applicationType === 'backend')) {
                    return 'Your entity cannot have a relationship with User because it\'s a gateway entity';
                }
                return true;
            },
            message: 'What is the name of the other entity?'
        },
        {
            when: response => response.relationshipAdd === true,
            type: 'input',
            name: 'relationshipName',
            validate: (input) => {
                if (!(/^([a-zA-Z0-9_]*)$/.test(input))) {
                    return 'Your relationship cannot contain special characters';
                } if (input === '') {
                    return 'Your relationship cannot be empty';
                } if (input.charAt(0) === input.charAt(0).toUpperCase()) {
                    return 'Your relationship cannot start with an upper case letter';
                } if (input === 'id' || fieldNamesUnderscored.indexOf(_.snakeCase(input)) !== -1) {
                    return 'Your relationship cannot use an already existing field name';
                } if (jhiCore.isReservedKeyword(input, 'JAVA')) {
                    return 'Your relationship cannot contain a Java reserved keyword';
                }
                return true;
            },
            message: 'What is the name of the relationship?',
            default: response => _.lowerFirst(response.otherEntityName)
        },
        {
            when: response => response.relationshipAdd === true && response.otherEntityName.toLowerCase() !== 'user',
            type: 'list',
            name: 'relationshipType',
            message: 'What is the type of the relationship?',
            choices: [
                {
                    value: 'one-to-many',
                    name: 'one-to-many'
                },
                {
                    value: 'many-to-one',
                    name: 'many-to-one'
                },
                {
                    value: 'many-to-many',
                    name: 'many-to-many'
                },
                {
                    value: 'one-to-one',
                    name: 'one-to-one'
                }
            ],
            default: 0
        },
        {
            when: response => response.relationshipAdd === true && response.otherEntityName.toLowerCase() === 'user',
            type: 'list',
            name: 'relationshipType',
            message: 'What is the type of the relationship?',
            choices: [
                {
                    value: 'many-to-one',
                    name: 'many-to-one'
                },
                {
                    value: 'many-to-many',
                    name: 'many-to-many'
                },
                {
                    value: 'one-to-one',
                    name: 'one-to-one'
                }
            ],
            default: 0
        },
        {
            when: response => (response.relationshipAdd === true && response.otherEntityName.toLowerCase() !== 'user'
                && (response.relationshipType === 'many-to-many' || response.relationshipType === 'one-to-one')),
            type: 'confirm',
            name: 'ownerSide',
            message: 'Is this entity the owner of the relationship?',
            default: false
        },
        {
            when: response => (response.relationshipAdd === true && (response.relationshipType === 'one-to-many'
                || ((response.relationshipType === 'many-to-many'
                || response.relationshipType === 'one-to-one') && response.otherEntityName.toLowerCase() !== 'user'))),
            type: 'input',
            name: 'otherEntityRelationshipName',
            message: 'What is the name of this relationship in the other entity?',
            default: response => _.lowerFirst(name)
        },
        {
            when: response => (response.relationshipAdd === true && (response.relationshipType === 'many-to-one'
                || (response.relationshipType === 'many-to-many' && response.ownerSide === true)
                || (response.relationshipType === 'one-to-one' && response.ownerSide === true))),
            type: 'input',
            name: 'otherEntityField',
            message: response => `When you display this relationship with Angular, which field from '${response.otherEntityName}' do you want to use? This field will be displayed as a String, so it cannot be a Blob`,
            default: 'id'
        },
        {
            when: response => (response.relationshipAdd === true && (response.relationshipType === 'many-to-one'
                || (response.relationshipType === 'many-to-many' && (response.ownerSide === true || response.otherEntityName.toLowerCase() === 'user'))
                || (response.relationshipType === 'one-to-one' && (response.ownerSide === true || response.otherEntityName.toLowerCase() === 'user')))),
            type: 'confirm',
            name: 'relationshipValidate',
            message: 'Do you want to add any validation rules to this relationship?',
            default: false
        },
        {
            when: response => response.relationshipValidate === true,
            type: 'checkbox',
            name: 'relationshipValidateRules',
            message: 'Which validation rules do you want to add?',
            choices: [
                {
                    name: 'Required',
                    value: 'required'
                }
            ],
            default: 0
        }
    ];
    this.prompt(prompts).then((props) => {
        if (props.relationshipAdd) {
            const relationship = {
                relationshipName: props.relationshipName,
                otherEntityName: _.lowerFirst(props.otherEntityName),
                relationshipType: props.relationshipType,
                relationshipValidateRules: props.relationshipValidateRules,
                otherEntityField: props.otherEntityField,
                ownerSide: props.ownerSide,
                otherEntityRelationshipName: props.otherEntityRelationshipName
            };

            if (props.otherEntityName.toLowerCase() === 'user') {
                relationship.ownerSide = true;
                relationship.otherEntityField = 'login';
                relationship.otherEntityRelationshipName = _.lowerFirst(name);
            }

            fieldNamesUnderscored.push(_.snakeCase(props.relationshipName));
            context.relationships.push(relationship);
        }
        logFieldsAndRelationships.call(this);
        if (props.relationshipAdd) {
            askForRelationship.call(this, done);
        } else {
            this.log('\n');
            done();
        }
    });
}

/**
 * Show the entity and it's fields and relationships in console
 */
function logFieldsAndRelationships() {
    const context = this.context;
    if (context.fields.length > 0 || context.relationships.length > 0) {
        this.log(chalk.red(chalk.white('\n================= ') + context.entityNameCapitalized + chalk.white(' =================')));
    }
    if (context.fields.length > 0) {
        this.log(chalk.white('Fields'));
        context.fields.forEach((field) => {
            let validationDetails = '';
            const fieldValidate = _.isArray(field.fieldValidateRules) && field.fieldValidateRules.length >= 1;
            if (fieldValidate === true) {
                if (field.fieldValidateRules.indexOf('required') !== -1) {
                    validationDetails = 'required ';
                }
                if (field.fieldValidateRules.indexOf('minlength') !== -1) {
                    validationDetails += `minlength='${field.fieldValidateRulesMinlength}' `;
                }
                if (field.fieldValidateRules.indexOf('maxlength') !== -1) {
                    validationDetails += `maxlength='${field.fieldValidateRulesMaxlength}' `;
                }
                if (field.fieldValidateRules.indexOf('pattern') !== -1) {
                    validationDetails += `pattern='${field.fieldValidateRulesPattern}' `;
                }
                if (field.fieldValidateRules.indexOf('min') !== -1) {
                    validationDetails += `min='${field.fieldValidateRulesMin}' `;
                }
                if (field.fieldValidateRules.indexOf('max') !== -1) {
                    validationDetails += `max='${field.fieldValidateRulesMax}' `;
                }
                if (field.fieldValidateRules.indexOf('minbytes') !== -1) {
                    validationDetails += `minbytes='${field.fieldValidateRulesMinbytes}' `;
                }
                if (field.fieldValidateRules.indexOf('maxbytes') !== -1) {
                    validationDetails += `maxbytes='${field.fieldValidateRulesMaxbytes}' `;
                }
            }
            this.log(chalk.red(field.fieldName) + chalk.white(` (${field.fieldType}${field.fieldTypeBlobContent ? ` ${field.fieldTypeBlobContent}` : ''}) `) + chalk.cyan(validationDetails));
        });
        this.log();
    }
    if (context.relationships.length > 0) {
        this.log(chalk.white('Relationships'));
        context.relationships.forEach((relationship) => {
            let validationDetails = '';
            if (relationship.relationshipValidateRules && relationship.relationshipValidateRules.indexOf('required') !== -1) {
                validationDetails = 'required ';
            }
            this.log(`${chalk.red(relationship.relationshipName)} ${chalk.white(`(${_.upperFirst(relationship.otherEntityName)})`)} ${chalk.cyan(relationship.relationshipType)} ${chalk.cyan(validationDetails)}`);
        });
        this.log();
    }
}
