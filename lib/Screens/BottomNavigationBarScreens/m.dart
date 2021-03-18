import 'package:flutter/material.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/singleOfferGride.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/loading.dart';
class matje extends StatefulWidget {
  @override
  _matjerRestaurantState createState() => _matjerRestaurantState();
}

class _matjerRestaurantState extends State<matje> {
  String userName;
  NetworkRequest networkRequest=new NetworkRequest();
  bool  SearchPersonBox;
  bool Empty;

  int chooseSearch;
  String userImage;
  getLoggedInState() async {
    await HelperFunctions.getUserNameSharedPreference().then((value){
      setState(() {
        userName  = value;
      });
    });
  }
  @override
  void initState() {
    SearchPersonBox=false;
    chooseSearch=0;
    getLoggedInState();
    // TODO: implement initState
    super.initState();
  }

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
        future: networkRequest.getUserMeals(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                child: GridView.count(
                  crossAxisCount: 2,
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
              SizedBox(height: 20,),
              Loading(),
              // CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
            ],
          );});
  }
  Widget BoxTop(){
    return   Container(
      padding: EdgeInsets.all(16),
      height: SearchPersonBox?MediaQuery.of(context).size.height * 0.495: MediaQuery.of(context).size.height * 0.295,
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
                  new Container(
                    height: 38.00,
                    width: 38.00,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/Avatar.png"),
                      ),borderRadius: BorderRadius.circular(6.00),
                    ),
                  ),
                  Text(
                    userName!=null?userName:"أحمد خالد الغامدى",
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
             SearchPerson(),
              SizedBox(width: 12,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding: EdgeInsets.only(right: 16,left: 16),
                    height:  MediaQuery.of(context).size.height * 0.073,
                    width: MediaQuery.of(context).size.width *0.7,
                    decoration: BoxDecoration(
                      color: Color(0xfff5f6fb),borderRadius: BorderRadius.circular(8.00),
                    ),
                    child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                      cursorColor: Color(0xfff99b1d),
                      maxLength: 9,
                      // keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:       "ابحث عن وجبات متاحة ",
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
      height:  MediaQuery.of(context).size.height * 0.074,
      width: MediaQuery.of(context).size.width *0.13,
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
