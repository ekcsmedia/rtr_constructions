import 'dart:typed_data';

import 'app_platform.dart';

AppPlatform get appPlatform => AppPlatformPhone();

class AppPlatformPhone extends AppPlatform {
  @override
  callMethod(Object method, [List? args]) {}

  @override
  String getHost() {
    return "";
  }

  @override
  void open(String url, String name) {}

  @override
  void replace(String value) {}

  @override
  String replaceAll(String from, String replace) {
    return "";
  }

  @override
  void preventLoadingPage() {}

  @override
  void moveToNextScreen() {}

  @override
  void downloadFile(Uint8List response) {}

  @override
  void reload() {}

  @override
  getIFrameElement() {}

  @override
  getHtmlWindow() {}

  @override
  registerViewFactory(
      String viewID, String docuSignUrl, Function onMessageCallback) {}
}
