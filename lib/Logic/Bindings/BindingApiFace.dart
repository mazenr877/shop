import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:get/get.dart';

class BindingApi implements Bindings {
  @override
  void dependencies() {
    Get.put(ApiController());
  }
}
