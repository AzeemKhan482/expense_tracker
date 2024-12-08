import 'package:expense_tracker/Models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //its build a list like a column but on demand
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        //Dismissible use for Delete items with swipe left
        key: ValueKey(expenses[index]),
        background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal),),
        onDismissed: (direction){onRemoveExpense(expenses[index]);},
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
