import 'package:e_commerce_app/model/categort_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductContoller extends GetxController {
  var subcat=[];
  getSubCategories(title)async{
    subcat.clear();
    var data= await rootBundle.loadString("lib/services/category_model.json");
    var decoded =categoryModelFromJson(data);
    var s=decoded.categories.where((element) => element.name==title).toList();
    for (var i in s[0].subcategory) {
      subcat.add(i);
    }
  }
  
}