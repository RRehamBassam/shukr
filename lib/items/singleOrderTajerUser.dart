import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/Screens/AdminPages/UserRequestsOrder.dart';
import 'package:thanks/Screens/RateOrder.dart';
import 'package:thanks/items/BottomSheetExample.dart';
import 'package:thanks/services/app_state.dart';
class singleOrderTajerUser extends StatefulWidget {
  dynamic data;

  singleOrderTajerUser(this.data);

  @override
  _singleOrderTajerUserState createState() => _singleOrderTajerUserState(data);
}

class _singleOrderTajerUserState extends State<singleOrderTajerUser> {
  dynamic data;

  _singleOrderTajerUserState(this.data);

  List<String> sweet=<String>["حلويات","مشروبات غازية","عصير","خبز","اخري"];
  @override
  Widget build(BuildContext context) {
    return data['product']==null?Container() :InkWell(
      //onTap: ()=>  Navigator.push(context, new MaterialPageRoute(builder: (context)=>  UserRequestsOrder(data['items_data']))),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
            height: 170.00,
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
                Row(
                  children: [
                    SizedBox(width: 14,),
                    new Text(
                      "الإضافات",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color:Color(0xff888a9c),
                      ),
                    ),
                    SizedBox(width: 16,),
                    new Container(
                      height: 1.00,
                      width: MediaQuery.of(context).size.width*0.6,
                      color: Color(0xffe7e8f1),
                    ),

                  ],
                ),
                partTwo(sweet),
              //   ChangeNotifierProvider<AppState>(
              //     create: (_) => AppState(),
              //   child: Consumer<AppState>(
              //       builder: (context, appState, _) {
              //         print(appState.selectedCategory);
              //         if(appState.selectedCategory==1){
              //           //  networkRequest.changestatusorder(id,"4");
              //           //  Navigator.pop(context);
              //         } return Container(
              //          // height: 50,
              //           //width: 50,
              //           child: Row(
              //       children: [
              //
              //           appState.selectedCategory==1?SizedBox(width: 3,):SizedBox(width: 0,),
              //           appState.selectedCategory==1? InkWell(
              //             onTap: ()=>  Navigator.push(context, new MaterialPageRoute(builder: (context)=>  RateOrder(true))),
              //             child: Container(
              //               //  height: 90,
              //               //   margin: EdgeInsets.only(left: 8),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 crossAxisAlignment: CrossAxisAlignment.end,
              //                 children: [
              //                   Icon(Icons.star,size:22 ,color:Color(0xfff99b1d)),
              //                   SizedBox(width: 4,),
              //                   Text("قيم" ,style: TextStyle(
              //                     fontFamily: "SF Pro Display",
              //                     fontSize: 14,
              //                     color:Color(0xff434f56),
              //                   ),)
              //                 ],
              //               ),
              //             ),
              //           ):Container(),
              //       ],
              //     ),
              //         );}),
              // ),

                // new Container(
                //   height: 1.00,
                //   width: MediaQuery.of(context).size.width*0.75,
                //   color: Color(0xffe7e8f1),
                // ),
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
          child:Center(child: Image.asset("Assets/SingleMyOrders.png")),
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
                    new Text(
                      data['product']['p_p_meal']==null?"وجبة":data['product']['p_p_meal'],
                      style: TextStyle(
                        fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color:Color(0xff17130c),
                      ),
                    ),

                    SizedBox(height: 3,),
                  ]),
              new Container(
                height: 26.00,
                width: 65.96,
                decoration: BoxDecoration(
                  color: Color(0xff16ba75),borderRadius: BorderRadius.circular(5.00),
                ),
                child: Center(
                  child: new Text(
                    "${data['product']['av_meals_count']} أفراد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color:Color(0xffffffff),
                    ),
                  ),
                ),
              ),
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
        child: new Text(
            data['product']['additions'],
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
        Row(
          children: [
            SizedBox(width: 16,),
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
            new Text(
              "#${data['product']['id']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 18,
                color:Color(0xff17130c),
              ),
            )
          ],
        ),
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
                    child: BottomSheetExample(data['product']['id'],(v){

                    }),
                  ),
                ),
              );
            },
            child: new Container(
              height: 34.00,
              width: 118.00,
              decoration: BoxDecoration(
                color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(8.00),
              ),
              child: Center(
                child: new Text(
                 "تسليم",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color:Color(0xffffffff),
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}
