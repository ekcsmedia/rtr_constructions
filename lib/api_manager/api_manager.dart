import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import '../model/error_model.dart';
import '../utils/app_preferences.dart';
import 'api_exception.dart';
import '../utils/platform/app_platform_phone.dart'
if (dart.library.html) '../utils/platform/app_platform_web.dart' as web;

const String jsonContentType = 'application/json';
const String tenantName = 'credentialing';
String token = "";

class ApiManager {
  Future _getToken() async {
    token = 'Bearer ${GetStorage().read(AppPreferences.accessToken)}';
    log("token -> $token");
    //token =
    //    "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJlTHlsTEpqUXNadkRLZ08xN1RVcWtudjlSRzhFSko0WFZsNGN1VHk5NGVFIn0.eyJleHAiOjE2ODI1MDg5NzYsImlhdCI6MTY4MjUwNzE3NiwianRpIjoiYWQwMjcxZjEtYWYzYi00MDM0LWI2MTYtMjc2NDAxM2M4YTgwIiwiaXNzIjoiaHR0cDovL3FhLWlkZW50aXR5LnNpbXBsaWZ5c2FuZGJveC5uZXQvYXV0aC9yZWFsbXMvY3JlZGVudGlhbGluZyIsImF1ZCI6ImFjY291bnQiLCJzdWIiOiJkN2RiNTc2My0zOGQwLTQxZDQtYTM0OC05YjJjMzBkZmE0MGEiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzdm1zLWF1dGgtc2VydmljZSIsInNlc3Npb25fc3RhdGUiOiIwMGQzY2M0NC0yZTkwLTQwMTMtOWU5MC0wN2QwYmYxZmI5NTQiLCJhY3IiOiIxIiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIm9mZmxpbmVfYWNjZXNzIiwiZGVmYXVsdC1yb2xlcy1jcmVkZW50aWFsaW5nIiwiYWRtaW4iLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoicHJvZmlsZSBlbWFpbCIsInNpZCI6IjAwZDNjYzQ0LTJlOTAtNDAxMy05ZTkwLTA3ZDBiZjFmYjk1NCIsInRlbmFudF9pZCI6MTIwLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJtciBnb2Rib2xlIiwiZ3JvdXBzIjpbIi9nb2RyZWoiXSwicHJlZmVycmVkX3VzZXJuYW1lIjoiY2NAZ29kcmVqLmNvbSIsImdpdmVuX25hbWUiOiJtciIsImZhbWlseV9uYW1lIjoiZ29kYm9sZSIsImVtYWlsIjoiY2NAZ29kcmVqLmNvbSJ9.XX2nkEEifkL_3ieQwYyudCP6RNceopAeU_viU1V9GtcjoAzEkLPeyFsUpyct_j7PIdtmapV9_EAQtreHAdv4S-zhDtb1CynSWpC4YOLaS2edA7OEDbbGty8DFXUWIlazLlWrFyJ00hxikHnO1zvNXXT4pwixmLaT1tjXO6AcdHXzwV3oTFlUzxiN45y6swRGHZor67hRK-AlvUKQfbYEHMhsTyibaFgj8keS8hqjBXogZdAf0r0RH9q9q2DJKcuEL4AnB5T6NRioXAvTHC_E47rXWGOVworxIwpahxceWwOBHKpaqSRTE9B5cZP4JpsNkZ9aFjB9-CIeefSQf1oEZA";
  }

  //this adds the extra Query Parameters to the URL
  String? addExtraQueryParametersToUrl(
      String? url, Map<String, String> extraQueryParameters) {
    if (url == null || extraQueryParameters.isEmpty) {
      return url;
    }
    // if url already has query Params then add the '&' symbol else enter the '?' symbol
    bool isFirstParameter = true;
    if (url.contains('?')) {
      isFirstParameter = false;
    }

    //adding the extra query Params to the url
    for (String parameter in extraQueryParameters.keys) {
      if (isFirstParameter) {
        url = '$url?$parameter=${extraQueryParameters[parameter]}';
        isFirstParameter = false;
      } else {
        url = '$url&$parameter=${extraQueryParameters[parameter]}';
      }
    }
    print(
        'Url -> $url\n queryParameters -> ${Uri.parse(url ?? "").queryParameters.toString()}');
    return url;
  }

  final Dio _client = Dio();
  var httpClient = http.Client();

  // final Connectivity _connectivity = Connectivity();

  // This method is used for call API for the `GET` method, need to pass API Url endpoint
  Future<dynamic> get(
    String? url, {
    String? contentType,
    bool isTokenMandatory = true,
    String? accessToken,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType ?? jsonContentType,
        'tenantName': tenantName,
      };

      print(headers.entries.toList());

      if (isTokenMandatory) {
        headers['Authorization'] = accessToken ?? token;
      }


      //declare the extra Query Prameters to be added in the url, if no extra parameters then pass empty array

      print("Get url is ****************** $url");

      // print("Get url is ****************** $url");

      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  'Content-Type': 'application/json',
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!,
                };*/

