import 'package:aie_teacher/feature/received_assignments/pages/all_received_assignment.dart';
import 'package:aie_teacher/feature/received_assignments/widgets/received_assignment_chip.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class ReceivedAssignments extends StatefulWidget {
  const ReceivedAssignments({super.key});

  @override
  State<ReceivedAssignments> createState() => _ReceivedAssignmentsState();
}

class _ReceivedAssignmentsState extends State<ReceivedAssignments> {
  int _currentIndex = 0;
  final PageController _receivedAssignmentPageController = PageController();

  @override
  void dispose() {
    _receivedAssignmentPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: kTextTabBarHeight + 30,
        leading: GestureDetector(
          onTap: () {
            //Navigation to popped page
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: AppColor.kWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColor.kBrightRed,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          _receivedAssignmentAppbar(
            'Homework Class IV-C', // homework for the class
            'Digistive system', // topic of the homework
          ), // Upper appbar part containing image and title of the homework
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ReceivedAssignmentChip(
                  index: 0,
                  currentIndex: _currentIndex,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                    _receivedAssignmentPageController.jumpToPage(_currentIndex);
                  },
                  text: 'All',
                ),
                Utils(width: 5).sizedBox,
                ReceivedAssignmentChip(
                  index: 1,
                  currentIndex: _currentIndex,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                    _receivedAssignmentPageController.jumpToPage(_currentIndex);
                  },
                  text: 'Need Grading',
                ),
                Utils(width: 5).sizedBox,
                ReceivedAssignmentChip(
                  index: 2,
                  currentIndex: _currentIndex,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                    _receivedAssignmentPageController.jumpToPage(_currentIndex);
                  },
                  text: 'Late submissions',
                ),
                Utils(width: 5).sizedBox,
              ],
            ),
          ),
          Utils().sizedBox,
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _receivedAssignmentPageController,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                List<Widget> screen = [
                  const AllReceivedAssignments(),
                  const Center(child: Text('Need Grading')),
                  const Center(child: Text('Late submissions')),
                ];
                return screen[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _receivedAssignmentAppbar(String homework, String topic) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: kToolbarHeight + 50.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        color: Colors.amber,
        gradient: LinearGradient(
          colors: [
            Color(0xffCC6675),
            Color(0xffB93549),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homework,
                  style: AppFont.kbodyTextStyle.copyWith(
                    color: AppColor.kWhite,
                  ),
                ),
                Text(
                  topic,
                  style: AppFont.kHeadingTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.kWhite,
                  ),
                ),
              ],
            ),
            const Flexible(
              child: Image(
                image:
                    AssetImage('images/pablo-education 1grading_work_img.png'),
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
