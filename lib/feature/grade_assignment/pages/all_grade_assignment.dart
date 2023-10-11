// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/grade_assignment/widgets/grade_assignment_add_remark.dart';
import 'package:flutter/material.dart';
import 'package:aie_teacher/feature/grade_assignment/widgets/given_marks_button.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/utils.dart';

class AllGradeAssignment extends StatefulWidget {
  const AllGradeAssignment({super.key});

  @override
  State<AllGradeAssignment> createState() => _AllGradeAssignmentState();
}

class _AllGradeAssignmentState extends State<AllGradeAssignment> {
  final TextEditingController _textEditingController =
      TextEditingController(); // Initialize more for further use
  final TextEditingController _remarkController =
      TextEditingController(); // Initialize more for further use
  int selectedMarks = -1; // Initialize with -1 to represent none selected

  void handleMarksSelection(int marks) {
    setState(() {
      if (selectedMarks == marks) {
        selectedMarks = -1; // Deselect if already selected
      } else {
        selectedMarks = marks; // Select if not already selected
      }
    });
    print(marks.toString());
  }

  @override
  void dispose() {
    _remarkController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _questionPart(), // Question with timing, marks, and remark
        Utils().sizedBox,
        _answerCheckPart(), // Showing the correct if given wrong input
        Utils().sizedBox,
        _correctAnswerPart(),
        Utils().sizedBox,
      ],
    );
  }

  Container _correctAnswerPart() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.kPrimaryRed.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Q1: Plaster of paris is prepared from?", // for adding question part pass parameters while using Q{$index}. for question indexes
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          Utils().sizedBox,
          // Time and marks part of the MCQ Container ------------
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled_sharp,
                    color: AppColor.kGreyDark,
                    size: 20,
                  ),
                  // Time if ticking then use function and change the widget here -----------
                  Text(
                    "1:21",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColor.kGreyDark,
                    ),
                  ),
                ],
              ),
              Text(
                'Marks: 4',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
            ],
          ),
          // Ending of the time and marks section/row
          Utils().sizedBox,
          // To show whether the answer is correct or not
          Row(
            children: [
              const Text(
                "Selected Ans.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
              Utils(width: 5).sizedBox,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryRed.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'A) Limestone',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      // To indicate the correct answer
                      Icon(
                        Icons.cancel_outlined,
                        color: AppColor.kBrightRed,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          Utils().sizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Given Marks',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kGreyDark,
                ),
              ),
              Utils(height: 6).sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    GivenMarksButton(
                      index: i,
                      currentIndex:
                          4, // Option already selected. To change or modify all we need to do is to change the current index value
                      text: i.toString(),
                      onTap: () => handleMarksSelection(i),
                      // Select the value of the button by storing it in a variable
                    ),
                ],
              ),
            ],
          ),
          GradeAssignmentAddRemark(
            hintText: 'Add Remarks',
            controller: _textEditingController,
          ),
        ],
      ),
    );
  }

  Container _answerCheckPart() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColor.kPrimaryRed.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Q1: Plaster of paris is prepared from?", // for adding question part pass parameters while using Q{$index}. for question indexes
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
          ),
          Utils().sizedBox,
          // Time and marks part of the MCQ Container ------------
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled_sharp,
                    color: AppColor.kGreyDark,
                    size: 20,
                  ),
                  // Time if ticking then use function and change the widget here -----------
                  Text(
                    "1:21",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColor.kGreyDark,
                    ),
                  ),
                ],
              ),
              Text(
                'Marks: 4',
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
            ],
          ),
          // Ending of the time and marks section/row
          Utils().sizedBox,
          // To show whether the answer is correct or not
          Row(
            children: [
              const Text(
                "Selected Ans.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
              Utils(width: 5).sizedBox,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryRed.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'A) Limestone',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      // To indicate the correct answer
                      Icon(
                        Icons.cancel_outlined,
                        color: AppColor.kBrightRed,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Utils().sizedBox,
          Row(
            children: [
              const Text(
                "Correct Ans.",
                style: TextStyle(
                  fontSize: 12.0,
                  color: AppColor.kGreyDark,
                ),
              ),
              Utils(width: 5).sizedBox,
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColor.kPrimaryRed.withOpacity(0.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'D) Gypsum',
                        style: TextStyle(
                          color: AppColor.kDarkGreen,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Utils().sizedBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Given Marks',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kGreyDark,
                ),
              ),
              Utils(height: 6).sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    GivenMarksButton(
                      index: i,
                      currentIndex: selectedMarks,
                      text: i.toString(),
                      onTap: () => handleMarksSelection(i),
                      // Select the value of the button by storing it in a variable
                    ),
                ],
              ),
            ],
          ),
          Utils().sizedBox,
          GradeAssignmentAddRemark(
            hintText: 'Add Remarks',
            controller: _remarkController,
          ),
        ],
      ),
    );
  }

// Question part of section 'ALL'
  Container _questionPart() {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled_sharp,
                    color: AppColor.kGreyDark,
                    size: 20,
                  ),
                  // Time if ticking then use function and change the widget here -----------
                  Text(
                    "1:21",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: AppColor.kGreyDark,
                    ),
                  ),
                ],
              ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Given Marks',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: AppColor.kGreyDark,
                ),
              ),
              Utils(height: 6).sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    GivenMarksButton(
                      index: i,
                      currentIndex: selectedMarks,
                      text: i.toString(),
                      onTap: () => handleMarksSelection(i),
                      // Select the value of the button by storing it in a variable
                    ),
                ],
              ),
            ],
          ),
          Utils().sizedBox,
          GradeAssignmentAddRemark(
            controller: _remarkController,
            hintText: 'Add Remarks',
          ),
        ],
      ),
    );
  }
}
