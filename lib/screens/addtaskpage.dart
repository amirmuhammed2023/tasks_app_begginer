import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasksappbegginer/providers/Tasks.dart';

class addtask extends StatelessWidget {
   addtask ({super.key});
  static String id = "addtask" ;
  String? message ;
  final clearfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final classinstance = Provider.of<tasks>(context);
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back),),
        title: Text("Add tasks"),
        ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Text("Add Task",style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.indigo),),
            SizedBox(height:MediaQuery.of(context).size.height*0.02,),*/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: TextFormField(
                controller: clearfield,
                onChanged:(value){
                  message = value ;
                },
                decoration:InputDecoration(
                  hintText:"Write your task",
                ),
              ),
            ),
            

            SizedBox(
              width: 250,
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.deepPurple,
                  padding: EdgeInsets.symmetric(vertical:12)
                ) ,              
               
                onPressed:(){
                   classinstance.addtasks(message);
                   clearfield.clear();
                },
                child: Text("Add"),
                
              ),
            )
          ]
        ),
    );
    
  }
}