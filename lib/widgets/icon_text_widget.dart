import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/SmallText.dart';

class IconAndWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndWidget({super.key,
    required this.icon,
    required this.text,
    required this.iconColor    
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: 14,),
       SizedBox(width: Dimensions.width5,),
        SmallText(text: text)
      ],
    );
  }
}
