import 'package:flutter/material.dart';
import 'package:thanks/items/MyTaps.dart';
import 'package:thanks/widget/buttonFill.dart';
class BottomSheetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.black45.withOpacity(0.56),

      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(11.0),
            topRight: Radius.circular(11.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 16,),
            Center(
              child:  Text(
                "هل تم تسليم الوجبة للمستفيد",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color:Color(0xff3d3b39),
                ),
              ),
            ),

            MyTabs(),
            buttonFill(
              widget: Center(
                child: new Text(
                  "تاكيد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color:Color(0xffffffff),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}