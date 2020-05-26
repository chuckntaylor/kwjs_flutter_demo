# KWJS Flutter Demo

Flutter version of the KWJS app. The original demo app was written by [Lucas Gladding](https://github.com/lucasgladding) using the React Native framework for a series of talks for the [KWJavascript](https://www.meetup.com/KWJavaScript) meetup group. This Flutter version of the app was developed to see the differences between the frameworks, and to better understand the pros and cons of each.

Gladding's original repo can be found at [https://github.com/lucasgladding/kwjs-react-native-demo](https://github.com/lucasgladding/kwjs-react-native-demo).  This project still makes use of his server code which is available at: [https://github.com/lucasgladding/kwjs-server](https://github.com/lucasgladding/kwjs-server)

![KWJS Flutter App in action](https://res.cloudinary.com/chucktaylor/image/upload/v1590504833/kwjsApp-optimized.gif)

## Getting Started

### Flutter
 - Follow [these guides](https://flutter.dev/docs/get-started/install) for installing the Flutter SDK.
 - Setup your editing environment by following the guide for [Android Studio](https://flutter.dev/docs/get-started/editor?tab=androidstudio), or [Visual Studio Code](https://flutter.dev/docs/get-started/editor?tab=vscode).

### Server
Clone the kwjs-server repo, which can be found here:  [https://github.com/lucasgladding/kwjs-server](https://github.com/lucasgladding/kwjs-server)

The app needs to connect through HTTPS, where the certificate is trusted by the device. It is suggested to use  `ngrok http 3000`, then use the secure URL from [ngrok](https://ngrok.com/).

### App
1. `$ git clone https://github.com/chuckntaylor/kwjs_flutter_demo.git`
2. `$ cd kwjs_flutter_demo`
3. `$ flutter pub get`
4. Update the host in `lib/config/config.dart` to match the secure URL for the server.
5. To run the app, it is easiest to open the project in either [VS Code](https://flutter.dev/docs/get-started/test-drive?tab=vscode) or [Android Studio](https://flutter.dev/docs/get-started/test-drive?tab=androidstudio) and run it from there, as these editors will allow you to easily choose which device you wish to emulate the app on, and open the appropriate emulator.

## Additional Info
Services use the host defined in `config.dart`. Please note that the host should not include the protocol or trailing slash. i.e. `abcd1234.ngrok.io`.

For those who are just getting familiar with Flutter, `pubspec.yaml` is similar to `package.json`. This is where dependencies are declared, and some of the configuration is made. Running `flutter pub get` within the project folder fetched the dependencies specified in this file. Flutter packages can be found at [https://pub.dev/](https://pub.dev/).

All the code written by me was done in the `lib/` folder. This is similar to `src/` for javascript projects. Tests are written in the `test/` folder using the `flutter_test` package.

The entry point into a Flutter app, is the `main()` function - typically located in `main.dart`

To run the tests, run `flutter test` in the projects root folder.
