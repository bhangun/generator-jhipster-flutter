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
            this.template(`gitignore`, `${this.packageFolder}/.gitignore`);
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
            this.template(`${flutterDir}assets/icons/ic_launcher.png`, `${this.packageFolder}/assets/images/ic_launcher.png`);
            this.template(`${flutterDir}assets/icons/logo_jh.svg`, `${this.packageFolder}/assets/icons/logo_jh.svg`);
            this.template(`${flutterDir}assets/icons/logo-jhipster.svg`, `${this.packageFolder}/assets/icons/logo-jhipster.svg`);

            // Bloc
            this.template(`${flutterDir}lib/bloc/alert/alert_bloc.dart`, `${this.packageFolder}/lib/bloc/alert/alert_bloc.dart`);
            this.template(`${flutterDir}lib/bloc/app/app_bloc.dart`, `${this.packageFolder}/lib/bloc/app/app_bloc.dart`);
            this.template(`${flutterDir}lib/bloc/authentication/authentication_bloc.dart`, `${this.packageFolder}/lib/bloc/authentication/authentication_bloc.dart`);
              
            // Model
            this.template(`${flutterDir}lib/models/app_data.dart`, `${this.packageFolder}/lib/models/app_data.dart`);
            
            // Model
            this.template(`${flutterDir}lib/generated/i18n.dart`, `${this.packageFolder}/lib/generated/i18n.dart`);
            
            // Modules
            this.template(`${flutterDir}lib/modules/account/bloc/user/user_bloc.dart`, `${this.packageFolder}/lib/modules/account/bloc/user/user_bloc.dart`);
            
            this.template(`${flutterDir}lib/modules/account/models/user_model.dart`, `${this.packageFolder}/lib/modules/account/models/user_model.dart`);
            this.template(`${flutterDir}lib/modules/account/models/user_profile.dart`, `${this.packageFolder}/lib/modules/account/models/user_profile.dart`);
            
            this.template(`${flutterDir}lib/modules/account/services/user_services.dart`, `${this.packageFolder}/lib/modules/account/services/user_services.dart`);
            
            this.template(`${flutterDir}lib/modules/account/views/user_detail.dart`, `${this.packageFolder}/lib/modules/account/views/user_detail.dart`);
            this.template(`${flutterDir}lib/modules/account/views/user_form.dart`, `${this.packageFolder}/lib/modules/account/views/user_form.dart`);
            this.template(`${flutterDir}lib/modules/account/views/user_list.dart`, `${this.packageFolder}/lib/modules/account/views/user_list.dart`);

            this.template(`${flutterDir}lib/modules/administration/metrics_model.dart`, `${this.packageFolder}/lib/modules/administration/metrics_model.dart`);

            // Services
            this.template(`${flutterDir}lib/services/encryption/xxtea.dart`, `${this.packageFolder}/lib/services/encryption/xxtea.dart`);
            
            this.template(`${flutterDir}lib/services/local/app_database.dart`, `${this.packageFolder}/lib/services/local/app_database.dart`);
            this.template(`${flutterDir}lib/services/local/app_datasource.dart`, `${this.packageFolder}/lib/services/local/app_datasource.dart`);
           
            this.template(`${flutterDir}lib/services/network/network_exceptions.dart`, `${this.packageFolder}/lib/services/network/network_exceptions.dart`);
            this.template(`${flutterDir}lib/services/network/rest_dio_services.dart`, `${this.packageFolder}/lib/services/network/rest_dio_services.dart`);
            this.template(`${flutterDir}lib/services/network/rest_http_services.dart`, `${this.packageFolder}/lib/services/network/rest_http_services.dart`);
            
            this.template(`${flutterDir}lib/services/config.dart`, `${this.packageFolder}/lib/services/config.dart`);
            this.template(`${flutterDir}lib/services/helper.dart`, `${this.packageFolder}/lib/services/helper.dart`);
            this.template(`${flutterDir}lib/services/locator.dart`, `${this.packageFolder}/lib/services/locator.dart`);
            this.template(`${flutterDir}lib/services/navigation.dart`, `${this.packageFolder}/lib/services/navigation.dart`);
            this.template(`${flutterDir}lib/services/routes.dart`, `${this.packageFolder}/lib/services/routes.dart`);
            this.template(`${flutterDir}lib/services/shared_preference_services.dart`, `${this.packageFolder}/lib/services/shared_preference_services.dart`);
            
            // Themes
            this.template(`${flutterDir}lib/themes/material_theme_colors.dart`, `${this.packageFolder}/lib/themes/material_theme_colors.dart`);
            this.template(`${flutterDir}lib/themes/theme_services.dart`, `${this.packageFolder}/lib/themes/theme_services.dart`);

            // Utils
            this.template(`${flutterDir}lib/utils/db_constants.dart`, `${this.packageFolder}/lib/utils/db_constants.dart`);
            this.template(`${flutterDir}lib/utils/dimens.dart`, `${this.packageFolder}/lib/utils/dimens.dart`);
            this.template(`${flutterDir}lib/utils/dio_error_util.dart`, `${this.packageFolder}/lib/utils/dio_error_util.dart`);
            this.template(`${flutterDir}lib/utils/endpoints.dart`, `${this.packageFolder}/lib/utils/endpoints.dart`);
            this.template(`${flutterDir}lib/utils/preferences.dart`, `${this.packageFolder}/lib/utils/preferences.dart`);
            this.template(`${flutterDir}lib/utils/strings.dart`, `${this.packageFolder}/lib/utils/strings.dart`);

            // Views
            this.template(`${flutterDir}lib/views/home.dart`, `${this.packageFolder}/lib/views/home.dart`);
            this.template(`${flutterDir}lib/views/login.dart`, `${this.packageFolder}/lib/views/login.dart`);
            this.template(`${flutterDir}lib/views/splash.dart`, `${this.packageFolder}/lib/views/splash.dart`);

            // Widgets
            this.template(`${flutterDir}lib/widgets/alert_widget.dart`, `${this.packageFolder}/lib/widgets/alert_widget.dart`);
            this.template(`${flutterDir}lib/widgets/app_icon_widget.dart`, `${this.packageFolder}/lib/widgets/app_icon_widget.dart`);
            this.template(`${flutterDir}lib/widgets/appbar_widget.dart`, `${this.packageFolder}/lib/widgets/appbar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/camera_display_widget.dart`, `${this.packageFolder}/lib/widgets/camera_display_widget.dart`);
            this.template(`${flutterDir}lib/widgets/drawer_widget.dart`, `${this.packageFolder}/lib/widgets/drawer_widget.dart`);
            this.template(`${flutterDir}lib/widgets/empty_app_bar_widget.dart`, `${this.packageFolder}/lib/widgets/empty_app_bar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/error_message_widget.dart`, `${this.packageFolder}/lib/widgets/error_message_widget.dart`);
            this.template(`${flutterDir}lib/widgets/global_methods.dart`, `${this.packageFolder}/lib/widgets/global_methods.dart`);
            this.template(`${flutterDir}lib/widgets/progress_indicator_widget.dart`, `${this.packageFolder}/lib/widgets/progress_indicator_widget.dart`);
            this.template(`${flutterDir}lib/widgets/rounded_button_widget.dart`, `${this.packageFolder}/lib/widgets/rounded_button_widget.dart`);
            this.template(`${flutterDir}lib/widgets/textfield_widget.dart`, `${this.packageFolder}/lib/widgets/textfield_widget.dart`);

            this.template(`${flutterDir}lib/main.dart`, `${this.packageFolder}/lib/main.dart`);

            this.template(`${flutterDir}res/values/strings_en.arb`, `${this.packageFolder}/res/values/strings_en.arb`);

            // test
            this.template(`${flutterDir}test/widget_test.dart`, `${this.packageFolder}/test/widget_test.dart`);
        }
    };
}
