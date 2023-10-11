// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:aie_teacher/utils/colors.dart';
import 'package:aie_teacher/utils/fonts.dart';
import 'package:aie_teacher/utils/utils.dart';

class ReceivedAssignmentRectangleCard extends StatelessWidget {
  final bool? isDoubtCard;
  final String title;
  final String status;
  final String image;
  final bool isDetailListCard;
  final String grades;
  const ReceivedAssignmentRectangleCard({
    Key? key,
    this.isDoubtCard = false,
    required this.title,
    required this.status,
    required this.image,
    this.isDetailListCard = true,
    required this.grades,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      // -------- Optional property, else the primary red will be ina action
      colors: [
        Color(0xff598DFD),
        Color(0xff7E49E9),
      ],
    );
    return Container(
      decoration: BoxDecoration(
        border: !isDetailListCard
            ? Border.all(
                width: 2,
                color: AppColor.kPrimaryRed,
              )
            : null,
        color: isDoubtCard == false
            ? isDetailListCard
                ? AppColor.kDetailCardRed
                : null
            : AppColor.kWhite,
        borderRadius: BorderRadius.circular(50.0),
      ),
      margin: isDetailListCard ? const EdgeInsets.symmetric(vertical: 5) : null,
      padding: const EdgeInsets.all(8.0).copyWith(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              image,
            ),
            radius: 25,
          ),
          Utils(width: 5).sizedBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFont.kHeadingTextStyle.copyWith(fontSize: 16.0),
                ),
                Text(
                  status, // Hard coding for not received
                  style: AppFont.kbodyTextStyle.copyWith(
                    fontSize: 12.0,
                    color: AppColor.kBlack.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isDoubtCard ==
                        false // Extra check for the 'doubt' card of doubt section
                    ? grades.length < 5
                        ? ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => (gradient).createShader(
                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                            ),
                            child: Text(
                              grades,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                                color: AppColor.kBrightRed,
                              ),
                            ),
                          )
                        : Text(
                            grades,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w800,
                              color: status ==
                                      'Not Received' // ------- Hard coding for not received status
                                  ? AppColor.kBrightRed.withOpacity(0.5)
                                  : AppColor.kBrightRed,
                            ),
                          )
                    : Text(
                        grades,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 8.0,
                          fontWeight: FontWeight.w800,
                          color: AppColor.kGreyDark,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
