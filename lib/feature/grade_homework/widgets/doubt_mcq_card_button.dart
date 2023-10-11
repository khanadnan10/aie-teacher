
import 'package:aie_teacher/utils/colors.dart';
import 'package:flutter/material.dart';

class DoubtMcqCardButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final int index;
  final int currentIndex;
  const DoubtMcqCardButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<DoubtMcqCardButton> createState() => _DoubtMcqCardButtonState();
}

class _DoubtMcqCardButtonState extends State<DoubtMcqCardButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: widget.index == widget.currentIndex
              ? AppColor.kPrimaryRed
              : AppColor.kPrimaryRed.withOpacity(0.4),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16.0,
                color: widget.index == widget.currentIndex
                    ? AppColor.kWhite
                    : AppColor.kBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
