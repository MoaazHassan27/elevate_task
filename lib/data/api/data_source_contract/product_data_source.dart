import 'package:elevate_task/core/result.dart';
import 'package:elevate_task/data/models/product.dart';

abstract class ProductDataSource {
  Future<Result<List<Product>>> getProducts();
}
