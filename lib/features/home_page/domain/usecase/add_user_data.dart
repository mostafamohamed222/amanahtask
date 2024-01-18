import 'package:amanahtask/features/home_page/domain/entity/user_entity.dart';

import '../repo/repo_base.dart';

class AddUserToLocalDataBaseUseCase {
  AppRepoBase repo;
  AddUserToLocalDataBaseUseCase(this.repo);

  Future<bool> call({required UserEntity user}) async {
    return await repo.addUserToLocalDataBase(user);
  }
}
