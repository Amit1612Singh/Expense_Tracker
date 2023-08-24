import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/Chart/chart_bar.dart';
import'package:flutter/material.dart';



class Chart extends StatelessWidget {
  const Chart({required this.expenses, super.key}) ;


  final List<Expense>expenses;

  List< ExpenseBucket> get buckets{
    return[ExpenseBucket.myCategory(expenses,Category.food),
      ExpenseBucket.myCategory(expenses,Category.travel),
      ExpenseBucket.myCategory(expenses,Category.shopping),
      ExpenseBucket.myCategory(expenses,Category.homeExpenses),
    ];
  }

  double get maxTotalExpense{
    double maxTotalExpense=0;
    for(final bucket in buckets)
      {
        if(bucket.totalExpenses> maxTotalExpense){
          maxTotalExpense=bucket.totalExpenses;
        }
      }
    return maxTotalExpense;
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(vertical:4),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient:LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter
        )
      ),
      child: Column(
        children: [
          Expanded(child: Row(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for(final bucket in buckets)
              ChartBar(
              fill: maxTotalExpense ==0? 0:bucket.totalExpenses/maxTotalExpense,
            )
          ],
          ),),
          const SizedBox(height: 12,),

          Row(children:buckets.map((bucket)=>Expanded(child:
          Padding(
              padding:const EdgeInsets.symmetric(horizontal: 4),
              child:Icon(
                categoryIcons[bucket.category],
                color: Colors.pink[700],
              )
          )
          )).toList(),
    )
        ],
      ),
    );
  }
}
