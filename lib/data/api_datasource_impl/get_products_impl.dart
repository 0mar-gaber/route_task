import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/api/api_manager.dart';
import 'package:route_task/data/api_datasource_contract/get_products.dart';
import 'package:route_task/data/models/Product.dart';

import '../../core/api/end_points.dart';
@Injectable(as: GetProducts)
class GetProductsImpl extends GetProducts{
  ApiManager apiManager ;
  @factoryMethod
  GetProductsImpl(this.apiManager);
  @override
  Future<Either<Product, String>> getProducts() async {
    try{
      var response = await apiManager.getRequest(endPoint: EndPoint.productsEndPoint,queryParameters: {
        "limit":"199",
      });
      var productResponse = Product.fromJson(response);
      return Left(productResponse);

    }catch(error){
      return Right(error.toString());
    }
  }

}