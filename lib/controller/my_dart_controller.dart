import 'package:get/get.dart';

import '../model/my_dart_model.dart';
import '../repository/my_dart_repo.dart';

class MyDartController extends GetxController {

  @override
  void onInit() {
    getMyDartData();
    // TODO: implement onInit
    super.onInit();
  }

  final _myDartRepo = MyDartRepository();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final RxString _errorMessage = "".obs;
  String? get errorMessage => _errorMessage.value;

  final _myPayloadModel = MyPayload().obs;
  MyPayload get myPayloadModel =>
      _myPayloadModel.value;

  getMyDartData({Function? isFormValid}) async {
    var params = {
      "myParam" : "param1"
    };
    _isLoading(true);
    var response =
    await _myDartRepo.getMyDartData(params);
    response.fold((failure) {
      _isLoading(false);
      _isLoading.refresh();
      _errorMessage.value = failure.message;
      refresh();
    }, (data) async {
      _isLoading(false);
      _isLoading.refresh();
      _myPayloadModel.value = data;
    });
  }
}

