import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanks/Screens/OrderConfirmation.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/singleOfferGride.dart';
import 'package:thanks/widget/buttonFill.dart';
import 'package:thanks/widget/loading.dart';
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  NetworkRequest networkRequest=new NetworkRequest();
bool click;

@override
  void initState() {
  click=false;
  length=0;
    // TODO: implement initState
    super.initState();
  }
  int length;
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
    FutureBuilder<dynamic>(
    future:   networkRequest.getCart(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      for(int i=0;i<snapshot.data.length;i++)
          length+= int.parse('${snapshot.data[i]['product']['av_meals_count']}');
      return new Container(
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
                     snapshot.data.length<3? "${snapshot.data.length } وجبة":"${snapshot.data.length } وجبات",
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
                     length<3?"$length أفراد":"$length فرد  ",
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
            ); }
      else if (snapshot.hasError) {
      return Center(child: Text("تأكد من إتصال بالإنرنت"));
      }
      // By default, show a loading spinner.
      return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SizedBox(height: 20,),
     // Loading(),
      //   CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
      ],
      );}),
            InkWell(
              onTap: ()=>{
                if(!click){
                  getresultInState(),
                }
              },
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
  String result;
  getresultInState() async {

    await networkRequest.addOrder().then((value){
      print(result);
      setState(() {
        result  = value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")
      });

    });
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>  OrderConfirmation("")));
    if(result=="ok"){

    }else{
    // Fluttertoast.showToast(
    // msg: result,
    // toastLength: Toast.LENGTH_SHORT,
    // gravity: ToastGravity.BOTTOM,
    // timeInSecForIosWeb: 1,
    // backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
    // textColor: Colors.white,
    // fontSize: 16.0
    // );
    }
  }

  Widget Scrol(){
    return FutureBuilder<dynamic>(
        future:   networkRequest.getCart(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
      if(snapshot.data.length==0)
        return  Container(
          margin: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height*0.53,
          child: Column(
            children: [
              SizedBox(height: 25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: MediaQuery.of(context).size.width*0.38,
                      child: Image.asset("Assets/bag.png")),
                  SizedBox(height:10 ,),
                  new Text(
                    "لم تقم بإضافة أي وجبات بعد!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color:Color(0xff767789),
                    ),
                  ),

                ],
              ),

            ],
          ),
        );
// setState(() {
//   length=snapshot.data.length;
// });

    return ListView.builder(
      shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount:snapshot.data.length,
        itemBuilder:(BuildContext ctxt, int index) {

        return singleOffer("${snapshot.data[index]['product']['p_p_meal']}",true,false,snapshot.data[index],id:snapshot.data[index]['id']);
      });
    }
    else if (snapshot.hasError) {
      return Center(child: Text("تأكد من إتصال بالإنرنت"));
    }
    // By default, show a loading spinner.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20,),
        Loading(),
     //   CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
      ],
    );});
  }
  Widget BoxTop(){
    return   Center(
      child: Container(
        margin: EdgeInsets.all(16),
       padding: EdgeInsets.all(8),
       // height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width* 0.9,
         height: 78.00,
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
