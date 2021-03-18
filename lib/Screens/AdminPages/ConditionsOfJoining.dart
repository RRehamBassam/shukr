
import 'package:flutter/material.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/widget/loading.dart';

class ConditionsOfJoining extends StatefulWidget {
  @override
  _ConditionsOfJoiningState createState() => _ConditionsOfJoiningState();
}

class _ConditionsOfJoiningState extends State<ConditionsOfJoining> {
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
         "شروط الإنضمام",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 22,
            color:Color(0xff17130c),
          ),
        ),
        centerTitle: true,
      ),
      body:Card(
        elevation: 3,
        color: Colors.white,
        margin: EdgeInsets.all(16),

        child:Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
             Container(
               height: MediaQuery.of(context).size.height*0.6,
               child:FutureBuilder<dynamic>(
               future:networkRequest.config(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
                 return Column(
                 children: [
                   SizedBox(height: 16,),
                   new Text(
                     "قبل تأكيد الانضمام كشريك خيري للجمعية\n نرجو قراءة الشروط التالية ",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                       fontSize: 16,
                       color:Color(0xff000000),
                     ),
                   ),
                   SizedBox(height: 20,),
                   new Container(
                     height: 1.00,
                     width: 249.00,
                     color: Color(0xfff5f5f5),
                   ),
                   new Text(
                    // '''نص تجريبي للشروط الخاصة بجمعية شكر يكتب هنا  نص تجريبي
                    //  نص تجريبي للشروط الخاصة بجمعية شكر يكتب هنا
                    //
                    //  ''',
                     '''${snapshot.data['about']}''',
                     textAlign: TextAlign.right,
                     maxLines: 15,
                     style: TextStyle(
                       fontFamily: "Tajawal",
                       fontSize: 14,
                       color:Color(0xff17130c),
                     ),
                   )
                 ],);}else if (snapshot.hasError) {
                  return Center(child: Text("تأكد من إتصال بالإنرنت"));
                  }
                  // By default, show a loading spinner.
                  return
                  Container(
                  height: 200,
                  child: Center(child: Loading()
                  // CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
                  ),
                  );})
             ),
              InkWell(
                onTap: ()=>Navigator.pop(context),
                child: Container(
                 // height: MediaQuery.of(context).size.height*0.25,
                  child: new Container(
                    height:MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*0.75,
                    decoration: BoxDecoration(
                     // color: Color(0xfff99b1d),
                      border: Border.all(width: 1.00, color: Color(0xfff99b1d),), borderRadius: BorderRadius.circular(50.00),
                    ),
                    child: Center(child: new Text(
                      "قمت بقراءة الشروط",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color:Color(0xfff99b1d),
                      ),
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
