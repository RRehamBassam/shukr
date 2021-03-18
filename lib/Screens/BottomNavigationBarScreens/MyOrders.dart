import 'package:flutter/material.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/singleMyOrders.dart';
import 'package:thanks/widget/loading.dart';
class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
         "طلباتي",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 22,
            color:Color(0xff17130c),
          ),
        ),
        centerTitle: true,
      ),
      body:   Directionality(
        textDirection: TextDirection.rtl,
        child:Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child:FutureBuilder<dynamic>(
            future:networkRequest.getOrder(),
            builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
            return Expanded(
            child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
               InkWell(
                 onTap: (){
                   networkRequest.DailyOrders();
                 },
                child: new Text(
                  "05 يناير 2021",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color:Color(0xff888a9c),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,

                  itemCount:snapshot.data.length,
                  itemBuilder: (context, i) {
                    if(snapshot.data[i]['items_data'][0]['product']==null)
                      return Container();
                  return SingleMyOrders(snapshot.data[i]);}),
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
    ); }
    else if (snapshot.hasError) {
      return Center(child: Text("تأكد من إتصال بالإنرنت"));
    }
    // By default, show a loading spinner.
    return
        Container(
          height: 200,
          child: Center(child: Loading()
       // CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
          ),
        )
      ;})
        )),

    );
  }
}
