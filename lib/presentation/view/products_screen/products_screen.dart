import 'package:elevate_task/core/di.dart';
import 'package:elevate_task/presentation/viewmodel/cubit/get_products_cubit.dart';
import 'package:elevate_task/presentation/viewmodel/states/get_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/product_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  GetProductsCubit getProductsCubit = getIt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductsCubit.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(10),
          child: BlocBuilder<GetProductsCubit, GetProductsState>(
            bloc: getProductsCubit,
            builder: (context, state) {
              switch (state) {
                case GetProductsInitialState():
                case GetProductsLoadingState():
                  return Center(child: CircularProgressIndicator());
                case GetProductsSuccessState():
                  return Padding(
                    padding:  REdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 0.70,
                      ),
                      itemBuilder: (context, index) => ProductItem(
                        product: state.list[index],
                      ),
                      itemCount: state.list.length,
                      scrollDirection: Axis.vertical,
                    ),
                  );
                case GetProductsErrorState():
                  return Text('Errorr');
              }
            },
          ),
        ),
      ),
    );
  }
}
