import 'package:elevate_task/domain/entities/product_entity.dart';

sealed class GetProductsState {}

class GetProductsInitialState extends GetProductsState {}

class GetProductsLoadingState extends GetProductsState {}

class GetProductsSuccessState extends GetProductsState {
  List<ProductEntity> list;

  GetProductsSuccessState({required this.list});
}

class GetProductsErrorState extends GetProductsState {
  Exception exception;

  GetProductsErrorState({required this.exception});
}
