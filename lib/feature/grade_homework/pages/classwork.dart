import 'package:aie_teacher/feature/grade_homework/pages/classwork_homework.dart';
import 'package:aie_teacher/feature/grade_homework/pages/doubts.dart';
import 'package:aie_teacher/feature/grade_homework/widgets/classwork_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:aie_teacher/utils/colors.dart';

class Classwork extends StatefulWidget {
  const Classwork({super.key});

  @override
  State<Classwork> createState() => _ClassworkState();
}

class _ClassworkState extends State<Classwork> {
  int _currentIndex = 0;
  final PageController _classworkPageController = PageController();
  List<Widget> classworkScreens = [
    const ClassworkHomework(),
    const Center(child: Text('Exams')),
    const Doubts(),
  ];

  @override
  void dispose() {
    _classworkPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: kToolbarHeight,
        title: const Text(
          'Create class & section',
          style: TextStyle(
            color: AppColor.kGreyDark,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            //TODO: Pop navigation
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.kPrimaryRed,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0).copyWith(
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              decoration: BoxDecoration(
                color: AppColor.kLightRed,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ClassworkToggleSwitch(
                      index: 0,
                      currentIndex: _currentIndex,
                      text: 'Homework',
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                        _classworkPageController.jumpToPage(_currentIndex);
                      },
                    ),
                  ),
                  Expanded(
                    child: ClassworkToggleSwitch(
                      index: 1,
                      currentIndex: _currentIndex,
                      text: 'Exams',
                      onTap: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                        _classworkPageController.jumpToPage(_currentIndex);
                      },
                    ),
                  ),
                  Expanded(
                    child: ClassworkToggleSwitch(
                      index: 2,
                      currentIndex: _currentIndex,
                      text: 'Doubts',
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                        _classworkPageController.jumpToPage(_currentIndex);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _classworkPageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemCount: classworkScreens.length,
                itemBuilder: (context, index) {
                  return classworkScreens[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
