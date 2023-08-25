// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../res/color.dart';
import '../res/image.dart';
import '../res/string.dart';
import '../widget/MysizedBox.dart';
import '../widget/skip_button.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}
  
class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
        return SafeArea(
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              alignment: Alignment.topRight,
              child:SkipButton((){
                Navigator.of(context).pushReplacementNamed('bottomnavigationbarr');
                }
              )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.width*0.5,
              child: Image.asset(
                firstImage,
                scale: 2.5,
              ),
            ),
            SizedBox_Height(height: 20,),
            Text(ConstString.WRITELISTS,
                style: TextStyle(color: BLACK, fontSize: MediaQuery.of(context).size.width*0.08)),//size27
          SizedBox_Height(height: 10,),
            Padding(
              padding: const EdgeInsets.
              only(left: 10),
              child: Text(ConstString.WRITEYOURTASKS,
                  style: TextStyle(color: GREY, fontSize:MediaQuery.of(context).size.width*0.06)),
            )//size17
          
          ]),
          
        );
      }
   
}


