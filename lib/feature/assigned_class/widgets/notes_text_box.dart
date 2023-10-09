
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class NotesTextBox extends StatelessWidget {
  final String notes;
  final String timeAgo;

  const NotesTextBox({
    Key? key,
    required this.notes,
    required this.timeAgo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: AppColor.kLightRed,
          ),
          child: Text(
            notes,
            style: AppFont.kbodyTextStyle.copyWith(
              color: AppColor.kGreyDark,
            ),
          ),
        ),
        Text(
          timeAgo,
          style: AppFont.kbodyTextStyle.copyWith(
            color: AppColor.kGreyDark,
            fontSize: 8.0,
          ),
        ),
        Utils().sizedBox,
      ],
    );
  }
}
