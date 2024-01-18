
import '../repo/repo_base.dart';

class RemoveUserToLocalDataBaseUseCase {
  AppRepoBase repo;
  RemoveUserToLocalDataBaseUseCase(this.repo);

  Future<void> call() async {
    return await repo.removeUserToLocalDataBase();
  }
}
