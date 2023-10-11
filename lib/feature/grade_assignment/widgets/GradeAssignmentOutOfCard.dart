
import 'package:aie_teacher/utils/colors.dart';
import 'package:flutter/material.dart';

class GradeAssignmentOutOfCard extends StatelessWidget {
  final Icon icon;
  final String fromCount;
  final String toCount;
  final String format;
  const GradeAssignmentOutOfCard({
    Key? key,
    required this.icon,
    required this.fromCount,
    required this.toCount,
    required this.format,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '$fromCount ', // include spacing in all fields to not include extra spaces explicitly
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kBlack,
                ),
              ),
              const TextSpan(
                text:
                    'out of ', // include spacing in all fields to not include extra spaces explicitly
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
              TextSpan(
                text:
                    '$toCount ', // include spacing in all fields to not include extra spaces explicitly
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kBlack,
                ),
              ),
              TextSpan(
                text:
                    format, // include spacing in all fields to not include extra spaces explicitly
                style: const TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
