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
// const mkdirp = require('mkdirp');
// const cleanup = require('../cleanup');
const constants = require('../generator-constants');

module.exports = {
    writeFiles
};

let flutterDir;
// let flutterNewDir;
// let projectName;

function writeFiles() {
    return {
        setUpJavaDir() {
            flutterDir = `${constants.FLUTTER_TEMPLATE}`;
        },

        cleanupOldServerFiles() {
        // cleanup.cleanupOldServerFiles(this, flutterDir, this.testDir);
        },

        writeGlobalFiles() {
            this.template('pubspec.yaml', `${this.packageFolder}/pubspec.yaml`);
            this.template('README.md', `${this.packageFolder}/README.md`);
        },

        writeClientResourceFiles() {
            // add assets
            this.template(`${flutterDir}assets/logo-jhipster.svg`, `${this.packageFolder}/assets/logo-jhipster.svg`);

            this.template(`${flutterDir}assets/logo-jhipster.svg`,`entities/${generator.entityFolderName}/${generator.entityFileName}.dart`);

            // test
            // this.template(`${flutterDir}test/widget_test.dart`, `${this.packageFolder}/test/widget_test.dart`);
        }
    };
}
