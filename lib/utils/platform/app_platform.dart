import 'dart:typed_data';

abstract class AppPlatform {
  void downloadFile(Uint8List response);

  dynamic callMethod(Object method, [List? args]);

  String getHost();

  void open(String url, String name);

  void replace(String value);

  String replaceAll(String from, String replace);

  void preventLoadingPage();

  void moveToNextScreen();

  void reload();

  getIFrameElement();

  getHtmlWindow();

  registerViewFactory(
      String viewId, String docuSignUrl, Function onMessageCallback);
}
