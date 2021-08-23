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
/* eslint-disable consistent-return */
const chalk = require('chalk');
const utils = require('generator-jhipster/generators/utils');
const BaseGenerator = require('generator-jhipster/generators/generator-base');
const writeFiles = require('./files').writeFiles;

let useBlueprint;

module.exports = class extends BaseGenerator {

    constructor(args, opts) {
        super(args, opts);
        utils.copyObjectProps(this, this.options.context);
        //const blueprint = this.config.get('blueprint');
        
        this.appsName = this.config.get('appsName');
        console.log('--------construct entity-mobx-------')
        console.log(this.opts)
        console.log(this.args)
        console.log(this.config)
        console.log(this.options)
        console.log(this.context)
        // useBlueprint = this.composeBlueprint(blueprint, 'entity'); // use global variable since getters dont have access to instance property
    }

    get writing() {
        console.log('--------writing-------')
        if (useBlueprint) return;
        return writeFiles();
    }

    end() {
        console.log('--------end-------')
        if (useBlueprint) return;
        this.log(chalk.bold.green('Entity generation completed. You may need to click "r" or "R" in your terminal to see your changes on your apps.'));
    }

    /**
     * Add a new entity in the TS modules file.
     *
     * @param {string} entityInstance - Entity Instance
     * @param {string} entityClass - Entity Class
     * @param {string} entityFolderName - Entity Folder Name
     * @param {string} entityFileName - Entity File Name
     * @param {boolean} enableTranslation - If translations are enabled or not
     */
    addEntityToModule(entityInstance, entityClass, entityFolderName, entityFileName, enableTranslation) {
        // workaround method being called on initialization
        console.log('--------addEntityToModule-------')
        console.log(entityInstance)
        console.log(entityClass)
        console.log(entityFolderName)
        if (!entityClass) {
            return;
        }
        const registerPath = 'lib/modules/register_modules.dart';
        try {
            const page = `import '${entityInstance}/${entityInstance}_module.dart';`;
            utils.rewriteFile({
                file: registerPath,
                needle: 'kutilang-needle-import-module',
                splicable: [
                    this.stripMargin(page)
                ]
            }, this);

            const page2 = `${entityClass}Module(),`;
            utils.rewriteFile({
                file: registerPath,
                needle: 'kutilang-needle-add-module',
                splicable: [
                    this.stripMargin(page2)
                ]
            }, this);
        } catch (e) {
            this.log(`${chalk.yellow('\nUnable to find ') + registerPath + chalk.yellow(' or missing required kutilang-needle. Reference to ') + entityClass} ${chalk.yellow(`not added to ${registerPath}.\n`)}`);
            this.debug('Error:', e);
        }
    }

    /**
     * Generate Entity Queries for Flutter Providers
     *
     * @param {Array|Object} relationships - array of relationships
     * @param {string} entityInstance - entity instance
     * @param {string} dto - dto
     * @returns {{queries: Array, variables: Array, hasManyToMany: boolean}}
     */
    generateEntityQueries(relationships, entityInstance, dto) {
        console.log('--------generateEntityQueries-------')
        console.log(relationships)
        console.log(entityInstance)
        // workaround method being called on initialization
        if (!relationships) {
            return;
        }
        const queries = [];
        const variables = [];
        let hasManyToMany = false;
        relationships.forEach((relationship) => {
            let query;
            let variableName;
            hasManyToMany = hasManyToMany || relationship.relationshipType === 'many-to-many';
            if (relationship.relationshipType === 'one-to-one' && relationship.ownerSide === true && relationship.otherEntityName !== 'user') {
                variableName = relationship.relationshipFieldNamePlural.toLowerCase();
                if (variableName === entityInstance) {
                    variableName += 'Collection';
                }
                const relationshipFieldName = `this.${entityInstance}.${relationship.relationshipFieldName}`;
                const relationshipFieldNameIdCheck = dto === 'no'
                    ? `!${relationshipFieldName} || !${relationshipFieldName}.id`
                    : `!${relationshipFieldName}Id`;

                query = `this.${relationship.otherEntityName}Service
            .query({filter: '${relationship.otherEntityRelationshipName.toLowerCase()}-is-null'})
            .subscribe(data => {
                if (${relationshipFieldNameIdCheck}) {
                    this.${variableName} = data;
                } else {
                    this.${relationship.otherEntityName}Service
                        .find(${relationshipFieldName}${dto === 'no' ? '.id' : 'Id'})
                        .subscribe((subData: ${relationship.otherentityClass}) => {
                            this.${variableName} = [subData].concat(subData);
                        }, (error) => this.onError(error));
                }
            }, (error) => this.onError(error));`;
            } else if (relationship.relationshipType !== 'one-to-many') {
                variableName = relationship.otherEntityNameCapitalizedPlural.toLowerCase();
                if (variableName === entityInstance) {
                    variableName += 'Collection';
                }
                query = `this.${relationship.otherEntityName}Service.query()
            .subscribe(data => { this.${variableName} = data; }, (error) => this.onError(error));`;
            }
            if (variableName && !this.contains(queries, query)) {
                queries.push(query);
                variables.push(`${variableName}: ${relationship.otherentityClass}[];`);
            }
        });
        return {
            queries,
            variables,
            hasManyToMany
        };
    }
};
