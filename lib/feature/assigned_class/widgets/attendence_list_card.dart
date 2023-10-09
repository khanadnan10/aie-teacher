import 'package:flutter/material.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';

class AttendenceListCard extends StatelessWidget {
  final String title;
  final String role;
  final String image;
  final bool isDetailListCard;
  final String presentCount;
  final String absentCount;
  const AttendenceListCard({
    Key? key,
    required this.title,
    required this.role,
    required this.image,
    this.isDetailListCard = false,
    required this.presentCount,
    required this.absentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: !isDetailListCard
              ? Border.all(
                  width: 2,
                  color: AppColor.kPrimaryRed,
                )
              : null,
          color: isDetailListCard ? AppColor.kDetailCardRed : null,
          borderRadius: BorderRadius.circular(50.0)),
      margin: isDetailListCard ? const EdgeInsets.symmetric(vertical: 5) : null,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              image,
            ),
            radius: 25,
          ),
          Utils(width: 5).sizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFont.kHeadingTextStyle.copyWith(fontSize: 16.0),
                ),
                Text(
                  role,
                  style: AppFont.kbodyTextStyle.copyWith(
                    fontSize: 12.0,
                    color: AppColor.kBlack.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        presentCount,
                        style: AppFont.kHeadingTextStyle.copyWith(
                          color: AppColor.kBrightRed,
                        ),
                      ),
                      Text(
                        'Present',
                        style: AppFont.kbodyTextStyle.copyWith(
                          color: AppColor.kGreyDark,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        absentCount,
                        style: AppFont.kHeadingTextStyle.copyWith(
                          color: AppColor.kDarkGreen,
                        ),
                      ),
                      Text(
                        'Absent',
                        style: AppFont.kbodyTextStyle.copyWith(
                          color: AppColor.kGreyDark,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
