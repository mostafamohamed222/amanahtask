class UserEntity {
  String name;
  String password;
  String email;
  int gender;
  String birthdate;
  double lat;
  double long;

  UserEntity({
    required this.birthdate,
    required this.email,
    required this.gender,
    required this.lat,
    required this.long,
    required this.name,
    required this.password,
  });
}
