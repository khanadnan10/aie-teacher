import 'package:aie_teacher/feature/received_assignments/data/all_homework.dart';
import 'package:aie_teacher/feature/received_assignments/widgets/received_assignment_rectangle_card.dart';
import 'package:flutter/material.dart';

class AllReceivedAssignments extends StatelessWidget {
  const AllReceivedAssignments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      physics: const BouncingScrollPhysics(),
      itemCount: allHomework.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ReceivedAssignmentRectangleCard( // --------- Use the same widget for other categories like need grading and late submission
          title: allHomework[index]['title'],
          status: allHomework[index]['status'],
          image: allHomework[index]['image'],
          grades: allHomework[index]['grades'],
        );
      },
    );
  }
}
