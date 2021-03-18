import 'package:flutter/material.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/Screens/RateOrder.dart';
import 'package:thanks/services/helperFunctions.dart';
class OrderConfirmation  extends StatefulWidget {
  var id;

  OrderConfirmation(this.id);

  @override
  _OrderConfirmationState createState() => _OrderConfirmationState(id);
}

class _OrderConfirmationState extends State<OrderConfirmation > {
  var id;

  _OrderConfirmationState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF99B1D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("Assets/content2.png")),
          new Text(
            "تم تقديم طلبك بنجاج\nرقم طلبك هو",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 24,
              color:Color(0xffffffff),
            ),
          ),
          new Text(
            "#5678",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 36,
              color:Color(0xffffffff),
            ),
          ),

          InkWell(
            onTap: () async {
              await getAdminInState();

              Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_){
              return Home(userIsAminIn);
              }),(route)=> false
              );
            //  Navigator.push(context, new MaterialPageRoute(builder: (context)=>  RateOrder()))
            },

            child: new Container(
            height: MediaQuery.of(context).size.width*0.15,
                width: MediaQuery.of(context).size.width*0.82,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.00,0.00),
                      color: Color(0xff000000).withOpacity(0.07),
                      blurRadius: 10,
                    ),
                  ],
                // color: Color(0xfff99b1d),
                border: Border.all(width: 1.00, color:  Color(0xffffffff),),
                  borderRadius: BorderRadius.circular(50.00),
                ),
                child:  Center(
                child: new Text(
                  "العودة للرئيسية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color:Color(0xffffffff),
                  ),
                ),
                ),
                ),
          )
        ],
      ),
    );
  }
  bool userIsAminIn;
  getAdminInState() async {
    await HelperFunctions.getUserAdminSharedPreference().then((value){
      setState(() {
        userIsAminIn  = value;
      });
    });
  }
}
