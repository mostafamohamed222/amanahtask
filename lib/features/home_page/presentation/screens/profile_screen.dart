import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';
import '../widget/button.dart';
import '../widget/change_lan_widget.dart';
import '../widget/personal_data_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorManager.whiteColor,
          appBar: AppBar(
            backgroundColor: ColorManager.mainColor,
            title: Text(
              LocaleKeys.proflie.tr(),
              style: const TextStyle(color: ColorManager.whiteColor),
            ),
            centerTitle: true,
            leading: ChangeLang(),
          ),
          body: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Column(
                children: [
                  UserProfilePersonalSection(
                    user: state.profileUser!,
                  ),
                  ButtonWidget(
                    onTap: () {
                      AppBloc.appBlocInstance.add(OpenLocationOnMap());
                    },
                    label: LocaleKeys.openMap.tr(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    onTap: () {
                      AppBloc.appBlocInstance.add(RemoveUserEvent());
                    },
                    label: LocaleKeys.newUser.tr(),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
