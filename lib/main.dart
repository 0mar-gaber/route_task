import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/DI/BlocObserver.dart';
import 'core/DI/di.dart';
import 'core/api/api_manager.dart';
import 'my_app.dart';

void main(){
  configureDependencies();
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

