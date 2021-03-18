import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/BottomSheetExample.dart';
import 'package:thanks/items/singleMyOrders.dart';
import 'package:thanks/items/singleOrderTajerUser.dart';
import 'package:thanks/models/State.dart';
import 'package:thanks/models/providerUser.dart';

class UserRequestsOrder extends StatefulWidget {
  var data;
  var dataOrder;
  UserRequestsOrder(this.data,this.dataOrder);

  @override
  _UserRequestsOrderState createState() => _UserRequestsOrderState(data,dataOrder);
}

class _UserRequestsOrderState extends State<UserRequestsOrder> {
  var data;
  var dataOrder;
  int index;

  _UserRequestsOrderState(this.data,this.dataOrder);
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  void initState() {
    index=1;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
        "تفاصيل الطلب",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 20,
            color:Color(0xff17130c),
          ),
        ),
        centerTitle: true,
      ),
      body:   Directionality(
          textDirection: TextDirection.rtl,
          child:Container(
              height: MediaQuery.of(context).size.height,
             // margin: EdgeInsets.symmetric(horizontal: 8),
              child: Expanded(
                        child: Container(
                         margin: EdgeInsets.symmetric(horizontal: 4),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16,),
                              new Text(
                                  "  ${dataOrder['created_at'].split("T")[0]} ",
                                style: TextStyle(
                                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color:Color(0xff888a9c),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:data.length,
                                    itemBuilder: (context, i) {
                                      return singleOrderTajerUser(data[i]);}),
                              ),
                              Center(
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.07,
                                  width: MediaQuery.of(context).size.width*0.7,
                                  padding: EdgeInsets.only(top: 5),
                                  margin:EdgeInsets.only(bottom: 6) ,
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(
                                        color: Color.fromRGBO(34, 134, 234, .3),
                                        blurRadius: 10,
                                        offset: Offset(0, 4)
                                    )],
                                    color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      print(dataOrder['id']);
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
                                        child: BottomSheetExample(dataOrder['id'],(v){}),
                                        ),
                                        ),
                                        );

                                    },
                                    child: Center(
                                      child: new Text(
                                        "تعديل الحالة",
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
                              ),
                              // ListView.builder(shrinkWrap: true,
                              //
                              //     itemCount:snapshot.data[0]['items_data'].length,
                              //     itemBuilder: (context, i) {
                              //       return SingleMyOrders(snapshot.data[0]['items_data'][i]);}),
                              // SingleMyOrders(),
                              SizedBox(height: 16,),
                              // new Text(
                              //   "05 يناير 2021",
                              //   style: TextStyle(
                              //     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              //     fontSize: 14,
                              //     color:Color(0xff888a9c),
                              //   ),
                              // ),
                              SizedBox(height: 4,),
                              // SingleMyOrders(),
                              //  SingleMyOrders(),
                              // SingleMyOrders(),
                            ],
                          ),
                        ) ,
                      )
          )),

    );
  }
//   BottomSheetExample(context){
//     // int tokenState =
//     //     Provider.of<providerState>(context, listen: true).tokenUser;
//     return
//       Container(
//         color: Colors.black45.withOpacity(0.56),
//
//         child: Container(
//           padding: EdgeInsets.all(20.0),
//           height: 300,
//           decoration: BoxDecoration(
//             color:Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(11.0),
//               topRight: Radius.circular(11.0),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               SizedBox(height: 16,),
//               Center(
//                 child:  Text(
//                   "هل تم تسليم الوجبة للمستفيد",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
//                     fontSize: 16,
//                     color:Color(0xff3d3b39),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16,),
//               InkWell(
//                 splashColor:Color(0xff95E8B7) ,
//                 onTap: (){
//                   setState(() {
//                    // context.read<providerState>().increment(1);
//                     index=1;
//                   });
//                 },
//                 child: new Container(
//                   height: 42.00,
//                   width: 273.00,
//                   decoration: BoxDecoration(
//                     color:index==1? Color(0xff95E8B7):Color(0xffffffff).withOpacity(0.15),
//                     border: Border.all(width: 1.00, color: Color(0xff000000).withOpacity(0.15),), borderRadius: BorderRadius.circular(12.00),
//                   ),
//                   child: Center(
//                     child: new Text(
//                       "جاهز للتسليم",
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         fontFamily: "DIN Next LT W23",
//                         fontSize: 16,
//                         color:Color(0xff000000),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 4,),
//               InkWell(
//                 splashColor:Color(0xff95E8B7) ,
//                 onTap: (){ index=4;
//                   setState(() {
//                     //context.read<providerState>().increment(4);
//
//                   });
//                 },
//                 child: new Container(
//                   height: 42.00,
//                   width: 273.00,
//                   decoration: BoxDecoration(
//                     color:index==4? Color(0xff95E8B7):Color(0xffffffff).withOpacity(0.15),
//                     border: Border.all(width: 1.00, color: Color(0xff000000).withOpacity(0.15),), borderRadius: BorderRadius.circular(12.00),
//                   ),
//                   child: Center(
//                     child: new Text(
//                       "تم التسليم",
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         fontFamily: "DIN Next LT W23",
//                         fontSize: 16,
//                         color:Color(0xff000000),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 4,),
//               InkWell(
//                 splashColor:Color(0xff95E8B7) ,
//                 onTap: (){
//                   setState(() {
//                    // context.read<providerState>().increment(2);
//                     index=2;
//                   });
//                 },
//                 child: new Container(
//                   height: 42.00,
//                   width: 273.00,
//                   decoration: BoxDecoration(
//                     color:index==2? Color(0xff95E8B7):Color(0xffffffff).withOpacity(0.15),
//                     border: Border.all(width: 1.00, color: Color(0xff000000).withOpacity(0.15),), borderRadius: BorderRadius.circular(12.00),
//                   ),
//                   child: Center(
//                     child: new Text(
//                       "رفض الطلب",
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         fontFamily: "DIN Next LT W23",
//                         fontSize: 16,
//                         color:Color(0xff000000),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
// //             MyTabs((val){
// // if(val==1){
// //   call(true);
// // }
// //             },id),
//               SizedBox(height: 28,),
//               InkWell(
//                 onTap: (){
//                   networkRequest.changestatusorder(data['id'],"$index");
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   height: MediaQuery.of(context).size.height*0.07,
//                   width: MediaQuery.of(context).size.width*0.67,
//                   padding: EdgeInsets.only(top: 5),
//                   decoration: BoxDecoration(
//                     boxShadow: [BoxShadow(
//                         color: Color.fromRGBO(34, 134, 234, .3),
//                         blurRadius: 10,
//                         offset: Offset(0, 4)
//                     )],
//                     color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
//                   ),
//                   child: Center(
//                     child: new Text(
//                       "تاكيد",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: "Tajawal",fontWeight: FontWeight.w700,
//                         fontSize: 18,
//                         color:Color(0xffffffff),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       );
//   }
  //#95E8B7
}
