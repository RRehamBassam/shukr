import 'package:flutter/material.dart';
class backgroundWite extends StatelessWidget {
  Widget child;
  backgroundWite({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16,left: 16,right: 16),
      height: MediaQuery.of(context).size.height * 0.888,
      width:MediaQuery.of(context).size.width ,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
          boxShadow: [BoxShadow(
              color: Color.fromRGBO(34, 134, 234, .3),
              blurRadius: 20,
              offset: Offset(0, 10)
          )]
      ),
      child: child,
    );
  }


}
