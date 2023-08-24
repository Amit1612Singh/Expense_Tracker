import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

  final  FormatDate  =DateFormat.yMd();

 const ID=Uuid();
 enum Category { food,travel, homeExpenses, shopping}


   const categoryIcons ={
   Category.food : Icons.lunch_dining,
     Category.travel : Icons.flight,
     Category.shopping : Icons.shopping_cart,
     Category.homeExpenses : Icons.home_filled,

   };

class Expense {

  Expense(
      { required this.date, required this.amount, required this.title, required this.category})
      : id=ID.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get dateCustomised{
    return FormatDate.format(date);
  }
}
 class ExpenseBucket{
   ExpenseBucket.myCategory(List<Expense>myExpenses, this.category,)
       : expenses=myExpenses.where((expense) => expense.category==category).toList() ;




  ExpenseBucket({ required this.category,required this.expenses});
  final Category category;
  final List<Expense>expenses;

  double get totalExpenses{
    double sum=0;
    for(final expense in expenses){
      sum=sum+expense.amount;

    }
    return sum;
  }
 }