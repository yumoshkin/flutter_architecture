import 'package:model_package/model_package.dart';

abstract class UserService {
  Future<UserData> getDefaultUser();
  Future<UserData> getUserById(int id);
}
