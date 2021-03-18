import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/MyOrders.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/buttonFill.dart';
import 'package:thanks/widget/buttonUnfill.dart';
class RateOrder extends StatefulWidget {
  bool matjer;

  RateOrder(this.matjer);

  @override
  _RateOrderState createState() => _RateOrderState(matjer);
}

class _RateOrderState extends State<RateOrder> {
  bool matjer;

  _RateOrderState(this.matjer);

  NetworkRequest networkRequest=new NetworkRequest();
  var rate;
  String notes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
          toolbarHeight: 80,
        elevation: 2,
        title:new Text(
          "تقييم الطلب",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 22,
            color:Color(0xff17130c),
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.69,
              margin: EdgeInsets.symmetric(horizontal: 16,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16,),
                    height: MediaQuery.of(context).size.height*0.1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "ما هو تقييمك للمطعم والخدمة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color:Color(0xff17130c),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    child: Center(
                      child: RatingBar.builder(
                        initialRating: 1,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        glowColor:Color(0xfff99b1d).withOpacity(0.1),
                        unratedColor:Colors.grey.withOpacity(0.1) ,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xfff99b1d),
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            rate=rating;
                          });
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,

                    child: Container(
                      width: MediaQuery.of(context).size.width*0.75,
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        onChanged: (val){
                          setState(() {
                            notes=val;
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:     "اذا كان لديك أي ملاحظات علي المطعم يمكنك كتابتها هنا",
                            hintStyle: TextStyle(
                              fontFamily: "Tajawal",
                              fontSize: 14,
                              color:Color(0xff000000).withOpacity(0.50),
                            )
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    height: 1.00,
                    width: 343.00,
                    decoration: BoxDecoration(
                      color: Color(0xffbdc4cc),
                      border: Border.all(width: 0.50, color: Color(0xffdddddd),), borderRadius: BorderRadius.circular(4.00),
                    ),
                  ),
                  SizedBox(height: 6,),

                ],
              ),
            ),
            InkWell(
              onTap: ()async{
                if(matjer){
                  print(matjer);
                  print("11");
                  await getrateUserInState();
                  Fluttertoast.showToast(
                      msg: message,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  //networkRequest.rateUser( );
                  Navigator.pop(context);
                }else
           {
             // networkRequest.rate( rate);
             await getrateUserRInState();
              //  networkRequest.rateRestaurant(  double.parse(rate),notes);
                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>  MyOrders()));
                await getAdminInState();}


                // Navigator.of(context).pushAndRemoveUntil(
                //     MaterialPageRoute(builder: (_){
                //       return Home(userIsAminIn);
                //     }),(route)=> false
                // );
              },
              child: Container(
                //height: MediaQuery.of(context).size.height*0.3,
                child:   buttonFill(widget: Center(
                  child: new Text(
                    "ارسال التقييم",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color:Color(0xffffffff),
                    ),
                  ),
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
  String message;
  bool userIsAminIn;
  getAdminInState() async {
    await HelperFunctions.getUserAdminSharedPreference().then((value){
      setState(() {
        userIsAminIn  = value;
      });
    });
  }
  getrateUserInState() async {
    await networkRequest.rateUser(rate.toString(),notes ).then((value){
      setState(() {
        message  = value;
      });
    });
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  getrateUserRInState() async {
    await networkRequest.rateRestaurant(rate.toString(),notes ).then((value){
      setState(() {
        message  = value;
      });
    });
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
