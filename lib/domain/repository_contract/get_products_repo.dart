import 'package:dartz/dartz.dart';
import 'package:route_task/domain/entities/Products.dart';

import '../../data/models/Product.dart';

abstract class GetProductsRepo {
  Future<Either<List<ProductsEntity>,String>> getProducts();
}