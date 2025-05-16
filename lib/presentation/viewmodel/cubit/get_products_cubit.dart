import 'package:elevate_task/core/result.dart';
import 'package:elevate_task/domain/entities/product_entity.dart';
import 'package:elevate_task/domain/usecases/product_usecase.dart';
import 'package:elevate_task/presentation/viewmodel/states/get_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsCubit extends Cubit<GetProductsState> {
  @factoryMethod
  GetProductsCubit({required this.getProductUsecase})
      : super(GetProductsInitialState());
  GetProductUsecase getProductUsecase;

  void getProducts() async {
    emit(GetProductsLoadingState());
    var res = await getProductUsecase.execute();
    switch (res) {
      case Success<List<ProductEntity>>():
        emit(GetProductsSuccessState(list: res.data));
      case Error<List<ProductEntity>>():
        emit(GetProductsErrorState(exception: res.exception));
    }
  }
}
