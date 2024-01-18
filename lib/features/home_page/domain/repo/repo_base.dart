import 'package:amanahtask/features/home_page/domain/entity/user_entity.dart';

abstract class AppRepoBase {
  Future<bool> addUserToLocalDataBase(UserEntity user);
  Future<void> removeUserToLocalDataBase();
}
