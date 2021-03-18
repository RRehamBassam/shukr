import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanks/Screens/AdminPages/UserRequestsOrder.dart';
import 'package:thanks/Screens/RateOrder.dart';
import 'package:thanks/items/BottomSheetExample.dart';
class singleOrderTajer extends StatefulWidget {
  dynamic data;

  singleOrderTajer(this.data);

  @override
  _singleOrderTajerState createState() => _singleOrderTajerState(data);
}

class _singleOrderTajerState extends State<singleOrderTajer> {
  dynamic data;
bool rate;
  _singleOrderTajerState(this.data);
int state=0;
  List<String> sweet=<String>["حلويات","مشروبات غازية","عصير","خبز","اخري"];
  @override
  void initState() {
    rate=false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  InkWell(
      focusColor:Color(0xfff99b1d) ,
      splashColor:Color(0xfff99b1d) ,
      onTap: ()=>  Navigator.push(context, new MaterialPageRoute(builder: (context)=>  UserRequestsOrder(data['items_data'],data))),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16,vertical:5),
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
            height: 110.00,
            width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
          BoxShadow(
          offset: Offset(0.00,0.00),
          color: Color(0xff000000).withOpacity(0.06),
          blurRadius: 10,
          ),
          ], borderRadius: BorderRadius.circular(8.00),
          ),
        child: Column(
          children: [
            partOne(),
            // Row(
            //   children: [
            //     SizedBox(width: 14,),
            //     new Text(
            //       "الإضافات",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //         fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            //         fontSize: 12,
            //         color:Color(0xff888a9c),
            //       ),
            //     ),
            //     SizedBox(width: 16,),
            //     new Container(
            //       height: 1.00,
            //       width: MediaQuery.of(context).size.width*0.6,
            //       color: Color(0xffe7e8f1),
            //     ),
            //
            //   ],
            // ),
           // partTwo(sweet),
           //  new Container(
           //    height: 1.00,
           //    width: MediaQuery.of(context).size.width*0.75,
           //    color: Color(0xffe7e8f1),
           //  ),
            // SizedBox(height: 8,),
            // partThree(),
            // SizedBox(height: 8,),
          ],
        ),
          )),
    );
  }
  Widget partOne(){
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(8),
          child:Center(child: Image.asset("Assets/icons8-meal-100.png")),
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
                    // new Text(data['user']['full_name']==null?"":data['user']['full_name'],
                    // //  data['items_data'][0]['product']['name']==null?"وجبة":data['items_data'][0]['product']['name'],
                    //   style: TextStyle(
                    //     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    //     fontSize: 17,
                    //     color:Color(0xff17130c),
                    //   ),
                    // ),
                    // SizedBox(height: 1,),
                    Row(
                      children: [
                        SizedBox(width: 12,),
                        new Text(
                          "رقم الطلب",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color:Color(0xff888a9c),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 20,
                          width: 1,
                          color:Color(0xffe7e8f1) ,
                        ),
                        new Text("#${data['id']}",
                          // "#${data['items_data'][0]['product']['id']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color:Color(0xff17130c),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 1,),
                   ]),
              SizedBox(height: 12,),
              Container(
                margin: EdgeInsets.only(right:12
                ),
                width: MediaQuery.of(context).size.width*0.55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    new Container(
                     // margin: EdgeInsets.all(16),
                      height: 27.00,
                      width: 87.00,
                      decoration: BoxDecoration(
                        color: Color(0xfffeeeda),borderRadius: BorderRadius.circular(5.00),
                      ),
                      child: Center(
                        child: new Text(
                         data['status_ar']=="جاري التوصيل"?"تم رفض":data['status_ar']=="جاري التجهيز"?"جاهز للاستلام":data['status_ar'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color:Color(0xfff99b1d),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text(
                       "${data['created_at'].split("T")[1].split(":")[0]}:${data['created_at'].split("T")[1].split(":")[1]} ساعة",
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontSize: 12,
                          color:Color(0xff888a9c),
                        ),
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        )
      ],
    );
  }
  Widget partTwo(List list){
return Expanded(
  child: Container(
    margin: EdgeInsets.symmetric(horizontal: 8),

    child: GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 105/ 40,
      children: List.generate(1, (index) {
        return Center(
          child:GridSingleItem(list[index]),
        );
      }),
    ),
  ) ,
);
  }
  Widget GridSingleItem(String name){
    return new Container(
      margin: EdgeInsets.symmetric(horizontal:4),
      height: 37.88,
      width: 100.00,
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),borderRadius: BorderRadius.circular(6.00),
      ),
      child:
      Center(
        child: new Text("",
        //  data['items_data'][0]['product']['additions'],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 14,
            color:Color(0xff888a9c),
          ),
        ),
      ),
    );
  }

  Widget partThree(){
return Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  // Row(
  //   children: [
  //     SizedBox(width: 16,),
  //     new Text(
  //       "رقم الطلب",
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //         fontFamily: "Tajawal",fontWeight: FontWeight.w500,
  //         fontSize: 12,
  //         color:Color(0xff888a9c),
  //       ),
  //     ),
  //     Container(
  //       margin: EdgeInsets.symmetric(horizontal: 4),
  //       height: 20,
  //       width: 1,
  //       color:Color(0xffe7e8f1) ,
  //     ),
  //     new Text("#${data['id']}",
  //      // "#${data['items_data'][0]['product']['id']}",
  //       textAlign: TextAlign.center,
  //       style: TextStyle(
  //         fontFamily: "Tajawal",fontWeight: FontWeight.w500,
  //         fontSize: 18,
  //         color:Color(0xff17130c),
  //       ),
  //     )
  //   ],
  // ),
    data['status_ar']=="تم التسليم"?SizedBox(width: 3,):SizedBox(width: 0,),
    data['status_ar']=="تم التسليم"? InkWell(
      onTap: ()=>  Navigator.push(context, new MaterialPageRoute(builder: (context)=>  RateOrder(true))),
      child: Container(
      //  height: 90,
     //   margin: EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.star,size:22 ,color:Color(0xfff99b1d)),
            SizedBox(width: 4,),
            Text("قيم" ,style: TextStyle(
              fontFamily: "SF Pro Display",
              fontSize: 14,
              color:Color(0xff434f56),
            ),)
          ],
        ),
      ),
    ):Container(),
    InkWell(
    onTap: (){
    showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
          child: Container(
          decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          ),
          ),

          padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
          child: BottomSheetExample(data['id'],(v){

          }),
          ),
          ),
    );
    setState(() {
      rate=true;
    });
    },
   child: new Container(
      height:data['status_ar']=="طلب جديد"?30.00: 34.00,
      width:rate?100.00:data['status_ar']=="طلب جديد"?110.00: 118.00,
      decoration: BoxDecoration(
        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(8.00),
      ),
      child: Center(
        child: new Text(
          data['status_ar']=="طلب جديد"?"جديد": data['status_ar'],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 16,
            color:Color(0xffffffff),
          ),
        ),
      ),
    ))
  ],
);
  }
}
