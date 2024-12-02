import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerdExpenses = [
    //use Expense class(data Model) as a type to get all values of this class
    Expense(
        tittle: "Flutter Course",
        amount: 19.9999.toStringAsFixed(
            2), //ToStringAsFixed is used for 2 nmbrs after (.) , like 1.2345 to 1.23
        date: DateTime.now(),
        category: Category.work),
    Expense(
        tittle: "Cinema",
        amount: 15.6999.toStringAsFixed(
            2), //ToStringAsFixed is used for 2 nmbrs after (.) , like 1.2345 to 1.23
        date: DateTime.now(),
        category: Category.leisure),
  ]; //use Expense class(data Model) as a type to get all values of this class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
        IconButton(onPressed: (){}, icon:const Icon(Icons.add)),
      ],),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            //Expanded use for get together 2 column
            child: ExpensesList(expenses: _registerdExpenses),
          ),
        ],
      ),
    );
  }
}
