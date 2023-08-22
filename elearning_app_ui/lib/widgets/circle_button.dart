import 'package:elearning_app_ui/constants/color.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CircleButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryLight
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
