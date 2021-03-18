import 'package:flutter/material.dart';
class buttonFill extends StatelessWidget {
  Widget widget;
  buttonFill({this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.08,
      width: MediaQuery.of(context).size.width*0.8,
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(
              color: Color.fromRGBO(34, 134, 234, .3),
              blurRadius: 10,
              offset: Offset(0, 4)
          )],
        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
      ),
      child:widget ,
    );
  }
}
