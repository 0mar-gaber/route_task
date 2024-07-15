import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/config/theme.dart';
import 'package:route_task/presentation/screens/product_view_model.dart';
import 'package:route_task/presentation/screens/products_screen.dart';

import 'core/DI/di.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductViewModel>(
            create: (_) => getIt<ProductViewModel>(),
          ),
          // Add more providers if needed
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            ProductsScreen.route: (context) => const ProductsScreen(),
          },
          initialRoute: ProductsScreen.route,
          theme: AppTheme.theme,
        ),
      ),
    );
  }
}