import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/entities/Products.dart';

import '../../domain/use_cases/get_products_case.dart';

@injectable
class ProductViewModel extends Cubit<ProductsState>{
  GetProductsCase getProductsCase;
  @factoryMethod

  ProductViewModel(this.getProductsCase):super(ProductsInitState());

  getProducts() async {
    emit(ProductsLoadingState());
    var result = await getProductsCase.call();
    result.fold(
            (products) {
              return emit(ProductsSuccessState(products));
            },
            (error) => emit(ProductsErrorState(error))
    );
  }

}

abstract class ProductsState{}
class ProductsInitState extends ProductsState {}
class ProductsLoadingState extends ProductsState {}
class ProductsErrorState extends ProductsState {
  String? errorMessage ;
  ProductsErrorState(this.errorMessage);
}
class ProductsSuccessState extends ProductsState {
  List<ProductsEntity>? productsList;
  ProductsSuccessState(this.productsList);
}