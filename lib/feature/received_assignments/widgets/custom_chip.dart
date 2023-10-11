import 'package:aie_teacher/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color color;
  const CustomChip({
    Key? key,
    required this.onTap,
    required this.text,
    this.color = const Color(0xffFBD900),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5).copyWith(left: 0),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.kWhite,
          border: Border.all(
            color: color,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
