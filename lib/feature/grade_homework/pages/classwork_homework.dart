import 'package:aie_teacher/feature/grade_homework/data/homework.dart';
import 'package:aie_teacher/feature/grade_homework/widgets/class_work_homework_card.dart';
import 'package:aie_teacher/feature/grade_homework/widgets/funtion_chip_menu.dart';
import 'package:aie_teacher/feature/grade_homework/widgets/simple_chip.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

class ClassworkHomework extends StatefulWidget {
  const ClassworkHomework({super.key});

  @override
  State<ClassworkHomework> createState() => _ClassworkHomeworkState();
}

class _ClassworkHomeworkState extends State<ClassworkHomework> {
  String? _sortByValue;
  String? _filterValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Utils().sizedBox,
          Text(
            'Class Homework',
            style: AppFont.kHeadingTextStyle.copyWith(
              fontSize: 16.0,
            ),
          ),
          Utils().sizedBox,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: homework.length,
              itemBuilder: (context, index) {
                return ClassworkHomeworkCard(
                  subjectName: homework[index]['subjectName'],
                  sent: homework[index]['sent'],
                  status: homework[index]['status'],
                  submissionCount: homework[index]['submissionCount'],
                  homeworkTitle: homework[index]['homeworkTitle'],
                  homweworkbody: homework[index]['homweworkbody'],
                );
              },
            ),
          ),
          Utils().sizedBox,
          Text(
            'Old Homework',
            style: AppFont.kHeadingTextStyle.copyWith(
              fontSize: 16.0,
            ),
          ),
          Utils().sizedBox,
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FunctionChip(
                  // Sort by chip
                  items: dropDownList,
                  onChanged: (value) {
                    setState(() {
                      _sortByValue = value;
                    });
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                  ),
                  hintText: _sortByValue ?? 'Sort by',
                ),
                Utils(width: 10.0).sizedBox,
                FunctionChip(
                  // Filter by chip
                  items: const ['some'],
                  onChanged: (value) {
                    setState(() {
                      _filterValue = value;
                    });
                  },
                  icon: const Icon(
                    Icons.tune,
                    size: 20.0,
                  ),
                  hintText: _filterValue ?? 'Filter ',
                ),
                Utils(width: 10.0).sizedBox,
                SimpleTextChip(
                  text: 'MCQ',
                  onTap: () {
                    //MCQ Filter here
                  },
                ),
                Utils(width: 10.0).sizedBox,
                SimpleTextChip(
                  text: 'FITB\’s',
                  onTap: () {
                    //FITB Filter here
                  },
                ),
              ],
            ),
          ),
          Utils().sizedBox,
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: homework.length,
              itemBuilder: (context, index) {
                return ClassworkHomeworkCard(
                  subjectName: homework[index]['subjectName'],
                  sent: homework[index]['sent'],
                  status: 'Completed',
                  submissionCount: 'All submitted',
                  homeworkTitle: homework[index]['homeworkTitle'],
                  homweworkbody: homework[index]['homweworkbody'],
                );
              },
            ),
          ),
          Utils().sizedBox,
        ],
      ),
    );
  }
}
