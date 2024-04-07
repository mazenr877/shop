// ignore_for_file: unused_local_variable

import 'package:asrooshop/Model/Model.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
// import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  static Future<List<ModelApi>> getApi() async {
    var response = await http.get(Uri.parse("${url}/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return modelApiFromJson(data);
    } else {
      return throw Exception("failed api");
    }
  }
}
