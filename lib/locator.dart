import 'package:flutter_nusantech/provider/CalculatorProvider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {



  //services


  // provider
  locator.registerFactory(() => CalculatorProvider());
}
