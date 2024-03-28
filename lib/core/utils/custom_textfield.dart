import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/core/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.controller
  });
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final  void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: kprimaryColors,
        onSaved: onSaved,
        controller: controller,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        maxLines: maxLines,
        onChanged: onChanged,
        decoration: InputDecoration(
          focusedBorder: BuildOutLineBorderMethod(kprimaryColors),
          enabledBorder: BuildOutLineBorderMethod(),
          hintText: hint,
        ));
  }

  OutlineInputBorder BuildOutLineBorderMethod([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
