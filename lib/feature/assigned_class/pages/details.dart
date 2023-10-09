// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/assigned_class/widgets/class_small_card.dart';
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/assigned_class/pages/class_student.dart';
import 'package:aie_teacher/feature/assigned_class/widgets/class_student_details_card.dart';

class Details extends StatefulWidget {
  final ViewType listViewType;
  const Details({
    Key? key,
    required this.listViewType,
  }) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.listViewType == ViewType.gridView
            ? _gridViewOfDetails()
            : _listViewOfDetails(),
      ],
    );
  }

  Expanded _gridViewOfDetails() {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 280,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ClassStudentDetailsCard(
            image: 'images/Profile man.png',
            name: 'Chandan Nunia',
            role: 'SIS/V/01',
            fathersName: 'Pritam Kumar',
            age: '10',
            gender: 'Boy',
          );
        },
      ),
    );
  }

  Expanded _listViewOfDetails() {
    return Expanded(
        child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return DetailListCard(
          title: 'Chandan Nunia',
          role: 'SIS/V/01',
          image: 'images/Profile man.png',
          isDetailListCard: true,
          onCall: () {
            //TODO: add call function
          },
          onMessage: () {
            //TODO: add message function
          },
        );
      },
    ));
  }
}
