import 'package:elevate_task/core/result.dart';
import 'package:elevate_task/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Result<List<ProductEntity>>> getProducts();
}
