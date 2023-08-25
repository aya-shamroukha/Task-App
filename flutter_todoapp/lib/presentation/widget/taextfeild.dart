// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../res/color.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.Controller, required this.labelText,
  });

  final TextEditingController Controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: Controller,
           cursorColor: Color(0xff8BA8B5),
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: GREY, fontSize: 17,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: SecondaryColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color:SecondaryColor,
                )),
          ),
    );
  }
}
