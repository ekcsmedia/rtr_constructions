import 'dart:js' as js;
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:universal_html/html.dart' as html;

import 'app_platform.dart';

AppPlatform get appPlatform => AppPlatformWeb();

class AppPlatformWeb extends AppPlatform {

  @override
  callMethod(Object method, [List? args]) {
    js.context.callMethod(method, args);
  }

  @override
  String getHost() {
    return html.window.location.host;
  }

  @override
  void open(String url, String name) {
    html.window.open(url, name);
  }

  @override
  void replace(String value) {
    html.window.location.replace(value);
  }

  @override
  String replaceAll(String from, String replace) {
    return html.window.location.href.replaceAll(from, replace);
  }

  @override
  void preventLoadingPage() {
    html.window.onBeforeUnload.listen((event) async {
      if (event is html.BeforeUnloadEvent) {
        event.returnValue = "Changes that you made may not be saved.";
      }
    });
  }

  @override
  void moveToNextScreen() {}

  @override
  void downloadFile(Uint8List response) {
    var blob = html.Blob([response], 'application/pdf', 'native');

    html.AnchorElement(
      href: html.Url.createObjectUrlFromBlob(blob).toString(),
    )
      ..setAttribute("download", "profile.pdf")
      ..click();
  }

  @override
  void reload() {
    html.window.location.reload();
  }

  @override
  getIFrameElement() {
    return html.IFrameElement();
  }

  @override
  getHtmlWindow() {
    return html.window;
  }

  @override
  registerViewFactory(
      String viewID, String docuSignUrl, Function onMessageCallback) {
    // ignore: undefined_prefixed_name
    return ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..src = "packages/cred_components/lib/src/hello_sign/signedDoc.html"
          ..style.border = 'none'
          ..allowFullscreen = true
          ..allow = 'accelerometer; gyroscope;'
          ..onLoad.listen(
            (event) {
              print("-- docusign url $docuSignUrl ====");
              final data = <String, dynamic>{
                "topic": "OPEN_SIGN_WIDGET",
                "payload": {"url": docuSignUrl}
              };
              html.window.postMessage(data, "*");
              html.window.onMessage.listen((event) async {
                print("EVENT1  -- ${event.data}");
                onMessageCallback(event.data);
              });
            },
          ));
  }
}
