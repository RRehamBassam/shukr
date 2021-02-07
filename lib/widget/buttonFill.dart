import 'package:flutter/material.dart';
class buttonFill extends StatelessWidget {
  Widget widget;
  buttonFill({this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width*0.14,
      width: MediaQuery.of(context).size.width*0.85,
      padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
      ),
      child:widget ,
    );
  }
}
