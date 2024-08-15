import 'package:expensive_app/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expensive_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final List<Expense> expenses;
  final void Function(Expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(
                expenses[index],
              ),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.7),
                margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              ),
              onDismissed: (direction) {
                removeExpense(expenses[index]);
              },
              child: ExpenseItem(
                expenses[index],
              ),
            ));
  }
}
