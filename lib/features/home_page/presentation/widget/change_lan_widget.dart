import 'package:amanahtask/features/home_page/presentation/bloc/app_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../generated/locale_keys.g.dart';
import '../bloc/app_event.dart';

class ChangeLang extends StatelessWidget {
  ChangeLang({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppBloc.appBlocInstance.add(ChangeLangEvent());
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          LocaleKeys.lang.tr(),
          style: const TextStyle(
              color: ColorManager.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
