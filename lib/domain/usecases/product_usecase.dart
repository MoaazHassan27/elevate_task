import 'package:elevate_task/core/result.dart';
import 'package:elevate_task/domain/entities/product_entity.dart';
import 'package:elevate_task/domain/repository_contract/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUsecase {
  ProductRepository productRepository;

  @factoryMethod
  GetProductUsecase({required this.productRepository});

  Future<Result<List<ProductEntity>>> execute() {
    return productRepository.getProducts();
  }
}
