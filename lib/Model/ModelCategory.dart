// To parse this JSON data, do
//
//     final modelCategory = modelCategoryFromJson(jsonString);

import 'dart:convert';

List<String> modelCategoryFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String modelCategoryToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
//  inside category
