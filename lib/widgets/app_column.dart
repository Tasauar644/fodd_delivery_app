import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'BigText.dart';
import 'SmallText.dart';
import 'icon_text_widget.dart';

class AppIcon extends StatelessWidget {

  final String text;
  const AppIcon({super.key,
    required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        SizedBox(height: Dimensions.height12),
        Row(
          children: [
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star, color: Appcolors.maincolor, size: 15)),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "4km"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "1258"),
            SizedBox(width: Dimensions.width10),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndWidget(
              icon: Icons.circle_sharp,
              text: "normal",
              iconColor: Appcolors.iconcolor1,
            ),
            SizedBox(width: Dimensions.width5),
            IconAndWidget(
              icon: Icons.location_on,
              text: "3km",
              iconColor: Appcolors.maincolor,
            ),
            SizedBox(width:Dimensions.width5),
            IconAndWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: Appcolors.iconcolor2,
            ),
          ],
        ),
      ],
    );
  }
}
