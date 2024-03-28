import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });
  final String text;
  final Icon icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(16)),
          child: IconButton(onPressed: onPressed, icon: icon),
        ),
      ],
    );
  }
}
