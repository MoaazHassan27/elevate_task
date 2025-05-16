import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_endpoints.dart';
import '../../core/result.dart';
import '../models/product.dart';

@singleton
class ApiManager {
  Dio dio;

  ApiManager(this.dio);

  Future<Result<List<Product>>> getProducts() async {
    try {
      Response response = await dio.get(ApiEndPoints.productsEndpoint);
      List<Product> products = (response.data as List)
          .map((json) => Product.fromJson(json))
          .toList();
      return Success(data: products);
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }
}

