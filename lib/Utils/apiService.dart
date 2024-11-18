import 'dart:convert';

import 'package:bai1/entity/shopping_source.dart';
import 'package:dio/dio.dart';

class apiService{
 static Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    String url= "https://fakestoreapi.com/products";
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {

      List<dynamic> rs = response.data;
      var lst = rs.map((e)=> Product.fromJson(e)).toList();
      return lst;
    }
    else {
      print(response.statusMessage);
      throw Exception("lỗi ");
    }

  }


}