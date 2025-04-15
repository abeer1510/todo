import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatEventProvider extends ChangeNotifier{
  List<String> eventCategories=[
    "book_club",
    "sport",
    "birthday",
    "eating",
    "meeting",
    "gaming",
    "holiday",
    "exhibition",
    "work_shop"
  ];

  int selectedCategory=0;
  DateTime selectedDate=DateTime.now();
  TimeOfDay selectedTime=TimeOfDay.now();

  String get selectedCatogryName=>eventCategories[selectedCategory];
  onChanageTime(TimeOfDay time){
    selectedTime=time;
    notifyListeners();

  }

  onDateChanaged(DateTime date){
    selectedDate=date;
    notifyListeners();
  }
  chanageCategory(int index){
    selectedCategory=index;
    notifyListeners();
  }
}