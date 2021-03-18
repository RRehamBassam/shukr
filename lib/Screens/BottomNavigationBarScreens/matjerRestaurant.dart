import 'package:flutter/material.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/singleOfferGride.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/loading.dart';
import 'dart:typed_data';
import 'dart:convert' as convert;
class matjerRestaurant extends StatefulWidget {
  @override
  _matjerRestaurantState createState() => _matjerRestaurantState();
}

class _matjerRestaurantState extends State<matjerRestaurant> {
  String userName;
  String userImage;
  NetworkRequest networkRequest=new NetworkRequest();
  List _notesForDisplay = List();
  List fi = List();
  bool stutsSearch;
  String textSearch;
  getLoggedInState() async {
    await HelperFunctions.getUserNameSharedPreference().then((value){
      setState(() {
        userName  = value;
      });
    });
  }
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
    _notesForDisplay=[];
    getImageInState();
    stutsSearch=false;
    getLoggedInState();
    // TODO: implement initState
    super.initState();
  }  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        BoxTop(),
        GridBox(),
      ],
    );
  }
  Widget GridBox(){
    return FutureBuilder<dynamic>(
        future: networkRequest.getUserResproducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            fi=snapshot.data;
            if (!stutsSearch){
              _notesForDisplay=snapshot.data;}
            if(snapshot.data.length==0)
              return  Container(
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

            return Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: RefreshIndicator(

                  onRefresh:  getonRefreshState  ,
                  color: Color(0xfff99b1d),
                  backgroundColor: Colors.white,
                  key: refreshKey,
                  child: GridView.count(

                    crossAxisCount: 2,
                    childAspectRatio: 45/ 60,
                    children: List.generate(_notesForDisplay.length, (index) {
                      return Center(
                        child:singleOffer(_notesForDisplay[index]['p_p_meal'],false,true,_notesForDisplay[index],id:_notesForDisplay[index]['id']),
                      );
                    }),
                  ),
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
              SizedBox(height: 20,),
              Loading(),
             // CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
            ],
          );});
  }
  Widget BoxTop(){
    return   Container(
      padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.255,
      width: MediaQuery.of(context).size.width,
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
          SizedBox(height: 12,),
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
               search(),
              SizedBox(width: 12,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 16),
                    height:  MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width *0.74,
                    decoration: BoxDecoration(
                      color: Color(0xfff5f6fb),borderRadius: BorderRadius.circular(8.00),
                    ),
                    child: TextFormField(

                      onChanged: (val)=>setState(() {
                        textSearch = val;
                        stutsSearch=true;
                        _notesForDisplay=[];
                        _notesForDisplay = fi.where((note) {
                          var noteTitle = note['p_p_meal'];
                          print(noteTitle);
                          return noteTitle.contains(val);
                        }).toList();
                      }),
                      cursorColor: Color(0xfff99b1d),
                      maxLength: 9,
                      // keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15),
                         // contentPadding: EdgeInsets.only(bottom: 7),
                          border: InputBorder.none,
                          hintText:       "ابحث فى الوجبات  ",
                          icon: InkWell(
                              child: const Icon(Icons.search,color: Color(0xffB0B3CB))),
                          hintStyle:  TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 13,
                            color:Color(0xffb0b3cb).withOpacity(0.78),
                          ),
                          labelStyle: null
                      ),
                    ),)),
            ],
          ),


        ],
      ),
    );
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
  Future<void> getonRefreshState() async {
    refreshKey.currentState?.show(atTop: false);
     await Future.delayed(Duration(seconds: 3));
    await networkRequest.getUserResproducts().then((value){
      setState(() {
        _notesForDisplay  = value;
      });
      print(_notesForDisplay);
    });
  }

}
