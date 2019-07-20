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
const _ = require('lodash');

const FLUTTER_DIR = 'lib/pages/';

const CLIENT_FLUTTER_TEMPLATES_DIR = 'flutter';

/**
 * The default is to use a file path string. It implies use of the template method.
 * For any other config an object { file:.., method:.., template:.. } can be used
 */

const flutterFiles = {
    client: [
        {
            path: FLUTTER_DIR,
            templates: [
                {
                    file: 'entity',
                    renameTo: generator => `../models/${generator.entityFileName}.dart`
                },
                {
                    file: 'entity.list',
                    renameTo: generator => `${generator.entityFolderName}/${generator.entityFileName}.list.dart`
                },
                {
                    file: 'entity.detail',
                    renameTo: generator => `${generator.entityFolderName}/${generator.entityFileName}.detail.dart`
                },
                {
                    file: 'entity.form',
                    renameTo: generator => `${generator.entityFolderName}/${generator.entityFileName}.form.dart`
                },
                {
                    file: 'entity.helper',
                    renameTo: generator => `../services/entity_services/${generator.entityFileName}.service.dart`
                },
                /*  {
                    file: 'index',
                    renameTo: generator => `entities/${generator.entityFolderName}/index.dart`
                }, */
            ]
        }
    ]
    // todo: add tests
};

module.exports = {
    writeFiles,
    flutterFiles
};

function writeFiles() {
    return {
        /* saveRemoteEntityPath() {
            if (_.isUndefined(this.microservicePath)) {
                return;
            }
            this.copy(`${this.microservicePath}/${this.jhipsterConfigDirectory}/${this.entityNameCapitalized}.json`, this.destinationPath(`${this.jhipsterConfigDirectory}/${this.entityNameCapitalized}.json`));
        }, */

        writeClientFiles() {
            if (this.skipClient) return;

            // write client side files for angular
            this.writeFilesToDisk(flutterFiles, this, false, CLIENT_FLUTTER_TEMPLATES_DIR);
            this.addEntityToRoute(this.entityInstance, this.entityClass, this.entityAngularName, this.entityFolderName, this.entityFileName, this.enableTranslation);
            this.addEntityToDrawer(this.entityInstance, this.entityClass, this.entityAngularName, this.entityFolderName, this.entityFileName, this.enableTranslation);
           
            // Copy for each
            if (this.enableTranslation) {
                const languages = this.languages || this.getAllInstalledLanguages();
                languages.forEach((language) => {
                    // this.copyI18n(language, CLIENT_I18N_TEMPLATES_DIR);
                });
            }
        }
    };
}
