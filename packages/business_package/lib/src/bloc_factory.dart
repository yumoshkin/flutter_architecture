import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:business_package/src/bloc_factory.config.dart';

import 'package:data_package/data_package.dart';

@InjectableInit()
void initializeBloc() {
  initializeServices();
  $initGetIt(GetIt.I);
}
