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
            this.template(`${flutterDir}assets/fonts/Product-Sans-Bold-Italic.ttf`, `${this.packageFolder}/assets/fonts/Product-Sans-Bold-Italic.ttf`);
            // this.template(`${flutterDir}assets/fonts/Product-Sans-Bold.ttf`, `${this.packageFolder}/assets/fonts/Product-Sans-Bold.ttf`);
            this.template(`${flutterDir}assets/fonts/Product-Sans-Italic.ttf`, `${this.packageFolder}/assets/fonts/Product-Sans-Italic.ttf`);
            this.template(`${flutterDir}assets/fonts/Product-Sans-Regular.ttf`, `${this.packageFolder}/assets/fonts/Product-Sans-Regular.ttf`);
            this.template(`${flutterDir}assets/icons/ic_appicon.png`, `${this.packageFolder}/assets/icons/ic_appicon.png`);
            this.template(`${flutterDir}assets/icons/ic_launcher.png`, `${this.packageFolder}/assets/icons/ic_launcher.png`);
            // this.template(`${flutterDir}assets/images/img_login.jpg`, `${this.packageFolder}/assets/images/img_login.jpg`);
            // add source to lib folder
            this.template(`${flutterDir}lib/constants/db_constants.dart`, `${this.packageFolder}/lib/constants/db_constants.dart`);
            this.template(`${flutterDir}lib/constants/dimens.dart`, `${this.packageFolder}/lib/constants/dimens.dart`);
            this.template(`${flutterDir}lib/constants/endpoints.dart`, `${this.packageFolder}/lib/constants/endpoints.dart`);
            this.template(`${flutterDir}lib/constants/strings.dart`, `${this.packageFolder}/lib/constants/strings.dart`);
            
            // Model
            this.template(`${flutterDir}lib/models/app_data.dart`, `${this.packageFolder}/lib/models/app_data.dart.dart`);
            
            // Modules
            this.template(`${flutterDir}lib/modules/account/helper/account_helper.dart`, `${this.packageFolder}/lib/modules/account/helper/account_helper.dart`);
            this.template(`${flutterDir}lib/modules/account/models/user_model.dart`, `${this.packageFolder}/lib/modules/account/models/user_model.dart`);
            this.template(`${flutterDir}lib/modules/account/models/user_profile.dart`, `${this.packageFolder}/lib/modules/account/models/user_profile.dart`);
            
            this.template(`${flutterDir}lib/modules/account/stores/authentication/authentication_store.dart`, `${this.packageFolder}/lib/modules/account/stores/authentication/authentication_store.dart`);
            this.template(`${flutterDir}lib/modules/account/stores/authentication/authentication_store.g.dart`, `${this.packageFolder}/lib/modules/account/stores/authentication/authentication_store.g.dart`);
            this.template(`${flutterDir}lib/modules/account/stores/user/user_store.dart`, `${this.packageFolder}/lib/modules/account/stores/user/user_store.dart`);
            this.template(`${flutterDir}lib/modules/account/stores/user/user_store.g.dart`, `${this.packageFolder}/lib/modules/account/stores/user/user_store.g.dart`);

            this.template(`${flutterDir}lib/modules/account/views/user_detail.dart`, `${this.packageFolder}/lib/modules/account/views/user_detail.dart`);
            this.template(`${flutterDir}lib/modules/account/views/user_form.dart`, `${this.packageFolder}/lib/modules/account/views/user_form.dart`);
            this.template(`${flutterDir}lib/modules/account/views/user_list.dart`, `${this.packageFolder}/lib/modules/account/views/user_list.dart`);

            this.template(`${flutterDir}lib/modules/administration/metrics_model.dart`, `${this.packageFolder}/lib/modules/administration/metrics_model.dart`);

            // Services
            this.template(`${flutterDir}lib/services/dio/dio_error_util.dart`, `${this.packageFolder}/lib/services/dio/dio_error_util.dart`);
            this.template(`${flutterDir}lib/services/encryption/xxtea.dart`, `${this.packageFolder}/lib/services/encryption/xxtea.dart`);
            this.template(`${flutterDir}lib/services/local/app_database.dart`, `${this.packageFolder}/lib/services/local/app_database.dart`);
            this.template(`${flutterDir}lib/services/local/app_datasource.dart`, `${this.packageFolder}/lib/services/local/app_datasource.dart`);
            this.template(`${flutterDir}lib/services/network/connection.dart`, `${this.packageFolder}/lib/services/network/connection.dart`);
            this.template(`${flutterDir}lib/services/network/dio_client.dart`, `${this.packageFolder}/lib/services/network/dio_client.dart`);
            this.template(`${flutterDir}lib/services/network/network_exceptions.dart`, `${this.packageFolder}/lib/services/network/network_exceptions.dart`);
            this.template(`${flutterDir}lib/services/network/rest_client.dart`, `${this.packageFolder}/lib/services/network/rest_client.dart`);

            this.template(`${flutterDir}lib/services/sharedpref/preferences.dart`, `${this.packageFolder}/lib/services/sharedpref/preferences.dart`);
            this.template(`${flutterDir}lib/services/sharedpref/shared_preference_helper.dart`, `${this.packageFolder}/lib/services/sharedpref/shared_preference_helper.dart`);

            this.template(`${flutterDir}lib/services/config.dart`, `${this.packageFolder}/lib/services/config.dart`);
            this.template(`${flutterDir}lib/services/helper.dart`, `${this.packageFolder}/lib/services/helper.dart`);
            this.template(`${flutterDir}lib/services/locator.dart`, `${this.packageFolder}/lib/services/locator.dart`);
            this.template(`${flutterDir}lib/services/navigation.dart`, `${this.packageFolder}/lib/services/navigation.dart`);
            this.template(`${flutterDir}lib/services/routes.dart`, `${this.packageFolder}/lib/services/routes.dart`);

            // Stores
            this.template(`${flutterDir}lib/stores/alert/alert_store.dart`, `${this.packageFolder}/lib/stores/alert/alert_store.dart`);
            this.template(`${flutterDir}lib/stores/alert/alert_store.g.dart`, `${this.packageFolder}/lib/stores/alert/alert_store.g.dart`);
            
            this.template(`${flutterDir}lib/stores/app/app_store.dart`, `${this.packageFolder}/lib/stores/app/app_store.dart`);
            this.template(`${flutterDir}lib/stores/app/app_store.g.dart`, `${this.packageFolder}/lib/stores/app/app_store.g.dart`);

            this.template(`${flutterDir}lib/stores/error/error_store.dart`, `${this.packageFolder}/lib/stores/error/error_store.dart`);
            this.template(`${flutterDir}lib/stores/error/error_store.g.dart`, `${this.packageFolder}/lib/stores/error/error_store.g.dart`);

            this.template(`${flutterDir}lib/stores/home/home_store.dart`, `${this.packageFolder}/lib/stores/home/home_store.dart`);
            this.template(`${flutterDir}lib/stores/home/home_store.g.dart`, `${this.packageFolder}/lib/stores/home/home_store.g.dart`);

            // Themes
            this.template(`${flutterDir}lib/themes/dark_theme.dart`, `${this.packageFolder}/lib/themes/dark_theme.dart`);
            this.template(`${flutterDir}lib/themes/index.dart`, `${this.packageFolder}/lib/themes/index.dart`);
            this.template(`${flutterDir}lib/themes/light_theme.dart`, `${this.packageFolder}/lib/themes/light_theme.dart`);
            this.template(`${flutterDir}lib/themes/material_theme_colors.dart`, `${this.packageFolder}/lib/themes/material_theme_colors.dart`);
            this.template(`${flutterDir}lib/themes/simple_theme.dart`, `${this.packageFolder}/lib/themes/simple_theme.dart`);
            this.template(`${flutterDir}lib/themes/theme_service.dart`, `${this.packageFolder}/lib/themes/theme_service.dart`);

            // Widgets
            this.template(`${flutterDir}lib/widgets/alert_widget.dart`, `${this.packageFolder}/lib/widgets/alert_widget.dart`);
            this.template(`${flutterDir}lib/widgets/app_icon_widget.dart`, `${this.packageFolder}/lib/widgets/app_icon_widget.dart`);
            this.template(`${flutterDir}lib/widgets/appbar_widget.dart`, `${this.packageFolder}/lib/widgets/appbar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/drawer_widget.dart`, `${this.packageFolder}/lib/widgets/drawer_widget.dart`);
            this.template(`${flutterDir}lib/widgets/empty_app_bar_widget.dart`, `${this.packageFolder}/lib/widgets/empty_app_bar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/error_message_widget.dart`, `${this.packageFolder}/lib/widgets/error_message_widget.dart`);
            this.template(`${flutterDir}lib/widgets/global_methods.dart`, `${this.packageFolder}/lib/widgets/global_methods.dart`);
            this.template(`${flutterDir}lib/widgets/progress_indicator_widget.dart`, `${this.packageFolder}/lib/widgets/progress_indicator_widget.dart`);
            this.template(`${flutterDir}lib/widgets/rounded_button_widget.dart`, `${this.packageFolder}/lib/widgets/rounded_button_widget.dart`);
            this.template(`${flutterDir}lib/widgets/textfield_widget.dart`, `${this.packageFolder}/lib/widgets/textfield_widget.dart`);

            this.template(`${flutterDir}lib/gitignore`, `${this.packageFolder}/lib/.gitignore`);
            this.template(`${flutterDir}lib/main.dart`, `${this.packageFolder}/lib/main.dart`);

            this.template(`${flutterDir}res/values/strings_en.arb`, `${this.packageFolder}/res/values/strings_en.arb`);

            // test
            // this.template(`${flutterDir}test/widget_test.dart`, `${this.packageFolder}/test/widget_test.dart`);
        }
    };
}
