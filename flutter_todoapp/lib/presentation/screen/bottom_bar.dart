import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


import '../res/color.dart';
import 'completed_task.dart';
import 'favorite_task.dart';
import 'task_screen.dart';

class BottomNavigationBarr extends StatefulWidget {
  const BottomNavigationBarr({super.key});

  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  int selectedindex=0;
var screen=[const TaskScreen(),const Favorite(),const Completed()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: bottomNavigationKey ,
          //currentIndex: selectedindex,
          backgroundColor:WHITE,
          color: SecondaryColor,
          animationDuration: const Duration(milliseconds: 400),
          height: 50,
          buttonBackgroundColor: SecondaryColor,
          index: selectedindex,
          onTap: (index){
            setState(() {
                selectedindex=index;
            });
          },          
          items:  const [
      Icon(Icons.home,color: WHITE,),
          Icon(Icons.favorite,color: WHITE,),
           Icon(Icons.done,color: WHITE,),
        ],
        
        ), 
        body: screen[selectedindex],
    );
  }
}