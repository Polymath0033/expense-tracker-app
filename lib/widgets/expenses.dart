import 'package:flutter/material.dart';
import 'package:expensive_app/models/expense.dart';
import 'package:expensive_app/widgets/expenses_list/expenses_list.dart';
import 'package:expensive_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Groceries',
        amount: 100.0,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Taxi',
        amount: 50.0,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Movie',
        amount: 20.0,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Laptop',
        amount: 1000.0,
        date: DateTime.now(),
        category: Category.work),
  ];
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseApp"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('Expenses'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
