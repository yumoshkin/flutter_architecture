import 'package:injectable/injectable.dart';

import 'package:data_package/src/api/services.dart';
import 'package:model_package/model_package.dart';

@LazySingleton(as: UserService)
class DummyUserService implements UserService {
  @override
  Future<UserData> getDefaultUser() async {
    await Future<dynamic>.delayed(
      Duration(
        milliseconds: 1500,
      ),
    );

    return UserData(id: 1, name: 'Default user');
  }

  @override
  Future<UserData> getUserById(int id) async {
    await Future<dynamic>.delayed(
      Duration(
        milliseconds: 500,
      ),
    );

    return UserData(id: id, name: 'User number $id');
  }
}
