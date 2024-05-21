import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Flutter coding',
        amout: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amout: 19.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpense.insert(expenseIndex, expense);
                // insert : index, element
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No data'),
    );
    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpencesList(
        expenses: _registeredExpense,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          // crossAxisAlignment: CrossAxisAlignment.start,
          const Text('Apple demo'),
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [const Text('The chart'), Expanded(child: mainContent)],
      ),
    );
  }
}
