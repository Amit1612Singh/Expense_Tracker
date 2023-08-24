import'package:flutter/material.dart';
class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key, required this.fill
});
   final double fill;



  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding:const EdgeInsets.symmetric(horizontal: 4),
      child: FractionallySizedBox(

        heightFactor: fill,
        child:  DecoratedBox(
          decoration: BoxDecoration(
gradient: LinearGradient(colors:[
  Color(0xFFA80F40),
 Colors.brown,
 // Color(0xff81C784),
  Colors.redAccent.shade200,
  Colors.pink.shade100
],
begin: Alignment.bottomCenter,
end: Alignment.topCenter),
            shape: BoxShape.rectangle,

             borderRadius: BorderRadius.vertical(top: Radius.circular(15),),
            color: Colors.black54
          ),
        ),
      ),
    ));
  }
}
