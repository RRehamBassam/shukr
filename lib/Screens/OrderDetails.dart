import 'package:flutter/material.dart';
import 'package:thanks/Screens/Cart.dart';
import 'package:thanks/widget/buttonFill.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      toolbarHeight: 80,
    elevation: 2,
    backgroundColor: Colors.white,
      title:  Text(
        "وجبة عائلية رز مع لحم",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Tajawal",fontWeight: FontWeight.w500,
          fontSize: 22,
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
              padding: EdgeInsets.symmetric(vertical: 16),
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*0.99,
              decoration: BoxDecoration(
                color:  Colors.white,
              ),
              child:  Column(
                children: [
                  rowText( "بيانات الطلب","#888A9C"),
                  SizedBox(height: 5,),
                  rowTextsection( "عدد الافراد","4 أفراد"),

                  rowTextsection( " اسم المطعم", "معطعم المدينة"),
                  rowTextsection( " الوجبة", "رز مع دجاج"),

                ],
              ),
            ),
            SizedBox(height: 8,),
            Container(

              margin: EdgeInsets.symmetric(horizontal:16),
              child: Align(
                alignment: Alignment.centerRight,
                child: new Text(
                  "إضافات مع الوجبة",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color:Color(0xff17130c),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8,),
            Container(
               padding: EdgeInsets.symmetric(vertical: 16),
              height: MediaQuery.of(context).size.height*0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color:  Colors.white,
              ),
              child:  Column(
                children: [
                  rowTextsection( "حلويات","عدد 2"),
                  //SizedBox(height: 5,),
                  rowTextsection( "مشروبات","عدد 2"),
                  rowTextsection( "مقبلات", "عدد 2"),
                  rowTextsection( " اخري", "عدد 2"),
                  SizedBox(height: 16,),
                  InkWell(
                    onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Cart()));},
                    child: buttonFill(
                      widget: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("Assets/icon-add-cart.png"),
                            SizedBox(width: 6,),
                            new Text(
                              "طلب الوجبة",
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

                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }
  Widget BoxTop(){
    return   Center(
      child: Container(
        margin: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height*0.25,
        width: MediaQuery.of(context).size.width* 0.85,
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
          width: MediaQuery.of(context).size.width*0.3,
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
          width: MediaQuery.of(context).size.width*0.62,
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
          width: MediaQuery.of(context).size.width*0.3,
          child: Align(
            alignment: Alignment.centerRight,
            child: new Text(
             w2,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 16,
                color:Color(0xff999bae),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.62,
          child: Align(
            alignment: Alignment.centerRight,
            child: new Text(w,
    textAlign: TextAlign.right,
    style: TextStyle(
    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
    fontSize: 16,
    color:Color(0xff17130c),
    ),

            ),
          ),
        ),


      ],
    );
  }
}
