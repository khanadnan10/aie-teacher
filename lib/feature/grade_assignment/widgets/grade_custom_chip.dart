import 'package:aie_teacher/utils/colors.dart';
import 'package:flutter/material.dart';

class GradeCustomChip extends StatelessWidget {
  final int index;
  final int currentIndex;
  final VoidCallback onTap;
  final String text;
  const GradeCustomChip({
    Key? key,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: index == currentIndex ? AppColor.kPrimaryRed : null,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: index == currentIndex
                    ? AppColor.kWhite
                    : AppColor.kGreyDark,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? AppColor.kWhite.withOpacity(0.3)
                    : AppColor.kBlack.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              child: Text(
                '30',
                style: TextStyle(
                  fontSize: 12.0,
                  color: index == currentIndex
                      ? AppColor.kWhite
                      : AppColor.kGreyDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
