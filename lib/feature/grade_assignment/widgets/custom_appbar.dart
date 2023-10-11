import 'package:aie_teacher/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomGradeAssignmentAppbar extends StatelessWidget
    implements PreferredSize {
  final String text;
  final VoidCallback onIconTap;
  const CustomGradeAssignmentAppbar({
    Key? key,
    required this.text,
    required this.onIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: kTextTabBarHeight + 30,
      leading: GestureDetector(
        onTap: () {
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
      actions: [
        IconButton(
          onPressed: onIconTap,
          icon: Icon(
            Icons.check_circle,
            color: AppColor.kWhite.withOpacity(0.5),
          ),
        ),
      ],
      centerTitle: true,
      title: Text(
        text,
        style: const TextStyle(
            color: AppColor.kWhite,
            fontSize: 16.0,
            fontWeight: FontWeight.w800),
      ),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: kToolbarHeight),
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
