import 'package:flutter/material.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/singleOrderTajer.dart';
import 'package:thanks/widget/loading.dart';

class OrdersAdminNotEmpty extends StatefulWidget {
  bool  Monthly;

  OrdersAdminNotEmpty(this.Monthly);

  @override
  _OrdersAdminNotEmptyState createState() => _OrdersAdminNotEmptyState(Monthly);
}

class _OrdersAdminNotEmptyState extends State<OrdersAdminNotEmpty> {
  bool Monthly;

  _OrdersAdminNotEmptyState(this.Monthly);

  @override
  Widget build(BuildContext context) {
    print(Monthly);
    NetworkRequest networkRequest=new NetworkRequest();
    return Flexible(
        child:FutureBuilder<dynamic>(
            future:    Monthly?networkRequest.monthOrders():  networkRequest.DailyOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                return Column(

                  children: [
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          new Text(
                            "( ${snapshot.data['currentorders'].length+snapshot.data['ordercanceled'].length} طلبات )",
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color:Color(0xff888a9c),
                            ),
                          ),
                          Spacer(),
                          new Text(
                            "الطلبات لهذا اليوم",
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color:Color(0xff17130c),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        //  physics: AlwaysScrollableScrollPhysics(),
                          itemCount:snapshot.data['currentorders'].length,

                          itemBuilder:(BuildContext ctxt, int index) {
                          // if(snapshot.data['currentorders'][index]['product']==null)
                          //   return Container();
                            return singleOrderTajer(snapshot.data['currentorders'][index]);
                          }

                      ),
                    ),
                    ListView.builder(
                       // physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:snapshot.data['ordercanceled'].length,

                        itemBuilder:(BuildContext ctxt, int index) {
                          if(snapshot.data['currentorders'][index]['product']==null)
                            return Container();
                          return singleOrderTajer(snapshot.data['ordercanceled'][index]);
                        }

                    )
                  ],
                );  }
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
                  // CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
                ],
              );})
    );
  }
}
