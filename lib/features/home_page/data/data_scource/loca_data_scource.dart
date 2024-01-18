import '../../../../core/helper/isar_database/isar_helper.dart';
import '../../../../core/utils/di/injection.dart';
import '../../domain/entity/user_entity.dart';

abstract class BaseDataScource {
  Future<bool> addUserToLocalDataBase(UserEntity user);
  Future<void> removeUserToLocalDataBase();
}

class DataScource extends BaseDataScource {
  @override
  Future<bool> addUserToLocalDataBase(UserEntity user) async {
    return sl<IasrHelper>().put(user);
  }

  @override
  Future<void> removeUserToLocalDataBase() async {
    return sl<IasrHelper>().clear();
  }
}
