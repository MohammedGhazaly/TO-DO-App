import 'package:flutter/material.dart';
import 'package:todo_app/my_theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final String validationMessage;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    required this.validationMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage;
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: MyTheme.primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          // color: Color(0xffA9A9A99C),
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        border: buildDefaultBorder(),
        enabled: true,
        enabledBorder: buildDefaultBorder(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyTheme.primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder buildDefaultBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xff707070)),
    );
  }
}
