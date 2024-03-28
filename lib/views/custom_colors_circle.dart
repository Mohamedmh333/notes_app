
import 'package:flutter/material.dart';

class CustomColors extends StatelessWidget {
  const CustomColors(
      {super.key, required this.isSelected, required this.colorPick});
  final bool isSelected;
  final Color colorPick;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colorPick,
            ))
        : CircleAvatar(
            radius: 20,
            backgroundColor: colorPick,
          );
  }
}
