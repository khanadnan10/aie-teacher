
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:flutter/material.dart';

class SectionType extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String text;
  final VoidCallback onTap;
  const SectionType({
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
      child: Text(
        text,
        style: index == currentIndex
            ? AppFont.kHeadingTextStyle.copyWith(
                fontSize: 16.0,
                color: AppColor.kBlack,
              )
            : AppFont.kHeadingTextStyle.copyWith(
                fontSize: 16.0,
                color: AppColor.kBlack.withOpacity(0.5),
              ),
      ),
    );
  }
}
