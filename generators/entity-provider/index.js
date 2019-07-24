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
        const blueprint = this.config.get('blueprint');
        this.appsName = this.config.get('appsName');
        useBlueprint = this.composeBlueprint(blueprint, 'entity'); // use global variable since getters dont have access to instance property
    }

    get writing() {
        if (useBlueprint) return;
        return writeFiles();
    }

    end() {
        if (useBlueprint) return;
        this.log(chalk.bold.green('Entity generation completed. You may need to click "r" or "R" in your terminal to see your new entity.'));
    }


    /**
     * Add a new entity in the TS modules file.
     *
     * @param {string} entityInstance - Entity Instance
     * @param {string} entityClass - Entity Class
     * @param {string} entityClass - Entity Angular Name
     * @param {string} entityFolderName - Entity Folder Name
     * @param {string} entityFileName - Entity File Name
     * @param {boolean} enableTranslation - If translations are enabled or not
     */
    addEntityToRoute(entityInstance, entityClass, entityAngularName, entityFolderName, entityFileName, enableTranslation) {
        // workaround method being called on initialization
        if (!entityClass) {
            return;
        }

        const entityBlocPath = 'lib/main.dart';

        const entityPagePath = 'lib/services/routes.dart';

        const entityLocatorPath = 'lib/services/locator.dart';

        const entityDrawerPath = 'lib/widgets/drawer_widget.dart';
        try {
             //-----------
             const needleDrawer = `list.add(_listTitle("${entityClass}", context,Routes.${entityInstance}List));`;
             utils.rewriteFile({
                 file: entityDrawerPath,
                 needle: 'kutilang-needle-add-drawer',
                 splicable: [
                     this.stripMargin(needleDrawer)
                 ]
             }, this);

             //-----------
             const needleLocator1 = `import '../modules/${entityInstance}/services/${entityInstance}_services.dart';`;
             utils.rewriteFile({
                 file: entityLocatorPath,
                 needle: 'kutilang-needle-add-locator-import',
                 splicable: [
                     this.stripMargin(needleLocator1)
                 ]
             }, this);

            
            const needleLocator2 = `locator.registerLazySingleton(() => ${entityClass}Services());`;
            utils.rewriteFile({
                file: entityLocatorPath,
                needle: 'kutilang-needle-add-locator',
                splicable: [
                    this.stripMargin(needleLocator2)
                ]
            }, this);

            //-----------
            const needleBloc = `ChangeNotifierProvider(builder: (_) => ${entityClass}Bloc()),`;
            utils.rewriteFile({
                file: entityBlocPath,
                needle: 'kutilang-needle-add-bloc',
                splicable: [
                    this.stripMargin(needleBloc)
                ]
            }, this);

            //-----------
            const needleBlocImport = `import 'modules/${entityInstance}/bloc/${entityInstance}_bloc.dart';`;
            utils.rewriteFile({
                file: entityBlocPath,
                needle: 'kutilang-needle-add-bloc-import',
                splicable: [
                    this.stripMargin(needleBlocImport)
                ]
            }, this);

            const needleImport1 = `import '../modules/${entityInstance}/views/${entityInstance}_list.dart';`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-import-route',
                splicable: [
                    this.stripMargin(needleImport1)
                ]
            }, this);

            const needleImport2 = `import '../modules/${entityInstance}/views/${entityInstance}_detail.dart';`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-import-route',
                splicable: [
                    this.stripMargin(needleImport2)
                ]
            }, this);

            const needleImport3 = `import '../modules/${entityInstance}/views/${entityInstance}_form.dart';`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-import-route',
                splicable: [
                    this.stripMargin(needleImport3)
                ]
            }, this);

            //-----------
            const needleRoute1a = `static const String ${entityInstance}List = '/${entityInstance}List';`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-1',
                splicable: [
                    this.stripMargin(needleRoute1a)
                ]
            }, this);

            const needleRoute1b = `static const String ${entityInstance}Detail = '/${entityInstance}Detail';`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-1',
                splicable: [
                    this.stripMargin(needleRoute1b)
                ]
            }, this);

            const needleRoute1c = `static const String ${entityInstance}Form = '/${entityInstance}Form';`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-1',
                splicable: [
                    this.stripMargin(needleRoute1c)
                ]
            }, this);

            //-----------
            const needleRoute2a = `${entityInstance}List: (BuildContext context) => ${entityClass}List(),`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-2',
                splicable: [
                    this.stripMargin(needleRoute2a)
                ]
            }, this);

            const needleRoute2b = `${entityInstance}Detail: (BuildContext context) => ${entityClass}Detail(),`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-2',
                splicable: [
                    this.stripMargin(needleRoute2b)
                ]
            }, this);

            const needleRoute2c = `${entityInstance}Form: (BuildContext context) => ${entityClass}Form(),`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-2',
                splicable: [
                    this.stripMargin(needleRoute2c)
                ]
            }, this);

            //-----------
            const needleRoute3a = `case '/${entityInstance}List': return MaterialPageRoute(builder: (_) => ${entityClass}List());`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-3',
                splicable: [
                    this.stripMargin(needleRoute3a)
                ]
            }, this);

            const needleRoute3b = `case '/${entityInstance}Detail': return MaterialPageRoute(builder: (_) => ${entityClass}Detail());`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-3',
                splicable: [
                    this.stripMargin(needleRoute3b)
                ]
            }, this);

            const needleRoute3c = `case '/${entityInstance}Form': return MaterialPageRoute(builder: (_) => ${entityClass}Form());`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-route-3',
                splicable: [
                    this.stripMargin(needleRoute3c)
                ]
            }, this);
        } catch (e) {
            this.log(`${chalk.yellow('\nUnable to find ') + entityPagePath + chalk.yellow(' or missing required jhipster-needle. Reference to ') + entityClass} ${chalk.yellow(`not added to ${entityPagePath}.\n`)}`);
            this.debug('Error:', e);
        }
    }

    /**
     * Add a new entity in the TS modules file.
     *
     * @param {string} entityInstance - Entity Instance
     * @param {string} entityClass - Entity Class
     * @param {string} entityClass - Entity Angular Name
     * @param {string} entityFolderName - Entity Folder Name
     * @param {string} entityFileName - Entity File Name
     * @param {boolean} enableTranslation - If translations are enabled or not
     */
    addEntityToDrawer(entityInstance, entityClass, entityAngularName, entityFolderName, entityFileName, enableTranslation) {
        // workaround method being called on initialization
        if (!entityClass) {
            return;
        }
        const entityPagePath = 'lib/widgets/drawer.dart';
        try {
            const page2 = `list.add(_listTitle("${entityClass}", context,"/${entityInstance}"));`;
            utils.rewriteFile({
                file: entityPagePath,
                needle: 'kutilang-needle-add-drawer',
                splicable: [
                    this.stripMargin(page2)
                ]
            }, this);
        } catch (e) {
            this.log(`${chalk.yellow('\nUnable to find ') + entityPagePath + chalk.yellow(' or missing required jhipster-needle. Reference to ') + entityClass} ${chalk.yellow(`not added to ${entityPagePath}.\n`)}`);
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
