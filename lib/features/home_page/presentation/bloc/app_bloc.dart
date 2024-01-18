import 'dart:async';

import 'package:amanahtask/core/helper/geolocator/geolocator_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/di/injection.dart';
import '../../../../core/utils/resources/routes_manager.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecase/add_user_data.dart';
import '../../domain/usecase/remove_user_data.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<SubmitUserDataEvent>(_submitUserData);
    on<OpenLocationOnMap>(_openLocation);
    on<RemoveUserEvent>(_removeUser);
    on<ChangeLangEvent>(_changeLan);
  }

  static final AppBloc _appBloc =
      BlocProvider.of(sl<NavigatorManager>().navigatorKey.currentContext!);
  static AppBloc get appBlocInstance => _appBloc;

  FutureOr<void> _submitUserData(
      SubmitUserDataEvent event, Emitter<AppState> emit) async {
    emit(state.copyWith(isLoading: true));
    // get current location
    LatLng? currentLocation =
        await sl<GeolocatorHelper>().getMyCurrentLocation();

    // create User entity
    UserEntity userData = UserEntity(
        birthdate: event.birthdate,
        email: event.email,
        gender: event.gender,
        lat: currentLocation!.latitude,
        long: currentLocation.longitude,
        name: event.name,
        password: event.password);

    // add user to local Data base
    AddUserToLocalDataBaseUseCase addUserUsecase =
        AddUserToLocalDataBaseUseCase(sl());
    bool userAdded = await addUserUsecase.call(user: userData);

    if (userAdded) {
      // go to profile page
      sl<NavigatorManager>().pushReplacementNamed(Routes.profilePage);

      // update state
      emit(state.copyWith(profileUser: userData, isLoading: false));
    } else {
      sl<NavigatorManager>().pop();
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _openLocation(
      OpenLocationOnMap event, Emitter<AppState> emit) {
    sl<GeolocatorHelper>()
        .openLocationOnMap(state.profileUser!.lat, state.profileUser!.long);
  }

  FutureOr<void> _removeUser(
      RemoveUserEvent event, Emitter<AppState> emit) async {
    RemoveUserToLocalDataBaseUseCase removeUserUsecase =
        RemoveUserToLocalDataBaseUseCase(sl());

    removeUserUsecase.call();

    // change user data to null
    emit(state.copyWith(profileUser: null));

    sl<NavigatorManager>().pushReplacementNamed(Routes.homePage);
  }

  FutureOr<void> _changeLan(ChangeLangEvent event, Emitter<AppState> emit) {
    String lang =
        sl<NavigatorManager>().navigatorKey.currentContext!.locale.languageCode;
    if (lang == 'ar') {
      sl<NavigatorManager>()
          .navigatorKey
          .currentContext!
          .setLocale(const Locale("en"));
    } else {
      sl<NavigatorManager>()
          .navigatorKey
          .currentContext!
          .setLocale(const Locale("ar"));
    }
    emit(state.copyWith(
        lang: sl<NavigatorManager>()
            .navigatorKey
            .currentContext!
            .locale
            .languageCode));
  }
}
