import 'package:flutter/material.dart';
import 'package:tasksappbegginer/providers/Dates.dart';
import 'package:tasksappbegginer/screens/addtaskpage.dart';
import 'package:tasksappbegginer/screens/homepage.dart';
import 'providers/Tasks.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider<tasks>(
          create: (context) {return tasks();},),
        
       ChangeNotifierProvider<Dates>(
          create: (context) {return Dates();}), 
  
      ],
      child: MaterialApp(
            initialRoute: homepage.id,
            routes:{
              addtask.id :(context) => addtask() ,
            },
           home: homepage(),   
             ),  
    );
  }
}
