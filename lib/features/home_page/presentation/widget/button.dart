import 'package:flutter/material.dart';

import '../../../../core/utils/resources/color_manager.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key , required this.label , this.onTap});
  final String label;
  void Function()? onTap = (){};
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * .9,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorManager.mainColor),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: ColorManager.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
