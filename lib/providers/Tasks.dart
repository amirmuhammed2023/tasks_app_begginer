import 'package:flutter/material.dart';

class tasks with ChangeNotifier{
   List<bool> isdo = [] ;
   List mytasks = [] ;
   
   addtasks(value){
    isdo.add(false) ;
    mytasks.add(value) ;
    notifyListeners();
   }
   
  
   removeonetask(value){
    mytasks.remove(value) ;
    notifyListeners();
   }
  
   removealltasks(){
     isdo.clear();
     mytasks.clear();
     notifyListeners() ;
   }

   updatetask(int inde){
    isdo[inde] = !isdo[inde] ;  
    notifyListeners() ;
   }  
 }
 