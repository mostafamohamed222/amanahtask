import 'package:amanahtask/features/home_page/domain/entity/user_entity.dart';
import 'package:amanahtask/features/home_page/presentation/widget/personal_data_info_line.dart';
import 'package:amanahtask/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resources/color_manager.dart';

class UserProfilePersonalSection extends StatelessWidget {
  const UserProfilePersonalSection({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorManager.textFormFieldGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           Text(
           LocaleKeys.personalData.tr(),
            style: const TextStyle(
              color: Color(0xFF2D4768),
              fontSize: 16,
              fontFamily: 'din',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(
            width: 90,
            child: Divider(
              color: ColorManager.mainColor,
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          UserProfileInfoLine(
            data: user.name,
            label: LocaleKeys.name.tr(),
          ),
          const SizedBox(
            height: 10,
          ),
          UserProfileInfoLine(
            label: LocaleKeys.email.tr(),
            data: user.email,
          ),
          const SizedBox(
            height: 10,
          ),
          UserProfileInfoLine(
            label: LocaleKeys.birthdate.tr(),
            data: user.birthdate.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          UserProfileInfoLine(
            label: LocaleKeys.gender.tr(),
            data: user.gender==1?LocaleKeys.boy.tr():LocaleKeys.girl.tr(),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
