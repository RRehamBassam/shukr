import 'package:flutter/material.dart';
import 'package:thanks/Screens/OrderConfirmation.dart';
import 'package:thanks/items/singleOfferGride.dart';
import 'package:thanks/widget/buttonFill.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
          "قائمة الطلبات",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BoxTop(),
            Container(  height: MediaQuery.of(context).size.width* 0.75,
                child: Scrol()),
            new Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
              height: 80.00,
              width: 327.00,
              decoration: BoxDecoration(
                color: Color(0xfff6f6f9),borderRadius: BorderRadius.circular(15.00),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Row(
               crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   new Text(
                     "2 وجبة",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color:Color(0xff999bae),
                     ),
                   ),

                   new Text(
                     "عدد الوجبات",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color:Color(0xff17130c),
                     ),
                   )
                 ],),
                 SizedBox(height: 6,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                   new Text(
                     "2 أفراد",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color:Color(0xff999bae),
                     ),
                   ),

                   new Text(
                     "عدد الأفراد",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color:Color(0xff17130c),
                     ),
                   )
                 ],)
               ],
              ),
            ),
            InkWell(
              onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=>  OrderConfirmation())),
              child: buttonFill(
                widget: Center(
                  child: new Text(
                    "تأكيد الطلب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color:Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 1,)
          ],
        ),
      ),
    );
  }
  Widget Scrol(){
    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder:(BuildContext ctxt, int index) {
          return singleOffer("بيتزا");});
  }
  Widget BoxTop(){
    return   Center(
      child: Container(
        margin: EdgeInsets.all(16),
       padding: EdgeInsets.all(8),
       // height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width* 0.9,
         height: 100.00,
        // width: 325.69,
        decoration: BoxDecoration(
          color: Color(0xff16ba75),borderRadius: BorderRadius.circular(8.00),
        ),
        child:  Column(
          children: [
            new Text(
              "الأخ المستفيد",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 18,
                color:Color(0xffffffff),
              ),
            ),
            new Text(
              "بعد ارسال طلبك سيصلك اشعار بتأكيد تجهيز طلبك \nمن المطعم ويمكنك التوجه بعدها لاستلام طلبك",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",
                fontSize: 13,
                color:Color(0xffffffff),
              ),
            )
          ],
        ),
      ),
    );
  }
}
