import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/api_datasource_contract/get_products.dart';
import 'package:route_task/domain/entities/Products.dart';
import 'package:route_task/domain/repository_contract/get_products_repo.dart';

@Injectable(as: GetProductsRepo)
class GetProductsRepoImpl extends GetProductsRepo {
  GetProducts getProductsImpl ;
  @factoryMethod
  GetProductsRepoImpl(this.getProductsImpl);
  @override
  Future<Either<List<ProductsEntity>, String>> getProducts() async {
    var result = await getProductsImpl.getProducts();
    return result.fold(
        (response) {
          var responseList = response.products??[] ;
          var allProducts = responseList.map((product)=>ProductsEntity(
            id: product.id,
            title: product.title,
            price: product.price,
            description: product.description,
            discountPercentage: product.discountPercentage,
            rating: product.rating,
            thumbnail: product.thumbnail
          )).toList();
          return Left(allProducts) ;
        },
        (error) => Right(error)
    );
  }

}