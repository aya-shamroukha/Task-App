// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget SkipButton(dynamic OnTap){
  return InkWell(
                onTap: (){
                  OnTap();
                },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.grey),
                  ))
  
  ;
}