// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aie_teacher/utils/colors.dart';

class GivenMarksButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final int index;
  final int currentIndex;

  const GivenMarksButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<GivenMarksButton> createState() => _GivenMarksButtonState();
}

class _GivenMarksButtonState extends State<GivenMarksButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: widget.index == widget.currentIndex
              ? AppColor.kPrimaryRed
              : AppColor.kGreyDark.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 16.0,
            color: widget.index == widget.currentIndex
                ? AppColor.kWhite
                : AppColor.kGreyDark,
          ),
        ),
      ),
    );
  }
}
