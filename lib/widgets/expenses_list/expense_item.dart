import 'package:expense_tracker/Models/expense.dart';

import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.tittle,
              style: Theme.of(context).textTheme.titleLarge,   //theme.of() is use for to get setting from main dart file 
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                    '\$${expense.amount}'), //double doller use for show 1 $ sign
                const Spacer(), // it takes all the remaining space between 2 rows widgets
                Row(
                  children: [
                    Icon(categoryTcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
