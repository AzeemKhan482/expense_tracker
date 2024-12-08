import 'package:flutter/material.dart';
import 'package:expense_tracker/Models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController =
      TextEditingController(); // its automatic create a object when user put a value
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    // Its return Future widget , when you clicked, it created function even you can select date or value yet.so we use Sync await function to hold till value dileverd by users.
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // .then( (value) {}); // we use then() function for hold when user give date then it will take it , not take empty function
  // but we use (Snyc await )function rather which is better than this
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController
        .text); //tryParse ('Hello') => null ,tryParse('1.12') => 1.12
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Please make sure a valid title,amount date and a category was entered"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              )
              );
      return; // when you return in afunction you make sure there no code there after to get execute
    }
    widget.onAddExpense(Expense(            //we use widget is statefull to gey things in state class from widget class
        tittle: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory));
        Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController
        .dispose(); // when use controller, must use dispose method because when widget not requied it will be deleted.
    _amountController.dispose();

    super
        .dispose(); //dispose like "initState" or "build" method part of StatefullWidget lifecycle , Its called automatically
  } // by Flutter when the widgets and its state are about to destroyed(removed from the UI)

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                //use Expanded to tell text field to take availible space only , Otherwise it'll take all space and row dosn't restrict it...
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"),
                      prefixText: //PrefixText will Assign pre Text to every input
                          "\$ "),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? "No Date Selected "
                      : formatter.format(
                          _selectedDate!)), // use ! to insit flutter that it will not be null , becoz we also checking null befor in if statment
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month)),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            // we use .Map() function here because Category value is (enum => fixed values set) and drop down button want a list of dropdownMenuItem
                            value:
                               category, //this extra (value) feature will store every dropdown value
                            child: Text(
                              category.name
                                  .toUpperCase(), // .name property also use enum values to string values and not visible to the use but child visible
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); // This pop fuction will exit the Screen
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text("Save Expense"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
