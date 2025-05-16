// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:elevate_task/core/dio_service.dart' as _i1008;
import 'package:elevate_task/data/api/api_manager.dart' as _i997;
import 'package:elevate_task/data/api/data_source_contract/product_data_source.dart'
    as _i459;
import 'package:elevate_task/data/api/data_source_impl/product_data_source_impl.dart'
    as _i978;
import 'package:elevate_task/data/api/repository_impl/product_repository_impl.dart'
    as _i157;
import 'package:elevate_task/domain/repository_contract/product_repository.dart'
    as _i280;
import 'package:elevate_task/domain/usecases/product_usecase.dart' as _i601;
import 'package:elevate_task/presentation/viewmodel/cubit/get_products_cubit.dart'
    as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i361.Dio>(
      () => registerModule.provideDio(),
      preResolve: true,
    );
    gh.singleton<_i997.ApiManager>(() => _i997.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i459.ProductDataSource>(
        () => _i978.ProductDataSourceImpl(apiManager: gh<_i997.ApiManager>()));
    gh.factory<_i280.ProductRepository>(() => _i157.ProductRepositoryImpl(
        productDataSource: gh<_i459.ProductDataSource>()));
    gh.factory<_i601.GetProductUsecase>(() => _i601.GetProductUsecase(
        productRepository: gh<_i280.ProductRepository>()));
    gh.factory<_i974.GetProductsCubit>(() => _i974.GetProductsCubit(
        getProductUsecase: gh<_i601.GetProductUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i1008.RegisterModule {}
