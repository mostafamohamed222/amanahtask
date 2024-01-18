import 'package:amanahtask/features/home_page/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AppState extends Equatable {
  UserEntity? profileUser;
  String? lang;
  bool isLoading;

  AppState({this.profileUser, this.lang, this.isLoading = false});

  AppState copyWith({UserEntity? profileUser, String? lang, bool? isLoading}) {
    return AppState(
      profileUser: profileUser ?? this.profileUser,
      lang: lang ?? this.lang,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [profileUser, lang,isLoading];
}
