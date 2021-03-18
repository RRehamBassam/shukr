import 'package:flutter/material.dart';
import 'package:thanks/Screens/AdminPages/AddOrder.dart';
import 'package:thanks/Screens/Cart.dart';
import 'package:thanks/Screens/OrderDetails.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:fluttertoast/fluttertoast.dart';
class singleOffer extends StatefulWidget {
  String Name;
  bool cart;
  bool matjer;
  var id;
  var items;


  singleOffer(this.Name,this.cart,this.matjer,this.items,{this.id});

  @override
  _singleOfferState createState() => _singleOfferState(Name,cart,matjer,items,id);
}

class _singleOfferState extends State<singleOffer> {
  String Name;
  bool cart;
  bool matjer;
  var items;
  var id;
  NetworkRequest networkRequest=new NetworkRequest();
  _singleOfferState(this.Name,this.cart,this.matjer,this.items,this.id);
  bool requestIsDone=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>cart?{}:Navigator.push(context, new MaterialPageRoute(builder: (context)=>  OrderDetails(items,matjer))),
      child:Stack(
        children: [
         Column(
           children: [
             cart? SizedBox(height: 5,):Container(width: 0,height: 0,),
             Row(
               children: [
                 cart? SizedBox(width: 5,):Container(width: 0,height: 0,),
                  new Container(
                   height: matjer?MediaQuery.of(context).size.height>710?230:MediaQuery.of(context).size.height* 0.32: MediaQuery.of(context).size.height>710?250:MediaQuery.of(context).size.height* 0.34,
                   width:  MediaQuery.of(context).size.width* 0.445,
                   margin: EdgeInsets.all(5),
                   padding: EdgeInsets.all(5) ,
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
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       cart?Container(width: 0,height: 0,): new Container(
                         height: 29,
                         width:  MediaQuery.of(context).size.width* 0.15,
                         // margin: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                           color: Color(0xFF16BA75),
                           boxShadow: [
                             BoxShadow(
                               offset: Offset(0.00,0.00),
                               color: Color(0xff000000).withOpacity(0.06),
                               blurRadius: 10,
                             ),
                           ], borderRadius: BorderRadius.circular(8.00),
                         ),
                         child: Center(
                             child:Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 new Text(
                                   " فرد",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                     fontSize: 14,
                                     color:Color(0xffffffff),
                                   ),
                                 ),
                                 new Text(
                                   items['av_meals_count'],
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                     fontSize: 14,
                                     color:Color(0xffffffff),
                                   ),
                                 ),
                               ],
                             )
                         ),),

                       Column(
                         children: [
                           Center(child: Image.asset("Assets/a.png")),
                           Center(
                             child: new Text(
                               Name==null? "وجبة":Name,
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                 fontSize: 17,
                                 color:Color(0xff17130c),
                               ),
                             ),
                           ),
                           SizedBox(height: 2,),
                           Center(
                             child: new Text(
                               cart || matjer?"": items['admin']['full_name']==null ?"مطعم ":items['admin']['full_name'],
                               style: TextStyle(
                                 fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                 fontSize: 14,
                                 color:Color(0xffb3b5c4),
                               ),
                             ),
                           ),
                         ],
                       ),
                       // SizedBox(height: 4,),
                     cart?Center(
                       child: new Container(
                         margin: EdgeInsets.only(bottom: 16),
                         height: 29,
                         width:  MediaQuery.of(context).size.width* 0.15,
                         // margin: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                           color: Color(0xFF16BA75),
                           boxShadow: [
                             BoxShadow(
                               offset: Offset(0.00,0.00),
                               color: Color(0xff000000).withOpacity(0.06),
                               blurRadius: 10,
                             ),
                           ], borderRadius: BorderRadius.circular(8.00),
                         ),
                         child: Center(
                             child:Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 new Text(
                                   " فرد",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                     fontSize: 14,
                                     color:Color(0xffffffff),
                                   ),
                                 ),
                                 new Text(
                                   items['product']['av_meals_count'],
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                     fontSize: 14,
                                     color:Color(0xffffffff),
                                   ),
                                 ),
                               ],
                             )
                         ),),
                     ):  requestIsDone?botton("تم الطلب",Color(0xffB0B3CB),Color(0xffE7E8F1)): InkWell(
                         onTap: ()async{
                           // setState(()=>requestIsDone=true),
                           // networkRequest.addcartitem(333)
                           if(matjer){
                             Navigator.push(context, new MaterialPageRoute(builder: (context)=>  AddOrder(id: id)));
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
                           }}
                         },
                         child: Center(
                           child: new Container(
                             height: 34.00,
                             width: 118.00,
                             margin: EdgeInsets.only(bottom: 12),
                             decoration: BoxDecoration(
                               boxShadow: [BoxShadow(
                                   color: Color.fromRGBO(34, 134, 234, .3),
                                   blurRadius: 5,
                                   offset: Offset(0, 2)
                               )],
                               color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(8.00),
                             ),
                             child: Center(
                               child: new Text(
                                 matjer?"تعديل " : "طلب الوجبة",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                   fontSize: 16,
                                   color:Color(0xffffffff),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       )
                     ],

                   ),
                 ),

               ],
             )
           ],
         ),
          cart? Positioned(
      top: 0,
      right: 0,
      child: InkWell(
        onTap: ()async{
          await getdeleteCartInState();

          if(deleteCart =="تم الحذف بنجاح"){
            setState(()=>requestIsDone=true);
            Fluttertoast.showToast(
                msg: deleteCart,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                textColor: Colors.white,
                fontSize: 16.0
            ); setState(() {

            });
          //  Navigator.pushan(context, new MaterialPageRoute(builder: (context)=>  Cart()));
          }else   {
            Fluttertoast.showToast(
                msg: deleteCart==null?"لم يتم الحدف حاول مرة اخرى":deleteCart,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
         // networkRequest.deleteCart(id);
        },
        child: CircleAvatar(
         radius: 17.0,
          backgroundColor: Color(0xFFF1395E),
          child: Center(
            child: Image.asset("Assets/noun_Trash_3513304.png")
          ),

        ),
      ),
    ):Container(height: 0,width: 0,)
        ],
      ),
    );
  }
  String deleteCart;
  getdeleteCartInState() async {
    await networkRequest.deleteCart(id.toString()).then((value){
      print(result);
      setState(() {
        deleteCart  = value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")

      });

    });
  }
  // CircleAvatar(
  // radius: 25.0,
  String result;
  getresultInState() async {
    await networkRequest.addcartitem(id).then((value){
      print(result);
      setState(() {
        result  = value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")

      });

    });
  }
  Widget botton(String text,Color textColor,Color backColor){
    return  Center(
      child: new Container(
        height: 34.00,
        width: 118.00,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: backColor,borderRadius: BorderRadius.circular(8.00),
        ),
        child: Center(
          child: new Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 16,
              color:textColor,
            ),
          ),
        ),
      ),
    );
  }
}
