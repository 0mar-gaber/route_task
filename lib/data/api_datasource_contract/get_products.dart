import 'package:dartz/dartz.dart';
import 'package:route_task/data/models/Product.dart';

abstract class GetProducts {
  Future<Either<Product,String>> getProducts();
}