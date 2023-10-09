// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/assigned_class/widgets/attendence_list_card.dart';
import 'package:aie_teacher/feature/assigned_class/widgets/class_student_attendence_card.dart';
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/assigned_class/pages/class_student.dart';
import 'package:aie_teacher/feature/assigned_class/widgets/class_small_card.dart';
import 'package:aie_teacher/feature/assigned_class/widgets/class_student_details_card.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';

class Attendence extends StatefulWidget {
  final ViewType listViewType;
  const Attendence({
    Key? key,
    required this.listViewType,
  }) : super(key: key);

  @override
  State<Attendence> createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.listViewType == ViewType.gridView
            ? _gridViewOfAttendence()
            : _listViewOfAttendence(),
      ],
    );
  }

  Widget _gridViewOfAttendence() {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ClassStudentAttedenceCard(
            image: 'images/Profile man.png',
            title: 'Chandan Nunia',
            role: 'SIS/V/01',
            percent: '86',
            presentCount: '26',
            absentCount: '06',
          );
        },
      ),
    );
  }

  Widget _listViewOfAttendence() {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return const AttendenceListCard(
            title: 'Chandan Nunia',
            role: 'SIS/V/01',
            image: 'images/Profile man.png',
            isDetailListCard: true,
            absentCount: '06',
            presentCount: '26',
          );
        },
      ),
    );
  }
}
