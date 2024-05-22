// import 'package:dartz/dartz.dart';
// import 'package:sattva_rtr_construction_split_wise/model/my_dart_model.dart';
//
// import '../api_manager/api_exception.dart';
// import '../utils/failure.dart';
//
// class MyDartRepository {
//
//   Future<Either<Failure, MyPayload>>
//
//   getMyDartData(params) async {
//     try {
//       // var jsonResponse = await _apiManager.post(
//       //     CredWidgets.apiEndpoints.eventBaseUrl,
//       //     params);
//       var jsonResponse = {
//         "body": {
//           "message": "Successfully fetched Attached list",
//           "payload": {
//             "title" : "This is title",
//             "description" : "This is description"
//           }
//         },
//         "statusCodeValue": 200,
//         "statusCode": "OK"
//       };
//       var response = MyPayload.fromJson(jsonResponse);
//       return right(response);
//     } on AppException catch (error) {
//       return left(ApiFailure(message: error.message));
//     } catch (error) {
//       return left(ApiFailure(message: error.toString()));
//     }
//   }
// }
