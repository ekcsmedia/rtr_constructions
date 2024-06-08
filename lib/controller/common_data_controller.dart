import 'package:get/get.dart';

class CommonDataController extends GetxController {

  final _isCustomerListLoading = false.obs;

  bool get isCustomerListLoading => _isCustomerListLoading.value;

  void toggle() {
    _isCustomerListLoading.value = !_isCustomerListLoading.value;
  }

  final RxInt _customerTotal = 0.obs;

  int get customerTotal => _customerTotal.value;

  setCustomerTotal(value) {
    _customerTotal.value = value;
    _customerTotal.refresh();
  }
}
