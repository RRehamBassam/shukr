import 'package:flutter/material.dart';
import 'package:thanks/items/singleMyOrders.dart';
class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
         "طلباتي",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 22,
            color:Color(0xff17130c),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:  Directionality(
        textDirection: TextDirection.rtl,
        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              new Text(
                "05 يناير 2021",
                style: TextStyle(
                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:Color(0xff888a9c),
                ),
              ),
              SingleMyOrders(),
              SizedBox(height: 16,),
              new Text(
                "05 يناير 2021",
                style: TextStyle(
                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:Color(0xff888a9c),
                ),
              ),
              SizedBox(height: 4,),
              SingleMyOrders(),
              SingleMyOrders(),
              SingleMyOrders(),
            ],
          ),
        )),
      )
    );
  }
}
