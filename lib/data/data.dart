import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tuan03/model/product_model.dart';

class ReadData{
  Future<List<ProductModel>> loadData() async{
    var data = await rootBundle.loadString("assets/files/listproduct.json");
    var dataJson = jsonDecode(data);

    return (dataJson['data'] as List).map((e) => ProductModel.fromJson(e)).toList();
  }
}