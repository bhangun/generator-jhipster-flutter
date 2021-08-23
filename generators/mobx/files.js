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

function writeFiles(param) {
    console.log(param)
    const packageFolder = param.get('packageFolder')//this.packageFolder?this.config.get('appsName'):param.packageFolder

    console.log(this.packageFolder)
    console.log(packageFolder)
    return {
        setUpJavaDir() {
            flutterDir = `${constants.FLUTTER_TEMPLATE}`;
        },

        writeGlobalFiles() {
<<<<<<< HEAD
            this.template(`gitignore`, `${this.packageFolder}/.gitignore`);
            this.template('pubspec.yaml', `${this.packageFolder}/pubspec.yaml`);
            this.template('README.md', `${this.packageFolder}/README.md`);
            this.template('run_watcher', `${this.packageFolder}/run_watcher`);
            this.template('l10n.yaml', `${this.packageFolder}/l10n.yaml`);
=======
            this.template('pubspec.yaml', `${packageFolder}/pubspec.yaml`);
            this.template('README.md', `${packageFolder}/README.md`);
            this.template('run_watcher', `${packageFolder}/run_watcher`);
            this.template('l10n.yaml', `${packageFolder}/l10n.yaml`);
>>>>>>> b14931bc79abc260f5f3efd9d859c19331b3aa0b
        },

        writeClientResourceFiles() {
            // add assets
            this.template(`${flutterDir}assets/fonts/Product-Sans-Bold-Italic.ttf`, `${packageFolder}/assets/fonts/Product-Sans-Bold-Italic.ttf`);
            // this.template(`${flutterDir}assets/fonts/Product-Sans-Bold.ttf`, `${packageFolder}/assets/fonts/Product-Sans-Bold.ttf`);
            this.template(`${flutterDir}assets/fonts/Product-Sans-Italic.ttf`, `${packageFolder}/assets/fonts/Product-Sans-Italic.ttf`);
            this.template(`${flutterDir}assets/fonts/Product-Sans-Regular.ttf`, `${packageFolder}/assets/fonts/Product-Sans-Regular.ttf`);
            this.template(`${flutterDir}assets/icons/ic_appicon.png`, `${packageFolder}/assets/icons/ic_appicon.png`);
            this.template(`${flutterDir}assets/icons/ic_launcher.png`, `${packageFolder}/assets/icons/ic_launcher.png`);
            this.template(`${flutterDir}assets/icons/ic_launcher.png`, `${packageFolder}/assets/images/ic_launcher.png`);
            this.template(`${flutterDir}assets/icons/logo_jh.svg`, `${packageFolder}/assets/icons/logo_jh.svg`);
            this.template(`${flutterDir}assets/icons/logo-jhipster.svg`, `${packageFolder}/assets/icons/logo-jhipster.svg`);

            // Stores
            this.template(`${flutterDir}lib/store/alert/alert_store.dart`, `${packageFolder}/lib/store/alert/alert_store.dart`);
            this.template(`${flutterDir}lib/store/alert/alert_store.g.dart`, `${packageFolder}/lib/store/alert/alert_store.g.dart`);

            this.template(`${flutterDir}lib/store/app/app_store.dart`, `${packageFolder}/lib/store/app/app_store.dart`);
            this.template(`${flutterDir}lib/store/app/app_store.g.dart`, `${packageFolder}/lib/store/app/app_store.g.dart`);

            this.template(`${flutterDir}lib/store/auth/auth_store.dart`, `${packageFolder}/lib/store/auth/auth_store.dart`);
            this.template(`${flutterDir}lib/store/auth/auth_store.g.dart`, `${packageFolder}/lib/store/auth/auth_store.g.dart`);

            this.template(`${flutterDir}lib/store/settings/settings_store.dart`, `${packageFolder}/lib/store/settings/settings_store.dart`);
            this.template(`${flutterDir}lib/store/settings/settings_store.g.dart`, `${packageFolder}/lib/store/settings/settings_store.g.dart`);

            // Model
            this.template(`${flutterDir}lib/models/app_data.dart`, `${packageFolder}/lib/models/app_data.dart`);
            //this.template(`${flutterDir}lib/models/module.dart`, `${packageFolder}/lib/models/module.dart`);

            // Locale
            this.template(`${flutterDir}lib/l10n/app_en.arb`, `${packageFolder}/lib/l10n/app_en.arb`);
            this.template(`${flutterDir}lib/l10n/app_id.arb`, `${packageFolder}/lib/l10n/app_id.arb`);

            // Modules
            this.template(`${flutterDir}lib/modules/account/store/user_store.dart`, `${packageFolder}/lib/modules/account/store/user_store.dart`);
            this.template(`${flutterDir}lib/modules/account/store/user_store.g.dart`, `${packageFolder}/lib/modules/account/store/user_store.g.dart`);

            this.template(`${flutterDir}lib/modules/account/models/user_model.dart`, `${packageFolder}/lib/modules/account/models/user_model.dart`);
            this.template(`${flutterDir}lib/modules/account/models/user_profile.dart`, `${packageFolder}/lib/modules/account/models/user_profile.dart`);

            this.template(`${flutterDir}lib/modules/account/services/user_routes.dart`, `${packageFolder}/lib/modules/account/services/user_routes.dart`);
            this.template(`${flutterDir}lib/modules/account/services/user_services.dart`, `${packageFolder}/lib/modules/account/services/user_services.dart`);

            this.template(`${flutterDir}lib/modules/account/screens/user_detail.dart`, `${packageFolder}/lib/modules/account/screens/user_detail.dart`);
            this.template(`${flutterDir}lib/modules/account/screens/user_form.dart`, `${packageFolder}/lib/modules/account/screens/user_form.dart`);
            this.template(`${flutterDir}lib/modules/account/screens/user_list.dart`, `${packageFolder}/lib/modules/account/screens/user_list.dart`);

            this.template(`${flutterDir}lib/modules/administration/models/counter_model.dart`, `${packageFolder}/lib/modules/administration/models/counter_model.dart`);
            this.template(`${flutterDir}lib/modules/administration/models/data_model.dart`, `${packageFolder}/lib/modules/administration/models/data_model.dart`);
            this.template(`${flutterDir}lib/modules/administration/models/gauges_model.dart`, `${packageFolder}/lib/modules/administration/models/gauges_model.dart`);
            this.template(`${flutterDir}lib/modules/administration/models/health_model.dart`, `${packageFolder}/lib/modules/administration/models/health_model.dart`);
            this.template(`${flutterDir}lib/modules/administration/models/histogram_model.dart`, `${packageFolder}/lib/modules/administration/models/histogram_model.dart`);
            this.template(`${flutterDir}lib/modules/administration/models/meter_model.dart`, `${packageFolder}/lib/modules/administration/models/meter_model.dart`);
            this.template(`${flutterDir}lib/modules/administration/models/timer_model.dart`, `${packageFolder}/lib/modules/administration/models/timer_model.dart`);

            this.template(`${flutterDir}lib/modules/main_module.dart`, `${packageFolder}/lib/modules/main_module.dart`);
            this.template(`${flutterDir}lib/modules/register_modules.dart`, `${packageFolder}/lib/modules/register_modules.dart`);

            // Services
            this.template(`${flutterDir}lib/services/local/database_services.dart`, `${packageFolder}/lib/services/local/database_services.dart`);
            this.template(`${flutterDir}lib/services/local/database.dart`, `${packageFolder}/lib/services/local/database.dart`);
            this.template(`${flutterDir}lib/services/local/local_db_constants.dart`, `${packageFolder}/lib/services/local/local_db_constants.dart`);

            this.template(`${flutterDir}lib/services/network/rest_services.dart`, `${packageFolder}/lib/services/network/rest_services.dart`);
            this.template(`${flutterDir}lib/services/network/rest_error_util.dart`, `${packageFolder}/lib/services/network/rest_error_util.dart`);

            this.template(`${flutterDir}lib/services/apps_routes.dart`, `${packageFolder}/lib/services/apps_routes.dart`);
            this.template(`${flutterDir}lib/services/auth_jwt_services.dart`, `${packageFolder}/lib/services/auth_jwt_services.dart`);
            this.template(`${flutterDir}lib/services/navigation.dart`, `${packageFolder}/lib/services/navigation.dart`);
            this.template(`${flutterDir}lib/services/preferences_service.dart`, `${packageFolder}/lib/services/preferences_service.dart`);

            // Themes
            this.template(`${flutterDir}lib/utils/themes/material_theme_colors.dart`, `${packageFolder}/lib/utils/themes/material_theme_colors.dart`);
            this.template(`${flutterDir}lib/utils/themes/theme_services.dart`, `${packageFolder}/lib/utils/themes/theme_services.dart`);

            // Utils
            this.template(`${flutterDir}lib/utils/encryption/xxtea.dart`, `${packageFolder}/lib/utils/encryption/xxtea.dart`);

            this.template(`${flutterDir}lib/utils/modules/modules_registry.dart`, `${packageFolder}/lib/utils/modules/modules_registry.dart`);
            this.template(`${flutterDir}lib/utils/modules/modules.dart`, `${packageFolder}/lib/utils/modules/modules.dart`);
            this.template(`${flutterDir}lib/utils/modules/module.dart`, `${packageFolder}/lib/utils/modules/module.dart`);

            this.template(`${flutterDir}lib/utils/config.dart`, `${packageFolder}/lib/utils/config.dart`);
            this.template(`${flutterDir}lib/utils/dimens.dart`, `${packageFolder}/lib/utils/dimens.dart`);
            this.template(`${flutterDir}lib/utils/helper.dart`, `${packageFolder}/lib/utils/helper.dart`);
            this.template(`${flutterDir}lib/utils/routes.dart`, `${packageFolder}/lib/utils/routes.dart`);

            // Views
            this.template(`${flutterDir}lib/screens/about.dart`, `${packageFolder}/lib/screens/about.dart`);
            this.template(`${flutterDir}lib/screens/home.dart`, `${packageFolder}/lib/screens/home.dart`);
            this.template(`${flutterDir}lib/screens/login.dart`, `${packageFolder}/lib/screens/login.dart`);
            this.template(`${flutterDir}lib/screens/splash.dart`, `${packageFolder}/lib/screens/splash.dart`);

            // Widgets
            this.template(`${flutterDir}lib/widgets/alert_widget.dart`, `${packageFolder}/lib/widgets/alert_widget.dart`);
            this.template(`${flutterDir}lib/widgets/app_icon_widget.dart`, `${packageFolder}/lib/widgets/app_icon_widget.dart`);
            this.template(`${flutterDir}lib/widgets/appbar_widget.dart`, `${packageFolder}/lib/widgets/appbar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/bottom_bar_widget.dart`, `${packageFolder}/lib/widgets/bottom_bar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/drawer_widget.dart`, `${packageFolder}/lib/widgets/drawer_widget.dart`);
            this.template(`${flutterDir}lib/widgets/empty_app_bar_widget.dart`, `${packageFolder}/lib/widgets/empty_app_bar_widget.dart`);
            this.template(`${flutterDir}lib/widgets/error_message_widget.dart`, `${packageFolder}/lib/widgets/error_message_widget.dart`);
            this.template(`${flutterDir}lib/widgets/global_methods.dart`, `${packageFolder}/lib/widgets/global_methods.dart`);
            this.template(`${flutterDir}lib/widgets/progress_indicator_widget.dart`, `${packageFolder}/lib/widgets/progress_indicator_widget.dart`);
            this.template(`${flutterDir}lib/widgets/rounded_button_widget.dart`, `${packageFolder}/lib/widgets/rounded_button_widget.dart`);
            this.template(`${flutterDir}lib/widgets/textfield_widget.dart`, `${packageFolder}/lib/widgets/textfield_widget.dart`);

            this.template(`${flutterDir}lib/main.dart`, `${packageFolder}/lib/main.dart`);

            // Layout
            this.template(`${flutterDir}lib/layout/desktop.dart`, `${packageFolder}/lib/layout/desktop.dart`);
            this.template(`${flutterDir}lib/layout/mobile.dart`, `${packageFolder}/lib/layout/mobile.dart`);
            this.template(`${flutterDir}lib/layout/web.dart`, `${packageFolder}/lib/layout/web.dart`);

            // macos
            this.template(`${flutterDir}macos/Runner/DebugProfile.entitlements`, `${packageFolder}/macos/Runner/DebugProfile.entitlements`);
            this.template(`${flutterDir}macos/Runner/Release.entitlements`, `${packageFolder}/macos/Runner/Release.entitlements`);

            // test
            this.template(`${flutterDir}test/widget_test.dart`, `${packageFolder}/test/widget_test.dart`);
        }
    };
}
