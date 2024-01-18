import 'dart:async';
import 'dart:io';

import 'package:amanahtask/features/home_page/domain/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/user_collections.dart';

class IasrHelper {
  late Future<Isar> db;

  IasrHelper() {
    db = openDB();
  }

  Future<bool> put(UserEntity user) async {
    try {
      final iser = await db;
      UserCollection ret = UserCollection()
        ..email = user.email
        ..name = user.name
        ..gender = user.gender
        ..birthdate = user.birthdate
        ..lat = user.lat
        ..long = user.long
        ..password = user.password;
      await iser.writeTxn(() async => await iser.userCollections.put(ret));
      return true;
    } catch (e) {
      debugPrint("Isar Error Exception");
      debugPrint(e.toString());
      return false;
    }
  }

  Future get(String key) async {
    // final iser = await db;
    // final f = await _basicErrorHandling(() async {
    //   try {
    //     var data =
    //         jsonDecode(iser.saveDataModels.getByKeySync(key)!.value.toString());

    //     // var data =  jsonDecode(iser.saveDataModels.filter().keyEqualTo("nabawy").findFirstSync()!.value.toString());
    //     //debugPrint("theeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    //     //debugPrint(data);
    //     //debugPrint("theeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    //     return data;
    //   } catch (e) {
    //     return null;
    //   }
    // });
    // return f;
  }

  Future clear() async {
    final isar = await db;
    final f = await _basicErrorHandling(() async {
      try {
        await isar.writeTxn(() async {
          await isar.userCollections.clear();
        });
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    });
    return f;
  }

  Future resetData() async {
    final isar = await db;
    final f = await _basicErrorHandling(() async {
      try {
        await isar.writeTxn(() async {
          await isar.userCollections.clear();
        });
      } catch (e) {
        debugPrint(e.toString());
        return null;
      }
    });
    return f;
  }

  Directory? externalDirectory;
  Future<void> getExternalStorage() async {
    if (Platform.isIOS) {
      externalDirectory = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      externalDirectory = await getExternalStorageDirectory();
    } else {
      externalDirectory = await getApplicationSupportDirectory();
    }
  }

  Future<Isar> openDB() async {
    await getExternalStorage();
    if (Isar.instanceNames.isEmpty) {
      await Isar.open(
        [UserCollectionSchema],
        inspector: true,
        maxSizeMiB: 500,
        directory: externalDirectory!.path,
      );
    }
    return Future.value(Isar.getInstance());
  }
}

extension on IasrHelper {
  Future<T> _basicErrorHandling<T>(Future<T> Function() onSuccess) async {
    try {
      final f = await onSuccess.call();
      return f;
    } catch (e) {
      throw Exception();
    }
  }
}
