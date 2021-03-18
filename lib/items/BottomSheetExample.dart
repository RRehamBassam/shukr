import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/items/MyTaps.dart';
import 'package:thanks/services/app_state.dart';
import 'package:thanks/widget/buttonFill.dart';

import 'ok.dart';
class BottomSheetExample extends StatelessWidget {
var id;
Function(bool) call;
BottomSheetExample(this.id,this.call);

  @override
  Widget build(BuildContext context) {
   // AppState  appState = Provider.of<AppState>(context);
   // final isSelected = appState.selectedCategory == category.categoryId;
    return Container(
     color: Colors.black45.withOpacity(0.56),

      child: Container(
        padding: EdgeInsets.all(20.0),
        height: 350,
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
            // new Container(
            //   height: 46.00,
            //   width: 273.00,
            //   decoration: BoxDecoration(
            //     color: Color(0xffffffff).withOpacity(0.15),
            //     border: Border.all(width: 1.00, color: Color(0xff000000).withOpacity(0.15),), borderRadius: BorderRadius.circular(12.00),
            //   ),
            //   child: new Text(
            //     "جاهز للتسليم",
            //     textAlign: TextAlign.right,
            //     style: TextStyle(
            //       fontFamily: "DIN Next LT W23",
            //       fontSize: 18,
            //       color:Color(0xff000000),
            //     ),
            //   ),
            // ),
            // new Container(
            //   height: 46.00,
            //   width: 273.00,
            //   decoration: BoxDecoration(
            //     color: Color(0xffffffff).withOpacity(0.15),
            //     border: Border.all(width: 1.00, color: Color(0xff000000).withOpacity(0.15),), borderRadius: BorderRadius.circular(12.00),
            //   ),
            //   child: new Text(
            //     "تم التسليم",
            //     textAlign: TextAlign.right,
            //     style: TextStyle(
            //       fontFamily: "DIN Next LT W23",
            //       fontSize: 18,
            //       color:Color(0xff000000),
            //     ),
            //   ),
            // ),
            // new Container(
            //   height: 46.00,
            //   width: 273.00,
            //   decoration: BoxDecoration(
            //     color: Color(0xffffffff).withOpacity(0.15),
            //     border: Border.all(width: 1.00, color: Color(0xff000000).withOpacity(0.15),), borderRadius: BorderRadius.circular(12.00),
            //   ),
            //   child: new Text(
            //     "رفض الطلب",
            //     textAlign: TextAlign.right,
            //     style: TextStyle(
            //       fontFamily: "DIN Next LT W23",
            //       fontSize: 18,
            //       color:Color(0xff000000),
            //     ),
            //   ),
            // ),

            MyTabs((val){
if(val==1){
  call(true);
}
            },id),
          //  ok(),
            // InkWell(
            //   onTap: (){
            //     appState.updateCategory(3);
            //   },
            //   child: Container(
            //     height: MediaQuery.of(context).size.height*0.07,
            //     width: MediaQuery.of(context).size.width*0.7,
            //     padding: EdgeInsets.only(top: 5),
            //     decoration: BoxDecoration(
            //       boxShadow: [BoxShadow(
            //           color: Color.fromRGBO(34, 134, 234, .3),
            //           blurRadius: 10,
            //           offset: Offset(0, 4)
            //       )],
            //       color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
            //     ),
            //     child: Center(
            //       child: new Text(
            //         "تاكيد",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           fontFamily: "Tajawal",fontWeight: FontWeight.w700,
            //           fontSize: 18,
            //           color:Color(0xffffffff),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }
}