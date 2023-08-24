import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expensesItem.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expense, required this.onRemovedData ,super.key});

  final List<Expense>expense;

  final void Function(Expense expense) onRemovedData;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemCount: expense.length,

    itemBuilder: (context,index)=> Dismissible( key: ValueKey(expense[index]),
        onDismissed: ( direction){
          onRemovedData(expense[index]);
        }
        ,child: ExpenseItem(expense[index],),
    ));
  }
}
