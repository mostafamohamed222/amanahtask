import 'package:flutter/material.dart';

class UserProfileInfoLine extends StatelessWidget {
  const UserProfileInfoLine(
      {super.key, required this.data, required this.label});

  final String data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          data,
          style: const TextStyle(
            color: Color(0xFF2B4868),
            fontSize: 14,
            fontFamily: 'din',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const Spacer(),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFB0B0B0),
            fontSize: 12,
            fontFamily: 'din',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
