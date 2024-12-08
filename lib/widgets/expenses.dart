import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
        amount: 19.9999, //ToStringAsFixed is used for 2 nmbrs after (.) , like 1.2345 to 1.23
        date: DateTime.now(),
        category: Category.work),
    Expense(
        tittle: "Cinema",
        amount: 15.6999, //ToStringAsFixed is used for 2 nmbrs after (.) , like 1.2345 to 1.23
        date: DateTime.now(),
        category: Category.leisure),
  ]; //use Expense class(data Model) as a type to get all values of this class

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,   //(isScrollControlled )it will take full availible height and make sure we dont overlap with keyboard
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerdExpenses.add(expense);
    });
  }
  void _removeExpense(Expense expense){
    final expenseIndex = _registerdExpenses.indexOf(expense);
    setState(() {
      _registerdExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:const Text("Expense deleted."),
    duration: const Duration(seconds: 4),
    action: SnackBarAction(label: "Undo", onPressed: (){
      setState(() {
        _registerdExpenses.insert(expenseIndex, expense);
      });
    }),));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No expenses found. start adding some!"),);
    if (_registerdExpenses.isNotEmpty){
      mainContent =ExpensesList(expenses: _registerdExpenses, onRemoveExpense: _removeExpense,);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Chart(expenses: _registerdExpenses)),
          Expanded(
            //Expanded use for get together 2 column
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
