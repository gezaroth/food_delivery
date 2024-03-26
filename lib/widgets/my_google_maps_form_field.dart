import 'package:flutter/material.dart';

Widget textFormField({
  String? hintText,
  TextEditingController? controller,
  Function(String)? onChanged,
  validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.text,
    validator: validator,
    onChanged: onChanged,
    decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        errorStyle: TextStyle(
          fontSize: 12,
          color: Colors.red,
        )),
  );
}
