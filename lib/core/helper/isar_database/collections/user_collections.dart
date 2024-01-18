import 'package:isar/isar.dart';

part 'user_collections.g.dart';

@Collection()
class UserCollection {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  late String name;
  late String password;
  late String email;
  late int gender;
  late String birthdate;
  late double lat;
  late double long;
}
