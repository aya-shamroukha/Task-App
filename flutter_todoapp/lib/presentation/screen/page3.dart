import 'package:flutter/material.dart';
import '../res/color.dart';
import '../res/image.dart';
import '../res/string.dart';
import '../widget/MysizedBox.dart';
import '../widget/skip_button.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

 class Page3 extends StatefulWidget {
   const Page3({super.key});
 
   @override
   State<Page3> createState() =>_Page3State();
 }
 
 class _Page3State extends State<Page3> {
   @override
   Widget build(BuildContext context) {
     return SafeArea(child: 
            Column(children: [
                     Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                      alignment: Alignment.topRight,
                      child:SkipButton((){
                Navigator.of(context).pushReplacementNamed('bottomnavigationbarr');
                }
              )
                     ),
                     SizedBox(
                       width: MediaQuery.of(context).size.width*0.5,
              height: MediaQuery.of(context).size.width*0.5,
                      child: Image.asset(thirdImage,scale: 0.8,)),
                    SizedBox_Height(height: 40,),
                     Text(ConstString.CHEEKPROGESS,style: TextStyle(color:BLACK,fontSize: MediaQuery.of(context).size.width*0.08)),
                      SizedBox_Height(height: 10,),
                     Text(ConstString.SEEHOWMUCH,
                     style: TextStyle(color: GREY,fontSize: MediaQuery.of(context).size.width*0.06))

                     
            ]),);
   }
 }