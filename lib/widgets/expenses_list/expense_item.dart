import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.expense, {super.key});
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
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('\$${expense.amout.toStringAsFixed(2)}'),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expense.formartterdDate)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
