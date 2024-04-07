import 'package:asrooshop/Localization/ar.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/Localization/en.dart';
import 'package:asrooshop/Localization/fr.dart';
import 'package:get/get.dart';

class localize extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        fre: fr,
        are: ar,
      };
}
