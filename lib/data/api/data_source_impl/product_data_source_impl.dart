import 'package:elevate_task/core/result.dart';
import 'package:elevate_task/data/api/api_manager.dart';
import 'package:elevate_task/data/api/data_source_contract/product_data_source.dart';
import 'package:elevate_task/data/models/product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDataSourceImpl extends ProductDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductDataSourceImpl({required this.apiManager});

  @override
  Future<Result<List<Product>>> getProducts() async {
    var res = await apiManager.getProducts();
    return res;
  }
}
