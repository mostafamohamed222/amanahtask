import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../generated/locale_keys.g.dart';

class LableInput extends StatelessWidget {
  const LableInput({super.key , this.controller , required this.input , this.validate});
  final TextEditingController? controller;
  final String input;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          input,
          style: const TextStyle(
              color: ColorManager.blueTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            // suffixIcon: Image.asset(LogoManager.user),
            filled: true,
            fillColor: ColorManager.textFormFieldGrey,
            hintText: "${LocaleKeys.enter.tr()} $input",
            hintStyle: const TextStyle(
              color: ColorManager.grey,
              fontSize: 16,
              fontFamily: "din",
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator: validate
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
