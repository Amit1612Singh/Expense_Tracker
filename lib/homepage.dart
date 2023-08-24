import 'package:expense_tracker/widget/Chart/chart.dart';
import 'package:expense_tracker/widget/addNewExpenses.dart';
import 'package:expense_tracker/widget/expenses_list/expensesList.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> showExpenses=[
    Expense(title: "Train",amount: 25.5,date: DateTime.now(),category: Category.travel),
    Expense(date: DateTime.now(), amount: 33, title: "clothes", category:Category.shopping),
  ];

  void _appbaricon(){
    showModalBottomSheet(
isScrollControlled: true,
        context: context,
        builder:(ctx)=> NewExpenses(addShowExpense: _addExpenses,));
  }

  void _addExpenses(Expense expense){
    setState(() {
      showExpenses.add( expense);
    });
  }

  void _DismissedData(Expense expense){
    final indexExpense=showExpenses.indexOf(expense);
    setState(() {
      showExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration:const  Duration(seconds: 4),
        action: SnackBarAction(label: " undo",
        onPressed: (){
          setState(() {
            showExpenses.insert(indexExpense,expense);
          });
        }),
        content:  const Text(" Expense data deleted",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)));
  }

  @override
  Widget build(BuildContext context) {
    Widget highlighted= const Center(
      child: Text(" No Expenses found.Add your data",style: TextStyle(fontWeight: FontWeight.bold)),
    );
   if(showExpenses.isNotEmpty ){
     highlighted= ExpensesList(expense:showExpenses,
         onRemovedData: _DismissedData);
   }
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(onPressed:_appbaricon,
              icon: const Icon(Icons.add))
        ],
          title: const Text("Expenses Tracker"),),
      body: Column(

        children: [
          Chart(expenses:showExpenses),
          Expanded(child:highlighted,),
        ],
      ),
    );
  }
}
