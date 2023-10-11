
import 'package:aie_teacher/utils/colors.dart';
import 'package:flutter/material.dart';

class ClassworkToggleSwitch extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final VoidCallback onTap;
  const ClassworkToggleSwitch({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:
              index == currentIndex ? AppColor.kPrimaryRed : Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: index == currentIndex ? AppColor.kWhite : AppColor.kGreyDark,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
