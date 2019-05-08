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
            this.template(`${flutterDir}assets/images/logo-jhipster.svg`, `${this.packageFolder}/assets/images/logo-jhipster.svg`);

            // add source to lib folder
            this.template(`${flutterDir}lib/administration/account/user.dart`, `${this.packageFolder}/lib/administration/account/user.dart`);
            this.template(`${flutterDir}lib/administration/account/user.detail.dart`, `${this.packageFolder}/lib/administration/account/user.detail.dart`);
            this.template(`${flutterDir}lib/administration/account/user.form.dart`, `${this.packageFolder}/lib/administration/account/user.form.dart`);
            this.template(`${flutterDir}lib/administration/account/user.helper.dart`, `${this.packageFolder}/lib/administration/account/user.helper.dart`);
            this.template(`${flutterDir}lib/administration/account/user.list.dart`, `${this.packageFolder}/lib/administration/account/user.list.dart`);
            this.template(`${flutterDir}lib/administration/account/user.register.dart`, `${this.packageFolder}/lib/administration/account/user.register.dart`);
            this.template(`${flutterDir}lib/administration/account.dart`, `${this.packageFolder}/lib/administration/account.dart`);
            this.template(`${flutterDir}lib/administration/dashboard.dart`, `${this.packageFolder}/lib/administration/dashboard.dart`);

            this.template(`${flutterDir}lib/generated/i18n.dart`, `${this.packageFolder}/lib/generated/i18n.dart`);

            this.template(`${flutterDir}lib/pages/entity/entity.dart`, `${this.packageFolder}/lib/pages/entity/entity.dart`);
            this.template(`${flutterDir}lib/pages/entity/entity.form.dart`, `${this.packageFolder}/lib/pages/entity/entity.form.dart`);
            this.template(`${flutterDir}lib/pages/home.dart`, `${this.packageFolder}/lib/pages/home.dart`);
            this.template(`${flutterDir}lib/pages/login.dart`, `${this.packageFolder}/lib/pages/login.dart`);

            this.template(`${flutterDir}lib/services/config.dart`, `${this.packageFolder}/lib/services/config.dart`);
            this.template(`${flutterDir}lib/services/connection.dart`, `${this.packageFolder}/lib/services/connection.dart`);
            this.template(`${flutterDir}lib/services/helper.dart`, `${this.packageFolder}/lib/services/helper.dart`);
            this.template(`${flutterDir}lib/services/routes.dart`, `${this.packageFolder}/lib/services/routes.dart`);
            this.template(`${flutterDir}lib/services/services.dart`, `${this.packageFolder}/lib/services/services.dart`);
            this.template(`${flutterDir}lib/services/common.dart`, `${this.packageFolder}/lib/services/common.dart`);

            this.template(`${flutterDir}lib/themes/default.theme.dart`, `${this.packageFolder}/lib/themes/default.theme.dart`);
            this.template(`${flutterDir}lib/widgets/drawer.dart`, `${this.packageFolder}/lib/widgets/drawer.dart`);
            this.template(`${flutterDir}lib/widgets/label_below_icon.dart`, `${this.packageFolder}/lib/widgets/label_below_icon.dart`);
            this.template(`${flutterDir}lib/widgets/logo_anim.dart`, `${this.packageFolder}/lib/widgets/logo_anim.dart`);
            this.template(`${flutterDir}lib/widgets/staggered.dart`, `${this.packageFolder}/lib/widgets/staggered.dart`);
            this.template(`${flutterDir}lib/widgets/widgets.dart`, `${this.packageFolder}/lib/widgets/widgets.dart`);

            this.template(`${flutterDir}lib/app.dart`, `${this.packageFolder}/lib/app.dart`);
            this.template(`${flutterDir}lib/main.dart`, `${this.packageFolder}/lib/main.dart`);

            // test
            // this.template(`${flutterDir}test/widget_test.dart`, `${this.packageFolder}/test/widget_test.dart`);
        }
    };
}
