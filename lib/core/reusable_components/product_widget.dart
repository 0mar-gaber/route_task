import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_task/domain/entities/Products.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key,required this.productsEntity});

 final ProductsEntity productsEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color(0xff004182).withOpacity(.3) ,
            width: 2.w
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Stack(alignment: Alignment.topRight, children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child: Image.network(
                  productsEntity.thumbnail??
                  "https://sneakernews.com/wp-content/uploads/2022/06/jordan-1-low-voodoo-DZ7292-200-6.jpg",width: double.infinity,fit: BoxFit.fill,)),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/love.svg",
                width: 50.w,
                height: 50.h,
              ),
            )
          ])),
          SizedBox(
            height: 8.h,
          ),
          Stack(alignment: Alignment.bottomRight, children: [
            Container(
              margin: REdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productsEntity.title??
                    "Nike Air Force Nike voodoo shoes flexible for mens",
                    style: TextStyle(
                      color: const Color(0xff06004F),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        productsEntity.price.toString()??
                        "EGP 1200",
                        style: TextStyle(
                          color: const Color(0xff06004F),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(width: 16.w),
                      Stack(
                        alignment: Alignment.center,
                          children: [
                        Text(
                          (productsEntity.price! + (productsEntity.discountPercentage! * (productsEntity.price!) / 100)).toStringAsFixed(2),
                          style: TextStyle(
                            color: const Color(0xff004182).withOpacity(.6),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 1.6.h,
                            color: const Color(0xff004182).withOpacity(.6),
                          ),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(

                        "Review (${productsEntity.rating})",
                        style: TextStyle(
                          color: const Color(0xff06004F),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        "assets/svg/star.svg",
                        width: 15.w,
                        height: 15.h,
                      ),
                    ],
                  ),
                  SizedBox(height: 13.h)
                ],
              ),
            ),
            Padding(
              padding: REdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/add.svg",
                width: 30.w,
                height: 30.h,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
