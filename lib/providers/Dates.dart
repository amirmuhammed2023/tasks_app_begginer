import 'package:flutter/material.dart';

class Dates extends ChangeNotifier{
  DateTime date = DateTime.now();   

  changedate(DateTime t){
      date = t ;
      notifyListeners(); 
   }
}