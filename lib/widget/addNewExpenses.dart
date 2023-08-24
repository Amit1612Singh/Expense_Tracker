import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';
final  FormatDate  =DateFormat.yMMMd();


class NewExpenses extends StatefulWidget {
  const NewExpenses( {required  this.addShowExpense,super.key});

  final void Function( Expense expense) addShowExpense;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime? pickedDate;
  Category metionedCategory = Category.food;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _dataPicker() async {
    final date = DateTime.now();
    final firstDate = DateTime(date.year - 1, date.month, date.day);

    final _choosenDate = await showDatePicker(
        context: context,
        initialDate: date, firstDate: firstDate, lastDate: date);

    setState(() {
      pickedDate = _choosenDate;
    });
  }



  void savedExpenses() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInvaild = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text
        .trim()
        .isEmpty || amountInvaild || pickedDate == null) {
      showDialog(context: context, builder: (context)=>
          AlertDialog(
            title: const Text("Invalid Input"),
            content: const Text("Please enter valid details"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              },
                child: const Text("cancle"),)
            ],
          ),
      );
      return;
    }
    widget.addShowExpense(Expense(
        date:pickedDate!,
        amount:enteredAmount,
        title:_titleController.text,
        category:metionedCategory));

    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
   // final GlobalKey formKey= GlobalKey<FormState>();
    return Padding(padding: EdgeInsets.fromLTRB(18,60,20,22),
    child: Column(children: [
      Column(
        children: [
          TextFormField(maxLength: 50,
          // validator: (v){
          //   if(v!.isEmpty){ "Please Enter Title";}
          //     return null;
          // },
          controller:_titleController ,

          keyboardType: TextInputType.text,
          decoration: const InputDecoration(label: Text("Title"),
          focusColor: Colors.blue ),),
          Row(

            children: [
              Expanded(
                child: TextFormField(
                // validator: (v){
                //   if(v!.isEmpty){ "Please Enter amount";}
                //   return null;
                // },
                controller:_amountController ,

                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: ' \$ ',
                  label: Text(" Amount"), ),
              ),),
              const SizedBox(width: 5,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Text( pickedDate==null ?" no date selected":FormatDate.format(pickedDate!),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(onPressed : _dataPicker,
                      icon: const Icon(Icons.calendar_month)),
                    Container()
                ],),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
          DropdownButton(items: Category.values.map((items) =>
              DropdownMenuItem(
                value:items ,
                  child: Text(items.name.toUpperCase()))).toList(),
              onChanged:(V){
            if(V==null){
              return;}
            setState(() {
              metionedCategory=V;});
              },
          value:metionedCategory ),



              TextButton(onPressed:(){
                Navigator.pop(context);
              }, child: const Text("Cancel")),
              ElevatedButton(onPressed: (){
                savedExpenses();
              //  if(formKey.currentState!.validate()){}
                }
              , child: const Text("Save Expense"))
            ],
          )
        ],
      )
    ]),);
  }
}
