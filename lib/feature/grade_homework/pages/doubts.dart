// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/grade_homework/widgets/doubt_mcq_card_button.dart';
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/grade_assignment/widgets/grade_assignment_add_remark.dart';
import 'package:aie_teacher/feature/grade_homework/data/doubts.dart';
import 'package:aie_teacher/feature/received_assignments/widgets/received_assignment_rectangle_card.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/utils.dart';

class Doubts extends StatefulWidget {
  const Doubts({super.key});

  @override
  State<Doubts> createState() => _DoubtsState();
}

class _DoubtsState extends State<Doubts> {
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _mcqController = TextEditingController();

  int _currentSelectedAnswer =
      -1; // Initialize with -1 to represent none selected

  void selectOption(int value) {
    setState(() {
      if (_currentSelectedAnswer == value) {
        _currentSelectedAnswer = -1; // Deselect if already selected
      } else {
        _currentSelectedAnswer = value; // Select if not already selected
      }
    });
    print(value.toString());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _mcqController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Utils().sizedBox,
          // Doubt Card containing question and remark ----------------------------
          const ReceivedAssignmentRectangleCard(
            title: 'Tarun Kumar',
            isDoubtCard:
                true, // Extra check for the 'doubt' card of doubt section
            status: 'SIS/V/01',
            image: 'images/Img - 01.png',
            grades:
                '2 hour ago', // grade is being used here as the timeago string
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColor.kPrimaryRed.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              children: [
                const Text(
                  "Q1: Plaster of paris is prepared  by using which mixture?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
                //Time and marks ----------------
                Utils().sizedBox,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Marks: 4',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColor.kGreyDark,
                      ),
                    ),
                  ],
                ),
                Utils().sizedBox,
                // Question section --------------
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryRed.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Text(
                    'Plaster of paris is prepared by heating calcium sulfate dihydrate, or gypsum, to 120–180 °C (248–356 °F). With an additive to retard the set, it is called wall, or hard wall, plaster, which can provide passive fire protection for interior surfaces.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                // Given Marks --------
                Utils().sizedBox,
                GradeAssignmentAddRemark(
                  hintText: 'Add Remarks',
                  controller:
                      _textEditingController, // change controller for more
                ),
                Utils().sizedBox,
              ],
            ),
          ),
          Utils().sizedBox,
          // Doubt Card containing question, remark and mcq ----------------------------
          const ReceivedAssignmentRectangleCard(
            title: 'Sushil Tehran',
            isDoubtCard:
                true, // Extra check for the 'doubt' card of doubt section
            status: 'SIS/V/01',
            image: 'images/Img - 01.png',
            grades:
                '5 hour ago', // grade is being used here as the timeago string
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColor.kPrimaryRed.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              children: [
                const Text(
                  "Q1: Plaster of paris is prepared  by using which mixture?",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
                Utils().sizedBox,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Marks: 4',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColor.kGreyDark,
                      ),
                    ),
                  ],
                ),
                Utils().sizedBox,
                Column(
                  children: [
                    for (int i = 0; i < doubts.length; i++)
                      DoubtMcqCardButton(
                        text: doubts[i],
                        onTap: () => selectOption(i),
                        index: i,
                        currentIndex: _currentSelectedAnswer,
                      ),
                  ],
                ),
                GradeAssignmentAddRemark(
                  hintText: 'Add Remarks',
                  controller:
                      _textEditingController, // change controller for more
                ),
                Utils().sizedBox,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
