import 'package:flutter/material.dart';
class SingleMyOrders extends StatefulWidget {
  @override
  _SingleMyOrdersState createState() => _SingleMyOrdersState();
}

class _SingleMyOrdersState extends State<SingleMyOrders> {
  bool isDone=false;
  @override
  Widget build(BuildContext context) {

    return new Container(
      height: 140.00,
      width:MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00,5.00),
            color: Color(0xff242424).withOpacity(0.05),
            blurRadius: 15,
          ),
        ], borderRadius: BorderRadius.circular(4.00),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child:Center(child: Image.asset("Assets/SingleMyOrders.png")),
              //SingleMyOrders
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(
                  "وجبة عائلية رز مع  لحم",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color:Color(0xff17130c),
                  ),
                ),
                new Text(
                  "مطعم البيك",
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 14,
                    color:Color(0xfff99b1d),
                  ),
                ),]),
                fill(),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget fill(){
    return new Container(
        height: 30.00,
        width: 90.00,
        decoration: BoxDecoration(
        color: !isDone?Color(0xfff99b1d):Color(0xff16BA75),
          borderRadius: BorderRadius.circular(2.00),
        ),
        child: Center(
          child: new Text(
            !isDone?"جاهزة للاستلام":"تم الإستلام",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "SF Pro Display",fontWeight: FontWeight.w500,
              fontSize: 14,
              color:Color(0xffffffff),
            ),
          ),
        ),
    );
  }
}