      // Make get method api call with header
      final response = await http.get(
        Uri.parse(url ?? ""),
        headers: headers,
      );

      // Get.printInfo(info: 'Response body of Get ${response.request!.url} ***********>> ${response.body}');
      log('Request URL -> $url');
      log('Response body -> ${response.body}');

      // Handle response and errors
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `POST` method, need to pass API Url endpoint
  Future<dynamic> post(
    String? url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
    String? accessToken,
    Map<String, String>? headersParams,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not loged in then pass empty array as header
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };
      if (headersParams != null) {
        headers.addAll(headersParams);
      }

      if (isTokenMandatory) {
        headers['Authorization'] = accessToken ?? token;
      }

      //declare the extra Query Prameters to be added in the url, if no extra parameters then pass empty array
      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  'Content-Type': 'application/json',
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!,
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.post(
        Uri.parse(url ?? ""),
        headers: headers,
        body: jsonEncode(parameters),
      );
      // Get.printInfo(info: 'Response body of Post ${response.request!.url} ***********>> ${response.body}');
      log('Request URL -> $url');
      log('Request params -> $parameters');
      log('Response body -> ${response.body}');

      // Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `PUT` method, need to pass API Url endpoint
  Future<dynamic> put(
    String? url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
    String? accessToken,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = accessToken ?? token;
      }


