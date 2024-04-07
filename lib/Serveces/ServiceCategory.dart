import 'package:asrooshop/Model/Model.dart';
import 'package:asrooshop/Model/ModelCategory.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:http/http.dart' as http;

class ServicesCategory {
  static Future<List<String>> getCategoryAPI() async {
    var response = await http.get(Uri.parse("${url}/products/categories"));
    if (response.statusCode == 200) {
      var data = response.body;
      return modelCategoryFromJson(data);
    } else {
      return throw Exception("failed api");
    }
  }
}
// inside Category
class InsideCategory {
  static Future<List<ModelApi>> getInsideCategory(String NameCategory) async {
    var response =
        await http.get(Uri.parse("$url/products/category/$NameCategory"));
    if (response.statusCode == 200) {
      var data = response.body;
      return modelApiFromJson(data);
    } else {
      return throw Exception("failed api");
    }
  }
}
