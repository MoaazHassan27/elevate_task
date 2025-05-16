import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_task/core/app_style.dart';
import 'package:elevate_task/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      height: 240.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.blueGrey),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 125.h,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.r)),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  right: 8.w,
                  top: 8.h,
                  child: Container(
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[800]!,
                                spreadRadius: 2,
                                blurRadius: 10),
                          ],
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.all(6),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.productTitle,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      widget.product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.ProductDesc,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          'EGP ' + widget.product.price.toString(),
                          style: AppStyle.productPrice,
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          '2000 EGP',
                          style: AppStyle.productPrice.copyWith(
                            color: Color(0xFF0066CC),
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          'Review',
                          style: AppStyle.reviewText,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          '(' + widget.product.rating.rate.toString() + ')',
                          style: AppStyle.reviewText,
                        ),
                        SizedBox(width: 3.w),
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFC107),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.add_circle_rounded,
                          color: Color(0xFF004B94),
                          size: 35.sp,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
