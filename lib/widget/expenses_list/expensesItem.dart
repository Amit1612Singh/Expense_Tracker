import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem( this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.deepOrange.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(expense.title,style:  const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
               const SizedBox(height: 6,),
              Row(
                children: [
                Text('\$${expense.amount.toStringAsFixed(2)}',
            style:  const TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                 const Spacer(),
                Row(children: [
                  Icon(categoryIcons[expense.category]),
                 const  SizedBox(width: 7,),
                   Text(expense.dateCustomised.toString(),style:  const TextStyle(fontSize: 14,fontWeight: FontWeight.bold))

                ],)
              ],
              )
            ],
          ),
        ));
  }
}
