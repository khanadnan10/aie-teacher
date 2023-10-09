import 'package:aie_teacher/feature/assigned_class/pages/attendence.dart';
import 'package:aie_teacher/feature/assigned_class/pages/custom_chip.dart';
import 'package:aie_teacher/feature/assigned_class/pages/details.dart';
import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/utils.dart';
import 'package:flutter/material.dart';

enum ViewType {
  gridView,
  listView,
}

class ClassStudent extends StatefulWidget {
  const ClassStudent({super.key});

  @override
  State<ClassStudent> createState() => _ClassStudentState();
}

class _ClassStudentState extends State<ClassStudent> {
  int _currentIndex = 0;
  final PageController _classStudentPageController = PageController();

// ------- To add more list in the class student section ------
  List<String> classStudentSubpages = [
    'Details',
    'Attendence',
    'Grades',
  ];

  @override
  void dispose() {
    _classStudentPageController.dispose();
    super.dispose();
  }

  ViewType listViewType = ViewType.gridView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    for (int i = 0;
                        i < classStudentSubpages.length;
                        i++) // --------- Add chip from above list hence can be extended -------
                      CustomChip(
                        index: i,
                        currentIndex: _currentIndex,
                        onTap: () {
                          setState(() {
                            _currentIndex = i;
                          });
                          _classStudentPageController.jumpToPage(_currentIndex);
                        },
                        text: classStudentSubpages[i],
                      ),
                  ],
                ),
              ),
            ),
            Utils(width: 16).sizedBox,
            GestureDetector(
              onTap: () {
                //Changing the type of view of the list in details category of class student section
                setState(
                  () {
                    listViewType == ViewType.listView
                        ? listViewType = ViewType.gridView
                        : listViewType = ViewType.listView;
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kPrimaryRed,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    listViewType == ViewType.gridView
                        ? const Icon(
                            Icons.grid_view_rounded,
                            color: AppColor.kWhite,
                          )
                        : const Icon(
                            Icons.view_list_sharp,
                            color: AppColor.kWhite,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Utils().sizedBox,
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _classStudentPageController,
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              List<Widget> screen = [
                Details(listViewType: listViewType),
                Attendence(listViewType: listViewType),
                const Center(child: Text('Grades')),
              ];
              return screen[index];
            },
          ),
        ),
      ],
    );
  }
}
