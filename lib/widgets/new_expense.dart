import 'package:flutter/material.dart';                                                    

class NewExpense extends StatefulWidget{                                                               
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
   return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense>{      

  final _titleController = TextEditingController();        // its automatic create a object when user put a value

  @override

  void dispose(){    
    _titleController.dispose();                         // when use controller, must use dispose method because when widget not requied it will be deleted.
    super.dispose();                                    //dispose like "initState" or "build" method part of StatefullWidget lifecycle , Its called automatically
  }                                                     // by Flutter when the widgets and its state are about to destroyed(removed from the UI)
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(15),
    child: Column(children: [
      TextField(
            controller: _titleController,                                           
        maxLength: 50,
        decoration: const InputDecoration(label: Text("Title")),
        
        ),
        Row(children: [
          ElevatedButton(onPressed: (){
            print(_titleController);
          }, child: const Text("Save Expense"))
        ],)
    ],),
    
    );
  }
}