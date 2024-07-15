// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_datasource_contract/get_products.dart' as _i4;
import '../../data/api_datasource_impl/get_products_impl.dart' as _i5;
import '../../data/repository_impl/get_products_repo_impl.dart' as _i7;
import '../../domain/repository_contract/get_products_repo.dart' as _i6;
import '../../domain/use_cases/get_products_case.dart' as _i8;
import '../../presentation/screens/product_view_model.dart' as _i9;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.GetProducts>(
        () => _i5.GetProductsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.GetProductsRepo>(
        () => _i7.GetProductsRepoImpl(gh<_i4.GetProducts>()));
    gh.factory<_i8.GetProductsCase>(
        () => _i8.GetProductsCase(gh<_i6.GetProductsRepo>()));
    gh.factory<_i9.ProductViewModel>(
        () => _i9.ProductViewModel(gh<_i8.GetProductsCase>()));
    return this;
  }
}
