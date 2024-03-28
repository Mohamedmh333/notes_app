import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.TextColor,
    this.borderRadius,
    this.textSize,
    this.onPressed,
    this.isLoading = false,
  });
  final Color backgroundColor;
  final String text;
  final Color TextColor;
  final BorderRadius? borderRadius;
  final double? textSize;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          child: isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.black,
                )
              : Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TextColor,
                      fontSize: 18),
                ),
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(8)))),
    );
  }
}
