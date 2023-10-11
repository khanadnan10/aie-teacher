// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/grade_homework/widgets/custom_appbar.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';

class GradeHome extends StatelessWidget {
  const GradeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        image: 'images/bg.png',
        profileImage: 'images/Profile man.png',
        onMessage: () {
          //TODO: onMessage to notification
        },
        onNotification: () {
          //TODO: onNotification to notification
        },
        onSearch: () {
          //TODO: onSearch to notification
        },
        onTap: () {
          //TODO: App bar action
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Class Homework',
              style: AppFont.kHeadingTextStyle.copyWith(
                fontSize: 16.0,
              ),
            ),
            Utils().sizedBox,
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 50,
                  mainAxisExtent: 200,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return const ClassHomeworkCard(
                    // Pass the values to full fill dynamic data
                    className: 'Class IV-C',
                    subject: 'Science',
                    studentCount: '42',
                    image: 'images/Img - 01.png',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClassHomeworkCard extends StatelessWidget {
  final String className;
  final String subject;
  final String studentCount;
  final String image;
  const ClassHomeworkCard({
    Key? key,
    required this.className,
    required this.subject,
    required this.studentCount,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('images/image 34.png'),
              opacity: 0.4,
              fit: BoxFit.cover,
            ),
            color: AppColor.kPrimaryRed,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Column(
            children: [
              Text(
                className,
                style: AppFont.kbodyTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.kWhite,
                ),
              ),
              Text(
                subject,
                style: AppFont.kHeadingTextStyle.copyWith(
                  color: AppColor.kWhite,
                ),
              ),
              Utils(height: 30).sizedBox,
              Text(
                '$studentCount Students',
                style: AppFont.kHeadingTextStyle.copyWith(
                  fontSize: 12.0,
                  color: AppColor.kWhite,
                ),
              ),
              Utils().sizedBox,
            ],
          ),
        ),
        Positioned(
          left: 50,
          bottom: -30,
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: const BoxDecoration(
              color: AppColor.kWhite,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: AppColor.kWhite,
              backgroundImage: AssetImage(image),
              radius: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
