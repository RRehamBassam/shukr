import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thanks/Screens/RateOrder.dart';
import 'package:thanks/api/NetworkRequest.dart';
class SingleMyOrders extends StatefulWidget {
  Map map;

  SingleMyOrders(this.map);

  @override
  _SingleMyOrdersState createState() => _SingleMyOrdersState(map);
}

class _SingleMyOrdersState extends State<SingleMyOrders> {
  Map map;
  NetworkRequest networkRequest=new NetworkRequest();
  _SingleMyOrdersState(this.map);
  bool isDone=false;
  @override
  Widget build(BuildContext context) {
    print(map['id']);
    return new Container(
      height: 120.00,
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
          SizedBox(width: 8,),
          Container(
            height: 95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(  map['items_data'][0]['product']['p_p_meal']==null?"وجبة":"${map['items_data'][0]['product']['p_p_meal']}",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color:Color(0xff17130c),
                  ),
                ),
                new Text( map['items_data'][0]['product']['description']==null?"مطعم ":map['items_data'][0]['product']['description'],
                  style: TextStyle(
                    fontFamily: "SF Pro Display",
                    fontSize: 14,
                    color:Color(0xfff99b1d),
                  ),
                ),]),
                fill(),
              ],
            ),
          ),
          Spacer(),
          isDone? InkWell(
            onTap: ()=>  Navigator.push(context, new MaterialPageRoute(builder: (context)=>  RateOrder(false))),
            child: Container(
              height: 90,
              margin: EdgeInsets.only(left: 8),
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
          ):Container()
        ],
      ),
    );
  }
  Widget fill(){
    return InkWell(
      onTap: (){
      //  networkRequest.rateUser( );
        if(map['status_ar']=="تم التسليم"){
          setState(() {
            isDone=true;
          });

        }
      },
      child: new Container(
          height:map['status_ar']=="طلب جديد"?20.00: 30.00,
          width:map['status_ar']=="طلب جديد"?60.00: 90.00,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
                color: Color.fromRGBO(34, 134, 234, .3),
                blurRadius: 5,
                offset: Offset(0, 2)
            )],
          color: !isDone?Color(0xfff99b1d):Color(0xff16BA75),
            borderRadius: BorderRadius.circular(2.00),
          ),
          child: Center(
            child: new Text(//data['status_ar']=="جاري التوصيل"?"تم رفض":['status_ar']=="جاري التجهيز"?"جاهز للاستلام":['status_ar'],"تم التسليم"
              map['status_ar']=="طلب جديد"?"جديد": map['status_ar']=="جاري التوصيل"?"تم رفض":!isDone?map['status_ar']=="جاري التجهيز"?"جاهز للاستلام":map['status_ar']:"تم الإستلام",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SF Pro Display",fontWeight: FontWeight.w500,
                fontSize: map['status_ar']=="طلب جديد"?12:14,
                color:Color(0xffffffff),
              ),
            ),
          ),
      ),
    );
  }

}
