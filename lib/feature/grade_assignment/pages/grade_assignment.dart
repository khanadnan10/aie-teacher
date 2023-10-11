// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/grade_assignment/pages/all_grade_assignment.dart';
import 'package:aie_teacher/feature/grade_assignment/widgets/GradeAssignmentOutOfCard.dart';
import 'package:aie_teacher/feature/grade_assignment/widgets/grade_custom_chip.dart';
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/assigned_class/widgets/class_small_card.dart';
import 'package:aie_teacher/feature/grade_assignment/widgets/custom_appbar.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/utils.dart';

class GradeAssignment extends StatefulWidget {
  const GradeAssignment({super.key});

  @override
  State<GradeAssignment> createState() => _GradeAssignmentState();
}

class _GradeAssignmentState extends State<GradeAssignment> {
  int _currentIndex = 0;
  final PageController _gradeAssignmentPageController = PageController();
  List<Widget> gradeScreen = [
    const AllGradeAssignment(),
    const Center(child: Text('Correct')),
    const Center(child: Text('Incorrect')),
    const Center(child: Text('Unattempted')),
  ];
  List gradeScreenText = [
    'All',
    'Correct',
    'Incorrect',
    'Unattempted',
  ];

  @override
  void dispose() {
    _gradeAssignmentPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGradeAssignmentAppbar(
        text: 'Digestive system',
        onIconTap: () {
          //TODO: Check icon
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
          top: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Detail card for the side user
              DetailListCard(
                title: 'Meenal Sharma',
                role: 'SIS/V/01',
                image: 'images/profile.png',
                onCall: () {
                  //TODO: Call Functionality to be added
                },
                onMessage: () {
                  //TODO: Message Functionality to be added
                },
              ),
              Utils().sizedBox,
              // out of min and mm - time and favourite
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryRed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GradeAssignmentOutOfCard(
                      fromCount: '30',
                      toCount: '90',
                      format: 'min',
                      icon: Icon(
                        Icons.access_time_filled,
                        color: AppColor.kPrimaryRed,
                      ),
                    ),
                    GradeAssignmentOutOfCard(
                      fromCount: '0',
                      toCount: '30',
                      format: 'mm',
                      icon: Icon(
                        Icons.stars,
                        color: AppColor.kPrimaryRed,
                      ),
                    ),
                  ],
                ),
              ),
              Utils().sizedBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0;
                        i < gradeScreen.length;
                        i++) // ------- Add more by adding in the list of gradeScreen if need -----
                      Row(
                        children: [
                          GradeCustomChip(
                            index: i,
                            currentIndex: _currentIndex,
                            onTap: () {
                              setState(() {
                                _currentIndex = i;
                              });
                              _gradeAssignmentPageController
                                  .jumpToPage(_currentIndex);
                            },
                            text: gradeScreenText[i],
                          ),
                          Utils(width: 15).sizedBox,
                        ],
                      ),
                  ],
                ),
              ),
              Utils().sizedBox,
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _gradeAssignmentPageController,
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  itemCount: gradeScreen.length,
                  itemBuilder: (context, index) {
                    return gradeScreen[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
