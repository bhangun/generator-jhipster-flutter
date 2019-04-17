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
const mkdirp = require('mkdirp');
// const cleanup = require('../cleanup');
const constants = require('../generator-constants');

module.exports = {
    writeFiles
};

let flutterDir;
let flutterNewDir;
let projectName;

function writeFiles() {
    return {
        setUpJavaDir() {
            projectName = this.baseName;
            flutterDir = `${constants.FLUTTER_TEMPLATE}`;
            flutterNewDir = `${this.packageFolder}/${constants.MAIN_DIR}`;

        // this.log(flutterNewDir+' <><>' + this.appsName + '<><> '+ this.baseName);
        },

        cleanupOldServerFiles() {
        // cleanup.cleanupOldServerFiles(this, flutterDir, this.testDir);
        },

        writeGlobalFiles() {
            this.template('gitignore', `${this.packageFolder}/.gitignore`);
            this.template('metadata', `${this.packageFolder}/.metadata`);
            this.template('packages', `${this.packageFolder}/.packages`);
            this.template('apps_android.iml', `${this.packageFolder}/apps_android.iml`);
            this.template('apps.iml', `${this.packageFolder}/apps.iml`);
            // this.template('pubspec.lock', `${this.packageFolder}/pubspec.lock`);
            this.template('pubspec.yaml', `${this.packageFolder}/pubspec.yaml`);
            this.template('README.md', `${this.packageFolder}/README.md`);
        },

        writeClientResourceFiles() {
            // Create Flutter resource files
            mkdirp(flutterDir);
            // android
            this.template(`${flutterDir}android/gitignore`, `${this.packageFolder}/android/.gitignore`);
            this.template(`${flutterDir}android/build.gradle`, `${this.packageFolder}/android/build.gradle`);
            this.template(`${flutterDir}android/gradle.properties`, `${this.packageFolder}/android/gradle.properties`);
            this.template(`${flutterDir}android/gradlew`, `${this.packageFolder}/android/gradlew`);
            this.template(`${flutterDir}android/gradlew.bat`, `${this.packageFolder}/android/gradlew.bat`);
            this.template(`${flutterDir}android/local.properties`, `${this.packageFolder}/android/local.properties`);
            this.template(`${flutterDir}android/settings.gradle`, `${this.packageFolder}/android/settings.gradle`);

            this.template(`${flutterDir}android/app/build.gradle`, `${this.packageFolder}/android/app/build.gradle`);
            this.template(`${flutterDir}android/app/src/main/AndroidManifest.xml`, `${this.packageFolder}/android/app/src/main/AndroidManifest.xml`);
            this.template(`${flutterDir}android/app/src/main/java/com/example/apps/MainActivity.java`, `${this.packageFolder}/android/app/src/main/java/com/example/${projectName}/MainActivity.java`);
            this.template(`${flutterDir}android/app/src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java`, `${this.packageFolder}/android/app/src/main/java/io/flutter/plugins/GeneratedPluginRegistrant.java`);
            this.template(`${flutterDir}android/app/src/main/res/drawable/launch_background.xml`, `${this.packageFolder}/android/app/src/main/res/drawable/launch_background.xml`);
            this.template(`${flutterDir}android/app/src/main/res/mipmap-hdpi/ic_launcher.png`, `${this.packageFolder}/android/app/src/main/res/mipmap-hdpi/ic_launcher.png`);
            this.template(`${flutterDir}android/app/src/main/res/mipmap-mdpi/ic_launcher.png`, `${this.packageFolder}/android/app/src/main/res/mipmap-mdpi/ic_launcher.png`);
            // this.template(`${flutterDir}android/app/src/main/res/mipmap-xhdpi/ic_launcher.png`, `${flutterNewDir}android/app/src/main/res/mipmap-xhdpi/ic_launcher.png`);
            this.template(`${flutterDir}android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png`, `${this.packageFolder}/android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png`);
            this.template(`${flutterDir}android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png`, `${this.packageFolder}/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png`);
            this.template(`${flutterDir}android/app/src/main/res/values/styles.xml`, `${this.packageFolder}/android/app/src/main/res/values/styles.xml`);

            // this.template(`${flutterDir}android/gradle/wrapper/gradle-wrapper.jar`, `${flutterNewDir}android/gradle/wrapper/gradle-wrapper.jar`);
            this.template(`${flutterDir}android/gradle/wrapper/gradle-wrapper.properties`, `${this.packageFolder}/android/gradle/wrapper/gradle-wrapper.properties`);

            // assets
            this.template(`${flutterDir}assets/logo-jhipster.svg`, `${this.packageFolder}/assets/logo-jhipster.svg`);
            // ios
            this.template(`${flutterDir}ios/Flutter/AppFrameworkInfo.plist`, `${this.packageFolder}/ios/Flutter/AppFrameworkInfo.plist`);
            this.template(`${flutterDir}ios/Flutter/Debug.xcconfig`, `${this.packageFolder}/ios/Flutter/Debug.xcconfig`);
            this.template(`${flutterDir}ios/Flutter/Generated.xcconfig`, `${this.packageFolder}/ios/Flutter/Generated.xcconfig`);
            // this.template(`${flutterDir}ios/Flutter/Release.xxconfig`, `${flutterNewDir}ios/Flutter/Release.xxconfig`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json`, `${this.packageFolder}/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@2x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@2x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@3x.png`, `${this.packageFolder}/ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage@3x.png`);
            this.template(`${flutterDir}ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md`, `${this.packageFolder}/ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md`);

            this.template(`${flutterDir}ios/Runner/Base.lproj/LaunchScreen.storyboard`, `${this.packageFolder}/ios/Runner/Base.lproj/LaunchScreen.storyboard`);
            this.template(`${flutterDir}ios/Runner/Base.lproj/Main.storyboard`, `${this.packageFolder}/ios/Runner/Base.lproj/Main.storyboard`);

            this.template(`${flutterDir}ios/Runner/Base.lproj/LaunchScreen.storyboard`, `${this.packageFolder}/ios/Runner/Base.lproj/LaunchScreen.storyboard`);
            this.template(`${flutterDir}ios/Runner/AppDelegate.h`, `${this.packageFolder}/ios/Runner/AppDelegate.h`);
            this.template(`${flutterDir}ios/Runner/AppDelegate.m`, `${this.packageFolder}/ios/Runner/AppDelegate.m`);
            this.template(`${flutterDir}ios/Runner/GeneratedPluginRegistrant.h`, `${this.packageFolder}/ios/Runner/GeneratedPluginRegistrant.h`);
            this.template(`${flutterDir}ios/Runner/GeneratedPluginRegistrant.m`, `${this.packageFolder}/ios/Runner/GeneratedPluginRegistrant.m`);
            this.template(`${flutterDir}ios/Runner/Info.plist`, `${this.packageFolder}/ios/Runner/Info.plist`);
            this.template(`${flutterDir}ios/Runner/main.m`, `${this.packageFolder}/ios/Runner/main.m`);

            this.template(`${flutterDir}ios/Runner.xcodeproj/project.pbxproj`, `${this.packageFolder}/ios/Runner.xcodeproj/project.pbxproj`);
            this.template(`${flutterDir}ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata`, `${this.packageFolder}/ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata`);
            this.template(`${flutterDir}ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme`, `${this.packageFolder}/ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme`);

            this.template(`${flutterDir}ios/Runner.xcworkspace/contents.xcworkspacedata`, `${this.packageFolder}/ios/Runner.xcworkspace/contents.xcworkspacedata`);
            this.template(`${flutterDir}ios/gitignore`, `${this.packageFolder}/ios/.gitignore`);

            // lib
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

            // this.template(`${flutterDir}lib/services/authentication.dart`, `${this.packageFolder}/lib/services/authentication.dart`);
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
            this.template(`${flutterDir}test/widget_test.dart`, `${this.packageFolder}/test/widget_test.dart`);
        }
    };
}
