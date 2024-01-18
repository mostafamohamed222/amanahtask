import 'package:get_it/get_it.dart';

import '../../../features/home_page/data/data_scource/loca_data_scource.dart';
import '../../../features/home_page/data/repo/repo.dart';
import '../../../features/home_page/domain/repo/repo_base.dart';
import '../../helper/geolocator/geolocator_helper.dart';
import '../../helper/isar_database/isar_helper.dart';
import '../resources/routes_manager.dart';

final sl = GetIt.instance;

class ServiesLoctor {
  static void init() {
    // isar helper
    sl.registerSingleton<IasrHelper>(IasrHelper());
    // Geolocator Helper
    sl.registerSingleton<GeolocatorHelper>(GeolocatorHelper());

    // navigator
    sl.registerLazySingleton(
      () => NavigatorManager(),
    );

    // data Scource
    sl.registerLazySingleton<BaseDataScource>(() => DataScource());

    // repo
    sl.registerLazySingleton<AppRepoBase>(() => AppRepo(sl()));
  }
}
