import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/home/taps/home_tap/home_tap.dart';
import 'package:todo/home/taps/love_tap.dart';
import 'package:todo/home/taps/map_tap.dart';
import 'package:todo/home/taps/profile_tap.dart';
import 'package:todo/screens/creat_event.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='HomeScreen';
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, CreatEvent.routeName);
        },
      child:Icon(Icons.add,color: Colors.white,) ,),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (value){
          selectedIndex=value;
          setState(() {});
          },
          items:[
        BottomNavigationBarItem(icon:Image(image: AssetImage('assets/images/home.png')),label: 'home'.tr() ),
        BottomNavigationBarItem(icon:Image(image: AssetImage('assets/images/map.png')),label: 'map'.tr() ),
        BottomNavigationBarItem(icon:Image(image: AssetImage('assets/images/love.png')),label: 'love'.tr() ),
        BottomNavigationBarItem(icon:Image(image: AssetImage('assets/images/profile.png')),label: 'profile'.tr() ),
      ]),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs=[
    HomeTap(),
    MapTap(),
    LoveTap(),
    ProfileTap()
  ];
}
