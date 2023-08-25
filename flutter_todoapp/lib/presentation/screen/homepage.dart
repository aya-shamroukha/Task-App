// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_todoapp/presentation/screen/page1.dart';
import 'package:flutter_todoapp/presentation/screen/page2.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page3.dart';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _Homepage_listState();
}

class _Homepage_listState extends State<Homepage> {
  PageController pageController = PageController(initialPage: 0);
  int current_page = 0;
  List pages = [Page1(), Page2(), Page3()];
  onChanged(int index) {
    setState(() {
      current_page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                onPageChanged: onChanged,
                children: [Page1(),Page2(),Page3()],
              ),
            ),
            SmoothPageIndicator(controller: pageController, count: pages.length,
            effect:JumpingDotEffect(
              verticalOffset: 10,
              activeDotColor:Color(0xff8BA8B5) ,
              dotHeight: 15,dotWidth: 15,
              dotColor: Colors.grey.withOpacity(0.7)),),
            Padding(
              padding: const EdgeInsets.only(bottom: 200,top: 20),
              child:
               ElevatedButton(
                child: 
                (current_page==(pages.length-1))?Text('Get Start',
                style: TextStyle(color: Colors.white),)
                :Text(  'next',
                  style: TextStyle(color: Colors.white), ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff8BA8B5)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 77, vertical: 13)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27)))),
                onPressed: () {
                 (current_page==(pages.length-1)) ? Navigator.of(context).pushReplacementNamed('bottomnavigationbarr'):
                 pageController.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

