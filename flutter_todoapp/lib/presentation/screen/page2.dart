import 'package:flutter/material.dart';

import '../res/color.dart';
import '../res/image.dart';
import '../res/string.dart';
import '../widget/MysizedBox.dart';
import '../widget/skip_button.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

 class Page2 extends StatefulWidget {
   const Page2({super.key});
 
   @override
   State<Page2> createState() =>  _Page2State();
 }
 
 class _Page2State extends State<Page2> {
   @override
   Widget build(BuildContext context) {
     return SafeArea(child: 
            Column(children: [
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                      alignment: Alignment.topRight,
                      child:
                     SkipButton((){
                Navigator.of(context).pushReplacementNamed('bottomnavigationbarr');
                }
              )             
                     ),
                     SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.width*0.5,
                      child: Image.asset(secondImage,scale: 1,)),
                     SizedBox_Height(height: 20,),
                     Text(ConstString.STAYORGNIZED,style: TextStyle(color: BLACK,fontSize: MediaQuery.of(context).size.width*0.08)),
                      SizedBox_Height(height: 10,),
                     Text(ConstString.GROUPYOURTASK,
                     style: TextStyle(color:GREY,fontSize: MediaQuery.of(context).size.width*0.06)),
            ]),);
   }
 }