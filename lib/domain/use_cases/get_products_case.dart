import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/entities/Products.dart';
import 'package:route_task/domain/repository_contract/get_products_repo.dart';
@injectable
class GetProductsCase {
  GetProductsRepo getProductsRepo ;
  @factoryMethod
  GetProductsCase(this.getProductsRepo);

  Future<Either<List<ProductsEntity>, String>> call(){
    return getProductsRepo.getProducts();
  }

}