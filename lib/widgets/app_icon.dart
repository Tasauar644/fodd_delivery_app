import 'package:flutter/cupertino.dart';

class AppIconWidget extends StatelessWidget {
  final IconData icon;
  final Color backGroundColor;
  final Color iconColor;
  final double size;
  const AppIconWidget({super.key,
    required this.icon,
    this.backGroundColor=const Color(0xFFffd379),
    this.iconColor=const Color(0xFF756d54),
    this.size=40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backGroundColor,
      ),
      child: Icon(
        icon,color: iconColor,
        size: 16,
      ),
    );
  }
}
