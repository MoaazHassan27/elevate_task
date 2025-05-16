import 'package:elevate_task/core/result.dart';
import 'package:elevate_task/data/api/data_source_contract/product_data_source.dart';
import 'package:elevate_task/data/models/product.dart';
import 'package:elevate_task/domain/entities/product_entity.dart';
import 'package:elevate_task/domain/repository_contract/product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  ProductDataSource productDataSource;

  @factoryMethod
  ProductRepositoryImpl({required this.productDataSource});

  @override
  Future<Result<List<ProductEntity>>> getProducts() async {
    var res = await productDataSource.getProducts();
    switch (res) {
      case Success<List<Product>>():
        return Success(data: res.data.map((e) => e.toProductEntity()).toList());
      case Error<List<Product>>():
        return Error(exception: res.exception);
    }
  }
}
