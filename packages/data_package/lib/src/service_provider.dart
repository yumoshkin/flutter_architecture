import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:data_package/src/service_provider.config.dart';

@InjectableInit()
void initializeServices() => $initGetIt(GetIt.I);
