// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aie_teacher/feature/assigned_class/widgets/notes_text_box.dart';
import 'package:flutter/material.dart';

import 'package:aie_teacher/feature/assigned_class/widgets/notes_bottom_bar.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data - Clear it when of no use
    List<Map<String, dynamic>> notes = [
      {
        'notes':
            'Bring practical notebook to the class, we will conduct some experiments tomorrow.',
        'timeAgo': '2 days ago',
      },
      {
        'notes': 'Bring your charts tomorrow.',
        'timeAgo': '2 days ago',
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...notes.map(
                      (e) => NotesTextBox(
                        notes: e['notes'],
                        timeAgo: e['timeAgo'],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const NotesBottomBar()
          ],
        ),
      ),
    );
  }
}
