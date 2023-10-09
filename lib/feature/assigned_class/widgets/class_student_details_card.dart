
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class ClassStudentDetailsCard extends StatelessWidget {
  final String image;
  final String name;
  final String role;
  final String fathersName;
  final String age;
  final String gender;

  const ClassStudentDetailsCard({
    Key? key,
    required this.image,
    required this.name,
    required this.role,
    required this.fathersName,
    required this.age,
    required this.gender,
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //TODO: On call tap
                    },
                    icon: const Icon(
                      Icons.call,
                      color: AppColor.kPrimaryRed,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO: On call tap
                    },
                    icon: const Icon(
                      Icons.messenger,
                      color: AppColor.kPrimaryRed,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Utils(height: 10).sizedBox,
          Text(
            name,
            style: AppFont.kHeadingTextStyle.copyWith(fontSize: 16.0),
          ),
          Text(
            role,
            style: AppFont.kbodyTextStyle.copyWith(
              fontSize: 12.0,
              color: AppColor.kBlack.withOpacity(0.5),
            ),
          ),
          Utils(height: 10).sizedBox,
          Text(
            fathersName,
            style: AppFont.kHeadingTextStyle.copyWith(
              fontSize: 12.0,
            ),
          ),
          Text(
            "Father’s Name",
            style: AppFont.kbodyTextStyle.copyWith(
              fontSize: 12.0,
              color: AppColor.kBlack.withOpacity(0.5),
            ),
          ),
          Utils(height: 10).sizedBox,
          Text(
            age,
            style: AppFont.kHeadingTextStyle.copyWith(
              fontSize: 12.0,
            ),
          ),
          Text(
            "Age",
            style: AppFont.kbodyTextStyle.copyWith(
              fontSize: 12.0,
              color: AppColor.kBlack.withOpacity(0.5),
            ),
          ),
          Utils(height: 10).sizedBox,
          Text(
            gender,
            style: AppFont.kHeadingTextStyle.copyWith(
              fontSize: 12.0,
            ),
          ),
          Text(
            "Gender",
            style: AppFont.kbodyTextStyle.copyWith(
              fontSize: 12.0,
              color: AppColor.kBlack.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