      //declare the extra Query Prameters to be added in the url, if no extra parameters then pass empty array

      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {'Content-Type': 'application/json'}
              : {
                  'Content-Type': 'application/json',
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.put(
        Uri.parse(url ?? ""),
        headers: headers,
        body: jsonEncode(parameters),
      );

      // Get.printInfo(info: 'Response body of Put ${response.request!.url} ***********>> ${response.body}');
      log('Request URL -> $url');
      log('Request params -> $parameters');
      log('Response body -> ${response.body}');
      // print('Response body of Put ${response.request!.url} -> ${response.body}');

      // Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `DELETE` method, need to pass API Url endpoint
  Future<dynamic> delete(
    String? url,
    var parameters, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token;
      }


      //declare the extra Query Prameters to be added in the url, if no extra parameters then pass empty array


      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.delete(
        Uri.parse(url ?? ""),
        headers: headers,
        body: jsonEncode(parameters),
      );

      // Get.printInfo(info: 'Response body of Delete ${response.request!.url} ***********>> ${response.body}');
      log('Request URL -> $url');
      log('Request params -> $parameters');
      log('Response body -> ${response.body}');
      // log('Response body of Delete ${response.request!.url} ***********>> ${response.body}');

      /// Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  // This method is used for call API for the `DELETE` method, need to pass API Url endpoint
  Future<dynamic> deleteURL(
    String? url, {
    String contentType = jsonContentType,
    bool isTokenMandatory = true,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      Map<String, String> headers = {
        'Content-Type': contentType,
        'tenantName': tenantName,
      };

      if (isTokenMandatory) {
        headers['Authorization'] = token;
      }



      //declare the extra Query Prameters to be added in the url, if no extra parameters then pass empty array



      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {}
              : {
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!
                };*/

      // Make the post method api call with header and given parameter
      final response = await http.delete(
        Uri.parse(url ?? ""),
        headers: headers,
      );

      // Get.printInfo(info: 'Response body of Delete ${response.request!.url} ***********>> ${response.body}');
      // log('Request params -> $parameters');
      log('Request URL -> $url');
      log('Response body -> ${response.body}');
      // log('Response body of Delete ${response.request!.url} ***********>> ${response.body}');

      /// Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);
      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> putMultipart({
    required String? url,
    required Map<String, String> parameters,
    required List<http.MultipartFile> imageFiles,
    String contentType = jsonContentType,
  }) async {
    await _getToken();

    try {
      // Declare the header for the request, if user not logged in then pass empty array as header or else pass the authentication token stored on login time
      // Map<String, String> headers = {
      //'Content-Type': contentType,
      //"tenantName": "credentialing",
      //   "Authorization":
      //       "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJxLTg3cml2a3BxcXRvbTZndG84NUFLeGlmeHlQMVFMMWVTMnFTS0RkY3dzIn0.eyJleHAiOjIxNDU3OTQ5MDcsImlhdCI6MTY2MTk1NDkwNywianRpIjoiMjEwOTIzMTEtOTFjMi00ZmVkLWEwMjctYjMzZmZmMTdhMGI0IiwiaXNzIjoiaHR0cHM6Ly9kZXYtaWRlbnRpdHkuc2ltcGxpZnlzYW5kYm94Lm5ldC9hdXRoL3JlYWxtcy9jcmVkZW50aWFsaW5nIiwiYXVkIjoiYWNjb3VudCIsInN1YiI6ImEwYTVjZjhjLTEwNzctNGM2Yy04OTRmLThjMTZlMGE5ZWIwZSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImNyZWRlbnRpYWxpbmctc2VydmljZS1hY2NvdW50Iiwic2Vzc2lvbl9zdGF0ZSI6IjU0NTdlYmIyLTk4YTMtNGY4My1hZWYzLWRmZTJmZmFmMDZmZSIsImFjciI6IjEiLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsic3VwZXJfYWRtaW4iLCJkZWZhdWx0LXJvbGVzLWNyZWRlbnRpYWxpbmciLCJhZG1pbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIGVtYWlsIHByb2ZpbGUiLCJzaWQiOiI1NDU3ZWJiMi05OGEzLTRmODMtYWVmMy1kZmUyZmZhZjA2ZmUiLCJ0ZW5hbnRfaWQiOjEsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwibmFtZSI6IkNyZWRlbnRpYWxpbmcgU2VydmljZUFjY291bnQiLCJncm91cHMiOlsiL3NpbXBsaWZ5dm1zL1RydWVzdGFmZiJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJjcmVkZW50aWFsaW5nX3NlcnZpY2VfYWNjb3VudF91c2VyIiwiZ2l2ZW5fbmFtZSI6IkNyZWRlbnRpYWxpbmciLCJmYW1pbHlfbmFtZSI6IlNlcnZpY2VBY2NvdW50IiwiZW1haWwiOiJzaW1wbGlmeXZtc19zZXJ2aWNlX2FjY291bnRAc2ltcGxpZnl2bXMuY29tIn0.a8fYAMeyZz2rR7Ke7bIVsPXTcBGfMZZWnzScilxS9_W1pMkmmUtDAyzsl8UOlL1y0FSXOs97S6-fuxiNHVORXy3NgbkRd4bc3G5IKMFFWmnN5RcqTiVgYYuUcT0X-p61IuACtXrkNIwYS7sb5FJ36jnOfXJ7sfSWpaC2y0L7mv-QMjYDIKRa-uxjkP8PY0-dPE_fTQilrDC_vip7PWgHztJtWqA9TMQJfjY6RrfVC-tvVXwRdWyz2skFENewd_PeQGrWm-qVbdo67VocwAD86BDg5tlijPL8uDv7vfG9Rc3W_uIemyb7tqq4lcYfhA9IDJ_3docQB1jTg4nLYrNGsA"
      // };
      /*GetStorage().read(AppPreferencesHelper.pUser) == null
              ? {'Content-Type': 'application/json'}
              : {
                  "session": LoginSuccessResponseModel.fromJson(
                          GetStorage().read(AppPreferencesHelper.pUser))
                      .session!
                };*/

      var request = http.MultipartRequest(
        'PUT',
        Uri.parse(url ?? ""),
      );

      //request.fields.addAll(parameters);
      request.files.addAll(imageFiles);
      //request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var data = {"statusCode": 200, "message": "File uploaded successfully"};

        return _returnResponse(http.Response(json.encode(data), 200));
      }
      var data = await response.stream.bytesToString();
      var responseData = http.Response(data, response.statusCode);

      // Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(responseData);
      //var responseJson = _returnResponse(responseData);
      //return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future dioPutFile(
      {required String? url,
      XFile? uploadFile,
      required int fileLenght,
      dynamic data,
      String? contectType}) async {
    // Options options = Options(
    //     contentType: contectType ?? lookupMimeType(uploadFile?.path ?? ""),
    //     headers: {
    //       'Accept': "*/*",
    //       'Content-Length': fileLenght,
    //       'Connection': 'keep-alive',
    //       //'User-Agent': 'ClinicPlush'
    //     });

    // print(options.toString());

    // final response = await _client.put(url ?? "",
    //     data: data ?? uploadFile?.openRead(),
    //     options: options, onSendProgress: (val1, val2) {
    //   log("${val1 / val2 * 100}");
    // });
    final response =
        await httpClient.put(Uri.parse(url ?? ""), body: data, headers: {
      'Accept': "*/*",
      'Connection': 'keep-alive',
      "Content-Type":
          contectType ?? lookupMimeType(uploadFile?.path ?? "") ?? "",
      // "Content-Disposition": 'attachment; filename="resource"',
      "Content-Encoding": "identity",
      "Content-Length": fileLenght.toString()
    });
    print("Res ${response.statusCode}");
    print("Res Data ${response.body}");
    if (response.statusCode == 200) {
      print("file upload successfull");
    }
    // return _returnResponse(
    //     http.Response(, response.statusCode ?? 0));
  }

  Future<dynamic> dioPostFile({
    required String? url,
    String? fileName,
    dynamic data,
    String? contentType,
    bool? isBulk = false,
    bool isTokenMandatory = true,
    String? accessToken,
  }) async {
    await _getToken();

    Map<String, String> headers = {
      'Content-Type': contentType ?? "",
    };

    if (isTokenMandatory) {
      headers['Authorization'] = accessToken ?? token;
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url.toString()),
    );
    var data1 = Map<String, dynamic>.from(data as Map);

    if (data1.containsKey('contentType')) {
      request.fields.addAll({
        'fileName': data['fileName'],
        'contentType': data['contentType'],
        'region': data['region']
      });
    } else {
      if (isBulk == true) {
        request.fields
            .addAll({'fileNames': data['fileNames'], 'region': data['region']});
      } else {
        request.fields
            .addAll({'fileName': data['fileName'], 'region': data['region']});
      }
    }

    request.headers.addAll(headers);
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return _returnResponse(response);
  }

  // This method is used for call API for the `POST` method, need to pass API Url endpoint
  Future<dynamic> postDownloadWorkflow(
    String url,
    var parameters,
  ) async {
    try {
      // Declare the header for the request, if user not loged in then pass empty array as header
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      // Make the post method api call with header and given parameter
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(parameters),
      );

      log(response.toString());

      // Get.printInfo(info: 'Response body of Post ${response.request!.url} ***********>> ${response.body}');
      log('Request URL -> $url');
      log('Request params -> $parameters');
      log('Response body -> ${response.body}');

      // Handle response and errors
      // Map<dynamic, dynamic> responseJson = _returnResponse(response);

      var responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future dioDownloadFile({
    required String url,
    dynamic data,
  }) async {
    var uri = Uri.parse(
      url,
    );
    var httpResponse = await httpClient.post(
      uri,
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Accept': "*/*",
      },
    );
    final response = httpResponse.bodyBytes;

    if (httpResponse.statusCode == 200) {
      if (response.isNotEmpty) {
        if (kIsWeb) {
          web.appPlatform.downloadFile(response);
        } else {}
      }
    }
  }

  Future saveFileFromBytes(dynamic data, ValueChanged<double> onProgress,
      {required String url, required filePath}) async {
    try {
      final response = await _client.post(url,
          data: data,
          options: Options(
              contentType: "application/json; charset=utf-8",
              responseType: ResponseType.bytes),
          onReceiveProgress: (value1, value2) {
        onProgress(value1 / value2 * 100);
      });

      if (kIsWeb) {
      } else {
        File file = File(filePath);
        var data = file.openSync(mode: FileMode.write);
        data.writeFromSync(response.data);
      }
      return response;
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> downloadFile(
      {required String url, required String saveDirectoryPath}) async {
    await _client.download(url, saveDirectoryPath);
    //print(result.asStream());
  }

  dynamic _returnResponse(http.Response response) {
    log('Response code -> ${response.statusCode}');

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        // log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 201:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        // log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 202:
        var responseJson = json.decode(utf8.decode(response.bodyBytes));
        log("Response Json ${response.statusCode} -> ${responseJson.toString()}");

        if (responseJson['status'] == false) {
          throw BadRequestException(
            'Err:${response.statusCode} ${responseJson['message']}',
            responseJson,
          );
        }
        return responseJson;
      case 400:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        // log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        throw BadRequestException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
      case 401:
        /*if (response.body.toString().isHtmlString()) {
          GetStorage().erase();
          globalContext.read<AuthService>().logOut();
          Get.find<OnboardController>()
              .setsuccessMessage('Session expired, Please login to continue!');
          return;
        }*/

        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        // log("ErrorModel ${response.statusCode} -> ${errorModel.message}");

        throw UnauthorisedException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );

      case 403:
      case 404:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        // log("ErrorModel ${response.statusCode} -> ${errorModel.message}");

        // GetStorage().erase();
        // globalContext.read<AuthService>().logOut();
        // return;

        throw UnauthorisedException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
      case 500: //TODO
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        // log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        var decodedJson = json.decode(response.body);
        String error = decodedJson["message"] ?? decodedJson["error"];
        throw FetchDataException(
          'Err:${response.statusCode} $error',
          errorModel.toJson(),
        );
      default:
        ErrorModel errorModel = ErrorModel.fromJson(json.decode(response.body));
        // log("ErrorModel ${response.statusCode} -> ${errorModel.message}");
        throw FetchDataException(
          'Err:${response.statusCode} ${errorModel.message}',
          errorModel.toJson(),
        );
    }
  }
}
