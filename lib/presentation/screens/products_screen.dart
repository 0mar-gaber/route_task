import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/core/DI/di.dart';
import 'package:route_task/presentation/screens/product_view_model.dart';

import '../../core/reusable_components/product_widget.dart';
import '../../core/reusable_components/text_field.dart';

class ProductsScreen extends StatelessWidget {
  static const String route = "products screen";


  const ProductsScreen({super.key});







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/svg/logo.svg",
              width: 76.w,
              height: 32.h,
            ),
            SizedBox(height: 19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: EditText(
                        lapel: "what do you search for?",
                        obscureText: false,
                        prefixIconButton:IconButton(onPressed: (){}, icon: Padding(
                          padding:  REdgeInsets.only(left: 24.5,right: 8),
                          child: SvgPicture.asset("assets/svg/search.svg"),
                        ) ),
                        keyboardType: TextInputType.text,
                        formKay: GlobalKey(),
                        controller: TextEditingController())),
                const SizedBox(width: 26,),
                SvgPicture.asset(
                  "assets/svg/cart.svg",
                  width: 24.w,
                  height: 24.h,
                ),
              ],
            ),
            BlocProvider(
                create:  (context) =>  getIt<ProductViewModel>()..getProducts(),
              child: BlocBuilder<ProductViewModel,ProductsState>(
                  builder: (context, state) {

                    if(state is ProductsErrorState){
                      return Expanded(
                        child: Center(
                          child: IconButton(
                              onPressed: () {

                                  context.read<ProductViewModel>().getProducts();

                              },
                              icon: Icon(
                                Icons.refresh,
                                color: Theme.of(context).colorScheme.primary,
                                size: 100.sp,
                              )),
                        ),
                      );
                    }
                    if( state is ProductsSuccessState){
                      return Expanded(
                          child: GridView.builder(
                            padding: REdgeInsets.only(
                                top: 24,
                                bottom: 10
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: .8
                            ),
                            itemBuilder: (context, index) =>
                            ProductWidget(productsEntity: state.productsList![index],),
                            itemCount: state.productsList?.length,
                          )
                      );
                    }
                    return const Expanded(child: Center(child: CircularProgressIndicator()));

                  },
              ),
            ),



          ],
        ),
      ),
    );
  }
}
