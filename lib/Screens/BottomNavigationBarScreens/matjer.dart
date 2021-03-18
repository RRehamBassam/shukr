import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:grafpix/pixloaders/pix_loader.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/OrdersAdminNotEmpty.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/singleOfferGride.dart';
import 'package:thanks/items/singleOrderTajer.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/loading.dart';
import 'dart:convert' as convert;
import '';
class matjer extends StatefulWidget {
  bool tajerAccount;
bool Monthly;

  matjer(this.tajerAccount,this.Monthly);

  @override
  _matjerState createState() => _matjerState(tajerAccount,Monthly);
}

class _matjerState extends State<matjer> {
  bool tajerAccount;
  bool Monthly;
  bool Admin;
  _matjerState(this.tajerAccount,this.Monthly);
  bool  SearchPersonBox;
  bool Empty;
  String userName;
  int chooseSearch;
  String userImage;
  NetworkRequest networkRequest=new NetworkRequest();


  getLoggedInState() async {
    await HelperFunctions.getUserNameSharedPreference().then((value){
      setState(() {
        userName  = value;
      });
    });
  }
  List<String> list=<String>["رز مع لحم","رز مع دجاج","برجر","وجبة مشاوي","رز مع لحم ضاني","وجبة غذائية"];
  Uint8List bytes;
  getImageInState() async {
    await HelperFunctions.getUserImageSharedPreference().then((value){
      setState(() {
        userImage  = value;
        bytes = convert.base64.decode(userImage);
      });
    });
  }
  @override
  void initState() {
    SearchPersonBox=false;
    chooseSearch=0;
    getLoggedInState();
    getImageInState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("$Monthly kkkkk");
    Admin=tajerAccount;
    Empty=false;

   // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Column(
      children: [
        BoxTop(),
        Admin?Empty? OrdersAdminEmpty():OrdersAdminNotEmpty(Monthly):GridBox(),
      ],
    );
  }

  Widget OrdersAdminEmpty(){
    return Container(
      margin: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height*0.53,
      child: Column(
        children: [
          Row(
            children: [
              new Text(
                "( 0 طلبات )",
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
                  fontSize: 16,
                  color:Color(0xff17130c),
                ),
              ),
            ],
          ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(width: MediaQuery.of(context).size.width*0.38,
                   child: Image.asset("Assets/bag.png")),
               new Text(
                 "لم تقم بإضافة أي وجبات بعد!",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                   fontSize: 24,
                   color:Color(0xff767789),
                 ),
               ),
               new Text(
                 "إبدا بإضافة الوجبات للمستفيدين في حفظ النعمة",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                   fontSize: 14,
                   color:Color(0xff888a9c),
                 ),
               ),
             ],
           ),
         Spacer(),
          Container(
            width: MediaQuery.of(context).size.width*0.15,
            child: Column(
              children: [
                Image.asset("Assets/chevron.png"),
              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget GridBox(){
    return FutureBuilder<dynamic>(
        future: networkRequest.getUserMeals(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: GridView.count(
                crossAxisCount: 2,
                cacheExtent: 5,
                shrinkWrap: true,
                childAspectRatio: 45/ 60,
                children: List.generate(snapshot.data.length, (index) {
                  return Center(
                   child:singleOffer(snapshot.data[index]['name'],false,false,snapshot.data[index],id:snapshot.data[index]['id']),
                  );
                }),
              ),
            ) ,
          ); }
          else if (snapshot.hasError) {
            return Center(child: Text("تأكد من إتصال بالإنرنت"));
          }
    // By default, show a loading spinner.
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30,),
        Loading(),
        // Center(
        //   child: PixLoader(
        //       loaderType: LoaderType.Spinner, faceColor: Color(0xfff99b1d)),
        // )
        //CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
      ],
    );});
  }
  Widget BoxTop(){
    return   Container(
    padding: EdgeInsets.all(16),
      height: SearchPersonBox?MediaQuery.of(context).size.height * 0.495: MediaQuery.of(context).size.height * 0.185,
      width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00,0.00),
            color: Color(0xff000000).withOpacity(0.08),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 18,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text(
               "أهلا بك",
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontFamily: "Tajawal",
                 fontSize: 18,
                 color:Color(0xff748a9d),),),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 userImage==null? new Container(
                   height: 38.00,
                   width: 38.00,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage("Assets/profileIcon.png"),
                     ),borderRadius: BorderRadius.circular(6.00),
                   ),
                 ):ClipRRect(
        borderRadius: BorderRadius.circular(6.00),
    child: Image.memory(bytes,fit: BoxFit.fitWidth,height: 40.0,width: 40.0,),
    ),
                 Text(
                   userName!=null?"$userName    ":"",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                     fontSize: 20,
                     color:Color(0xff3d3b39),
                   ),),
               ],
             )

           ],
         ),
        Row(
          children: [
           // tajerAccount? search():SearchPerson(),
           // SizedBox(width: 12,),
            // Directionality(
            //     textDirection: TextDirection.rtl,
            //     child: Container(
            //       padding: EdgeInsets.only(right: 16,left: 16),
            //       height:  MediaQuery.of(context).size.height * 0.07,
            //       width: MediaQuery.of(context).size.width *0.74,
            //       decoration: BoxDecoration(
            //         color: Color(0xfff5f6fb),borderRadius: BorderRadius.circular(8.00),
            //       ),
            //       child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
            //         cursorColor: Color(0xfff99b1d),
            //         maxLength: 9,
            //         // keyboardType:TextInputType.number,
            //         decoration: InputDecoration(
            //             contentPadding: EdgeInsets.only(bottom: 7),
            //             border: InputBorder.none,
            //             hintText:       "ابحث عن وجبات ",
            //             icon: InkWell(
            //                 child: const Icon(Icons.search,color: Color(0xffB0B3CB))),
            //             hintStyle:  TextStyle(
            //               fontFamily: "Tajawal",
            //               fontSize: 13,
            //               color:Color(0xffb0b3cb).withOpacity(0.78),
            //             ),
            //             labelStyle: null
            //         ),
            //       ),)),
          ],
        ),
          SearchPersonBox?    Directionality(
              textDirection: TextDirection.rtl,child:Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.count(
                      crossAxisCount: 4,
                      childAspectRatio: 170/ 70,
                      children: List.generate(11, (index) {
                        return Center(
                          child:index!=8?GridSingleItem(index<2?"فرد ${index+1}":index>8?"أفراد ${index}":"أفراد ${index+1}",chooseSearch==index?Color(0xff16BA75):Color(0xfff5f5f5),index):Container(height: 30.88, width: 75.00,),
                        );
                      }),
                    ),
                  ) ,
                ),
              ],
            ),
          )):Container(),

        ],
      ),
    );
  }
  Widget SearchPerson(){
    return InkWell(
      onTap: ()=>setState(()=>SearchPersonBox=!SearchPersonBox),
        child: SearchPersonBox?new Container(
          height: 40.00,
          width: 40.00,
          decoration: BoxDecoration(
            color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(45.00),
          ),
          child: Center(child: Icon(Icons.clear,color: Colors.white,),),
        ):Image.asset("Assets/SearchPerson.jpg"));
  }
 Widget search(){
    return new Container(
      height:  MediaQuery.of(context).size.height * 0.065,
      width: MediaQuery.of(context).size.width *0.12,
      decoration: BoxDecoration(
        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(5.00),
      ),
      child:  Center(child:Icon(Icons.search,color: Colors.white,size: 28,)),
    );
 }
  Widget GridSingleItem(String name,Color back,int index){
    return InkWell(
      onTap: ()=>setState(()=>chooseSearch=index),
      child: new Container(
        height: 30.88,
        width: 75.00,
        decoration: BoxDecoration(
          color: back,borderRadius: BorderRadius.circular(6.00),
        ),
        child:
        Center(
          child: new Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 14,
              color:chooseSearch==index?Color(0xffffffff):Color(0xff888a9c),
            ),
          ),
        ),
      ),
    );
  }

}
