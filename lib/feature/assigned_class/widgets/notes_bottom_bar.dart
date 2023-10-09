
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class NotesBottomBar extends StatelessWidget {
  const NotesBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.kLightRed,
              hintText: 'Type here',
              contentPadding: const EdgeInsets.all(12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Utils(width: 5).sizedBox,
        GestureDetector(
          onTap: () {
            //TODO: Type your notes
          },
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.kPrimaryRed,
            ),
            child: const Center(
              child: Icon(
                Icons.send,
                color: AppColor.kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
