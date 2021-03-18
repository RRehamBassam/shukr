import 'package:flutter/material.dart';
class backgroungtextfielid extends StatelessWidget {
  Widget widget;

  backgroungtextfielid(this.widget);

  @override
  Widget build(BuildContext context) {
          return new Container(

            height: MediaQuery.of(context).size.height*0.08,
            width: MediaQuery.of(context).size.width*0.82,
      decoration: BoxDecoration(
     // color: Color(0xfff5f6fb),borderRadius: BorderRadius.circular(8.00),
      ),
              child:widget,
      );
  }
}
