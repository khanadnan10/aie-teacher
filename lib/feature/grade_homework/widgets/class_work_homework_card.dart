
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class ClassworkHomeworkCard extends StatelessWidget {
  final String subjectName;
  final String sent;
  final String status;
  final String submissionCount;
  final String homeworkTitle;
  final String homweworkbody;
  const ClassworkHomeworkCard({
    Key? key,
    required this.subjectName,
    required this.sent,
    required this.status,
    required this.submissionCount,
    required this.homeworkTitle,
    required this.homweworkbody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        gradient: AppColor.kPinkGradient,
        borderRadius: BorderRadius.circular(24.0),
        image: const DecorationImage(
          image: AssetImage(
            'images/image 36teacher_work_mask.png',
          ),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subjectName,
                    style: AppFont.kHeadingTextStyle.copyWith(
                      fontSize: 12.0,
                      color: AppColor.kWhite,
                    ),
                  ),
                  Text(
                    sent,
                    style: AppFont.kbodyTextStyle.copyWith(
                      fontSize: 8.0,
                      color: AppColor.kWhite,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    status,
                    style: AppFont.kHeadingTextStyle.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w800,
                      color: AppColor.kWhite,
                    ),
                  ),
                  Text(
                    submissionCount,
                    style: AppFont.kbodyTextStyle.copyWith(
                      fontSize: 8.0,
                      color: AppColor.kWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Utils().sizedBox,
          Text(
            homeworkTitle,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColor.kWhite,
            ),
          ),
          Text(
            homweworkbody,
            style: const TextStyle(
              fontSize: 12.0,
              color: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
