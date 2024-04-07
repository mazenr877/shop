// ignore_for_file: non_constant_identifier_names, unused_import
import 'package:asrooshop/Logic/Controller/ControllerWithObx.dart';
import 'package:get/get.dart';

class MainBind implements Bindings {
  @override
  void dependencies() {
    Get.put(ControllerM(), permanent: true);
  }
}
