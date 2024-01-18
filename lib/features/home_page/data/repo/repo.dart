import 'package:amanahtask/features/home_page/domain/entity/user_entity.dart';

import '../../domain/repo/repo_base.dart';
import '../data_scource/loca_data_scource.dart';

class AppRepo extends AppRepoBase {
  AppRepo(this.dataScource);
  BaseDataScource dataScource;

  @override
  Future<bool> addUserToLocalDataBase(UserEntity user) async {
    return dataScource.addUserToLocalDataBase(user);
  }

  @override
  Future<void> removeUserToLocalDataBase() async {
    return dataScource.removeUserToLocalDataBase();
  }
}
