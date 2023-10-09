import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class ClassStudentAttedenceCard extends StatelessWidget {
  final String image;
  final String title;
  final String role;
  final String percent;
  final String presentCount;
  final String absentCount;
  const ClassStudentAttedenceCard({
    Key? key,
    required this.image,
    required this.title,
    required this.role,
    required this.percent,
    required this.presentCount,
    required this.absentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColor.kDetailCardRed,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  image,
                ),
                radius: 25,
              ),
              Text(
                '$percent%',
                style: AppFont.kHeadingTextStyle.copyWith(
                  color: AppColor.kBrightRed,
                ),
              ),
            ],
          ),
          Utils(height: 10).sizedBox,
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
          Utils(height: 30).sizedBox,
          Row(
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
          )
        ],
      ),
    );
  }
}
