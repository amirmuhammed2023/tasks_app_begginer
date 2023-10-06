import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasksappbegginer/providers/Dates.dart';
import 'package:tasksappbegginer/providers/Tasks.dart';
import 'package:tasksappbegginer/screens/addtaskpage.dart';

class homepage extends StatefulWidget {
  homepage({super.key});
  static String id = "homepage";
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    //DateTime date = DateTime.now();
    final task1 = Provider.of<tasks>(context);
    final date1 = Provider.of<Dates>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.pushNamed(context, addtask.id);
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showDatePicker(
                      
                      context: context,
                      initialDate: date1.date,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030),
                      builder:(context,child){
                        return Theme(
                          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(
                            primary: Colors.deepPurple
                          )), 
                          child: child!);
                      }
                    ).then((value){
                       if (value == null) {
                          date1.date;
                       } else {
                          date1.changedate(value) ;
                       }
                       });
                  },
                  icon: Icon(
                    Icons.today_sharp,
                    size: 29,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  "TasksToDo",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                IconButton(
                  onPressed: () {
                    myalertdialog1();
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 29,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tasks :  ${
                    task1.mytasks.length}",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text("${date1.date.year}",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:20),)),
                  Text("Date : ${date1.date.month} / ${date1.date.day}",style:TextStyle(color:Colors.white,fontSize: 16),),   
                ],
              ),
            ),
         
            Container(
              child:
                task1.mytasks.isEmpty ? 
                Center(
                   child:Text("There are no tasks",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 17),) ,
                ) :
               Column(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: task1.mytasks.length,
                      itemBuilder: (context, index) {
                        return /* Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CheckboxListTile(
                                      title: Text(
                                        "${task1.mytasks[index]}",
                                        style:task1.isdo[index] == false
                                            ? null
                                            : TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough),
                                            ),
                                            
                                      activeColor: Colors.deepPurple,
                                      value: task1.isdo[index],
                                      onChanged: (val) {
                                        task1.updatetask(index);
                                        print(val) ;
                                      }),
                                ),
                              IconButton(onPressed:(){}, icon:Icon(Icons.remove))      
                              ],
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                              endIndent: 15,
                              indent: 15,
                            )
                          ],
                        )*/
                            Column(
                          children: [
                            ListTile(
                              title: Text(
                                "${task1.mytasks[index]}",
                                style: task1.isdo[index] == false
                                    ? null
                                    : TextStyle(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              leading: Checkbox(
                                  activeColor: Colors.deepPurple,
                                  value: task1.isdo[index],
                                  onChanged: (val) {
                                    task1.updatetask(index);
                                    print(val);
                                  }),
                              trailing: IconButton(
                                  onPressed: () {
                                    task1.removeonetask(task1.mytasks[index]);
                                  },
                                  icon: Icon(Icons.remove)),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                              endIndent: 15,
                              indent: 15,
                            )
                          ],
                        );
                      },
                    ),
                  )),
                ],
              ), 
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> myalertdialog1() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure ?"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("You need to delete all tasks "),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("No")),
            TextButton(
                onPressed: () {
                  Provider.of<tasks>(context, listen: false).removealltasks();
                  Navigator.of(context).pop();
                },
                child: Text("Yes"))
          ],
        );
      },
    );
  }
}
