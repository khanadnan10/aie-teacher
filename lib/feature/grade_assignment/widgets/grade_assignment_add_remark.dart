// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/utils.dart';

class GradeAssignmentAddRemark extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const GradeAssignmentAddRemark({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            color: AppColor.kGreyDark,
          ),
        ),
        Utils(height: 6).sizedBox,
        Container(
          padding: const EdgeInsets.all(12.0).copyWith(top: 0),
          decoration: BoxDecoration(
            color: AppColor.kWhite,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Add your comment here',
              border: InputBorder.none,
            ),
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
