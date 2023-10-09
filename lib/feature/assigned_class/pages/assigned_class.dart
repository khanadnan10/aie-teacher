// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/assigned_class/pages/class_student.dart';
import 'package:aie_teacher/feature/assigned_class/pages/notes.dart';
import 'package:aie_teacher/feature/assigned_class/widgets/section_type.dart';
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/assigned_class/widgets/class_small_card.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';

class AssignedClass extends StatefulWidget {
  const AssignedClass({super.key});

  @override
  State<AssignedClass> createState() => _AssignedClassState();
}

class _AssignedClassState extends State<AssignedClass> {
  int _currentIndex = 0;
  final PageController _sectionTypePageController = PageController();
  List<String> sectionType = [
    'Class Students',
    'Notes',
  ];

  @override
  void dispose() {
    _sectionTypePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            kToolbarHeight + 30), // extending the height of the appbar
        child: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColor.kPrimaryRed,
            ),
          ),
          toolbarHeight: kToolbarHeight +
              10, // extending the height of the appbar for clear visibility of text for class
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'IV-C',
                  style: TextStyle(
                    fontSize: 80.0, // Adjust the font size as needed
                    fontWeight: FontWeight.w700,
                    color: AppColor.kPrimaryRed.withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Science',
              style: AppFont.kHeadingTextStyle,
            ),
            Utils().sizedBox,
            DetailListCard(
              title: 'Chandan Nunia',
              role: 'Class Representative',
              image: 'images/Profile man.png',
              onCall: () {
                //TODO: Call Functionality to be added
              },
              onMessage: () {
                //TODO: Message Functionality to be added
              },
            ),
            Utils().sizedBox,
            Row(
              children: [
                for (int i = 0;
                    i < sectionType.length;
                    i++) // ------- Add more by adding in the list of sectionType if need -----
                  Row(
                    children: [
                      SectionType(
                        text: sectionType[i],
                        index: i,
                        currentIndex: _currentIndex,
                        onTap: () {
                          setState(() {
                            _currentIndex = i;
                          });
                          _sectionTypePageController.jumpToPage(_currentIndex);
                        },
                      ),
                      Utils(width: 15).sizedBox,
                    ],
                  ),
              ],
            ),
            Utils().sizedBox,
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _sectionTypePageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  List<Widget> screen = [
                    const ClassStudent(),
                    const Notes(),
                  ];
                  return screen[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
