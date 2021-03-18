import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanks/Screens/AdminPages/AddOrder.dart';
import 'package:thanks/Screens/Cart.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/buttonFill.dart';

class OrderDetails extends StatefulWidget {
  var items;
bool matjer;
  OrderDetails(this.items,this.matjer);

  @override
  _OrderDetailsState createState() => _OrderDetailsState(items,matjer);
}

class _OrderDetailsState extends State<OrderDetails> {
  var items;
  bool matjer;
  String userName;
  _OrderDetailsState(this.items,this.matjer);
  getLoggedInState() async {
    await HelperFunctions.getUserNameSharedPreference().then((value){
      setState(() {
        userName  = value;
      });
    });
  }
  @override
  void initState() {
    getLoggedInState();

    // TODO: implement initState
    super.initState();
  }
  NetworkRequest networkRequest=new NetworkRequest();
  bool requestIsDone=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      toolbarHeight: 80,
      elevation: 1,
      backgroundColor: Colors.white,
      title:  Text(
        items['name']==null?items['p_p_meal']:items['name'],
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Tajawal",fontWeight: FontWeight.w500,
          fontSize: 20,
          color:Color(0xff17130c),
        ),
      ),
      centerTitle: true,
    ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            BoxTop(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16,horizontal:3),
              height: MediaQuery.of(context).size.height*0.23,
              width: MediaQuery.of(context).size.width*0.99,
              decoration: BoxDecoration(
                color:  Colors.white,
              ),
              child:  Column(
                children: [
                  rowText( "بيانات الطلب","#${items['id']}"),
                  SizedBox(height: 5,),
                  rowTextsection( "عدد الافراد",items['av_meals_count']),
                  SizedBox(height: 3,),
                  rowTextsection( " اسم المطعم", matjer?userName:items['admin']['full_name']),
                  SizedBox(height: 3,),
                  rowTextsection( " الوجبة", items['name']==null?"وجبة":items['name']),

                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              margin: EdgeInsets.symmetric(horizontal:20),
              child: Align(
                alignment: Alignment.centerRight,
                child: new Text(
                  "إضافات مع الوجبة",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color:Color(0xff17130c),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Container(
               padding: EdgeInsets.symmetric(vertical: 16),
              height: MediaQuery.of(context).size.height*0.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color:  Colors.white,
              ),
              child:  Column(
                children: [
                  SizedBox(height: 6,),//items['av_meals_count']
                  rowTextsection( items['additions'] is int?"حلويات":items['additions'],""),
                  //SizedBox(height: 5,),
                  // rowTextsection( "مشروبات","عدد 2"),
                  // rowTextsection( "مقبلات", "عدد 2"),
                  // rowTextsection( " اخري", "عدد 2"),
                  SizedBox(height: 28,),
                  InkWell(
                    onTap: () async {
                  if(matjer){
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>  AddOrder(id: items['id'])));
                  }else{
                      await getresultInState();

                      if(result =="تم اضافة الى السلة نجاح"){
                        setState(()=>requestIsDone=true);
                        Fluttertoast.showToast(
                            msg: result,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else   {
                        Fluttertoast.showToast(
                            msg: result,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Cart()));}},
                    child: buttonFill(
                      widget: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("Assets/icon-add-cart.png"),
                            SizedBox(width: 6,),
                            new Text(
                              matjer? "تعديل":  requestIsDone?"تم الطلب": "طلب الوجبة",
                              style: TextStyle(
                                fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color:Color(0xffffffff),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                 SizedBox(height: 16,),
                ],
              ),
            ),
            matjer? InkWell(
              onTap: (){
                getcancelorderState();
              //  networkRequest.cancelorder(items['id']);
              },
              child: Container(
                margin: EdgeInsets.all(16),
               height: 30,
                child: new Text(
                  "حذف الوجبة",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:Color(0xffdd6a6a),
                  ),
                ),
              ),
            ):Container(),
          ],
        ),
      ) ,
    );
  }
  getcancelorderState() async {
    await   networkRequest.cancelorder(items['id']).then((value){
      print(result);
      setState(() {
        result  = value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")
      });
      Fluttertoast.showToast(
          msg: value,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Navigator.pop(context);
    });
  }
  String result;
  getresultInState() async {
    await networkRequest.addcartitem(items["id"]).then((value){
      print(result);
      setState(() {
        result  = value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")

      });

    });
  }
  Widget BoxTop(){
    return   Center(
      child: Container(
        margin: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height*0.22,
        width: MediaQuery.of(context).size.width* 0.82,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.00),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00,0.00),
              color: Color(0xff000000).withOpacity(0.06),
              blurRadius: 10,
            ),
          ],
        ),
        child:  Center(child: Image.asset("Assets/a.png")),
      ),
    );
  }

  Widget rowText(String w,String w2){
    return      Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.349,
          child: Align(
            alignment: Alignment.centerRight,
            child: new Text(
            w2,
            style: TextStyle(
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 18,
              color:Color(0xff707070),
            ),
      ),
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width*0.58,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              w,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 18,
                color:Color(0xff17130c),
              ),
            ),
          ),
        ),


      ],
    );
  }
  Widget rowTextsection(String w,String w2){
    return      Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.35,
          child: Align(
            alignment: Alignment.centerRight,
            child: new Text(
             w2,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 15,
                color:Color(0xff999bae).withOpacity(0.6),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.58,
          child: Align(
            alignment: Alignment.centerRight,
            child: new Text(w,
    textAlign: TextAlign.right,
    style: TextStyle(
    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
    fontSize: 15,
    color:Color(0xff17130c).withOpacity(0.6),
    ),

            ),
          ),
        ),


      ],
    );
  }
}
