import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanks/Screens/Auth/mapAdderss.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/checkBox.dart';
import 'package:thanks/models/city.dart';
import 'package:thanks/models/providerUser.dart';
import 'package:thanks/widget/backgroundWite.dart';
import 'package:thanks/widget/backgroungtextfielid.dart';
import 'package:thanks/widget/buttonFill.dart';
import 'SignIn.dart';
import 'package:http/http.dart' as http;
class CreateAccount extends StatefulWidget {
 bool tajerAccount;

 CreateAccount(this.tajerAccount);

  @override
  _CreateAccountState createState() => _CreateAccountState(tajerAccount);
}

class _CreateAccountState extends State<CreateAccount> {
  String _mySelection;
 var _myCount;
bool conditionsOfJoining;
  final String url = "https://shukr.wsoft-tech.com/public/api/shukrmodule/cities";

  List data =[]; //edited line
List Count=[1,2,3,4,5,6,7,8,9,10];
  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody['items'];
    });

    print(data);

    return "Sucess";
  }
  @override
  void initState() {
    conditionsOfJoining=false;
    super.initState();
    this.getSWData();
  }
  bool tajerAccount;
  List<City> drop=List();
  NetworkRequest networkRequest=new NetworkRequest();
  _CreateAccountState(this.tajerAccount);
  String Name;
  String Phone;
  String civil_registry;
  String familyCount;
  String Password;
  String district;
  bool _obscureText=true;
  String message;
  var selectedUser;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            backgroundWite(
            child: Column(
              children: [
                Container(
                  alignment:Alignment.topRight,
                  height: MediaQuery.of(context).size.height *0.7368,
                  child:ListView(
                    children: [
                     //SizedBox(height: 16,),
                      InkWell(
                        onTap: ()=>Navigator.pop(context),
                        child: Align(
                            alignment:Alignment.topLeft,
                            child: Icon(Icons.arrow_back,color: Color(0xFF748A9D),)),
                      ),
                      tajerAccount? SizedBox(height: 18,):SizedBox(height: 1,),
                      Align(
                        alignment:Alignment.topRight,
                        child: new Text(
                          tajerAccount?"اشتراك جهة مانحة جديدة": "اشتراك جديد",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: tajerAccount?20:22,
                            color:Color(0xff17130c),
                          ),
                        ),
                      ),
                      SizedBox(height: 4,),
                      Align(
                        alignment:Alignment.topRight,
                        child: new Text(
                          tajerAccount?"يشرفنا طلب انضمامكم شريك نجاح لنا بالجمعية سيتم  تفعيل الحساب من خلال الادارة": "بعد تسجيل طلب  الانضمام كمستفيد ستقوم الجمعية بدراسة الحالة ومن ثم الرد بتفعيل الحساب",
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color:Color(0xffacbbc9),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      tajerAccount?Container(
                        alignment:Alignment.topRight,
                        height: MediaQuery.of(context).size.height *0.50,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FullName(),
                          new Container(
                            height: MediaQuery.of(context).size.height*0.07,
                            width: MediaQuery.of(context).size.width*0.82,
                            padding: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                             border: Border.all(width: 1.00, color: Colors.grey[300],),
                              borderRadius: BorderRadius.circular(8.00),
                            ),
                            child:  Center(
                              child: Directionality(

                                textDirection: TextDirection.rtl,
                                child: new DropdownButton(
                                  hint: Text("المدينة",style:TextStyle(color: Colors.grey[400])),
                                        underline: Container(),
                                            items: data.map((item) {
                                              return new DropdownMenuItem(
                                                child:new Container(
                                                    height: MediaQuery.of(context).size.height*0.07,
                                                    width: MediaQuery.of(context).size.width*0.65,
                                                    decoration: BoxDecoration(
                                                     // border: Border.all(width: 1.00, color: Colors.grey[300],),
                                                     borderRadius: BorderRadius.circular(8.00),
                                                    ),
                                                    child:  Directionality(
                                                        textDirection: TextDirection.rtl,child: new Text(item['name']))),
                                                value: item['name'].toString(),
                                              );
                                            }).toList(),
                                            onChanged: (newVal) {
                                              setState(() {
                                                _mySelection = newVal;
                                              });
                                            },
                                            value: _mySelection,
                                          ),
                              ),
                            )),
                              textFiled(false," الحي",Image.asset("Assets/location.png"),(val){setState(() {
                                district=val;
                              });}),
                            // textFiled(false,"المدينة",Image.asset("Assets/location.png"),(val){}),
                              mobile(),
                              // textFiled(true,"رقم الجوال",Image.asset("Assets/Mobile.png"),(val){setState(() {
                              //   Phone=val;
                              // });}),
                              textFiled(false,"***********",InkWell(onTap: (){setState(() {_obscureText=!_obscureText;});},//Image.asset("Assets/location.png")
                                  child:_obscureText? const Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child:const Icon(Icons.lock_outline,color: Color(0xffB0B3CB),) ,
                                  ):const Padding(
                                      padding: const EdgeInsets.only(bottom: 7.0),
                                      child:const Icon(Icons.lock_open,color: Color(0xffB0B3CB),))),(val){setState(() {
                                        Password=val;
                                      });}),
                              checkBox(false,(val)=>conditionsOfJoining=val),
//                             Checkbox(
//                             // title: Text('تم االتسليم',style: TextStyle(color: Colors.black)),
//                                 value: true,
//
//                                 activeColor:  Color(0xffB0B3CB),
//                                 onChanged:(bool newValue){
//                                   setState(() {
//
//                                     // if(!checkBoxValue){
//                                     //   checkBoxValue = true;
//                                     // }
//                                   }
//                                   );
// Row(children: [
//   Text("  شروط الانضمام ",textAlign: TextAlign.center,
//     style: TextStyle(
//       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
//       fontSize: 14,
//       color:Color(0xff888a9c),
//     ),),
//   Text("نوافق علي   ",textAlign: TextAlign.center,
//     style: TextStyle(
//       fontFamily: "Tajawal",fontWeight: FontWeight.w500,
//       fontSize: 14,
//       color:Color(0xff888a9c),
//     ),)
// ],)
//                                   ;
//                                 })
                            ],
                          ),
                        ),
                      ) :Container(
                      alignment:Alignment.topRight,
                      height: MediaQuery.of(context).size.height *0.55,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             FullName(),
                              new Container(

                                  height: MediaQuery.of(context).size.height*0.07,
                                  width: MediaQuery.of(context).size.width*0.82,
                                  padding: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1.00, color: Colors.grey[300],),
                                    borderRadius: BorderRadius.circular(8.00),
                                  ),
                                  child:  Center(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: new DropdownButton(
                                      hint: Text("المدينة",style:TextStyle(color: Colors.grey[400])),
                                        underline: Container(),
                                        items: data.map((item) {
                                          return new DropdownMenuItem(
                                            child:new Container(
                                                height: MediaQuery.of(context).size.height*0.07,
                                                width: MediaQuery.of(context).size.width*0.65,
                                                decoration: BoxDecoration(
                                                  // border: Border.all(width: 1.00, color: Colors.grey[300],),
                                                  borderRadius: BorderRadius.circular(8.00),
                                                ),
                                                child:  Directionality(
                                                    textDirection: TextDirection.rtl,child: new Text(item['name']))),
                                            value: item['name'].toString(),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            _mySelection = newVal;
                                          });
                                        },
                                        value: _mySelection,
                                      ),
                                    ),
                                  )),
                             // textFiled(false,"المدينة",Image.asset("Assets/location.png",),(val){}),
                              textFiled(false," الحي",Image.asset("Assets/location.png"),(val){setState(() {
                                district=val;
                              });}),
                               textFiled(true,"السجل المدني / رقم الإقامة",Image.asset("Assets/RecordCivilian.png"),(val){setState(() {
                                 civil_registry=val;
                               });}),
                              new Container(
                                  height: MediaQuery.of(context).size.height*0.07,
                                  width: MediaQuery.of(context).size.width*0.82,
                                  padding: EdgeInsets.only(top: 8,right: 6),
                                  margin:EdgeInsets.only(bottom: 4) ,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1.00, color: Colors.grey[300],),
                                    borderRadius: BorderRadius.circular(8.00),
                                  ),
                                  child:  Center(
                                    child: Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: new DropdownButton(
                                        hint: Text("عدد أفراد الأسرة",style:TextStyle(color: Colors.grey[400])),
                                        underline: Container(),
                                        items: Count.map((item) {
                                          return new DropdownMenuItem(
                                            child:new Container(
                                                height: MediaQuery.of(context).size.height*0.07,
                                                width: MediaQuery.of(context).size.width*0.65,
                                                decoration: BoxDecoration(
                                                  // border: Border.all(width: 1.00, color: Colors.grey[300],),
                                                  borderRadius: BorderRadius.circular(8.00),
                                                ),
                                                child:  Directionality(
                                                    textDirection: TextDirection.rtl,child: new Text(item.toString()))),
                                            value: item.toString(),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            _myCount = newVal;
                                            familyCount=newVal;
                                          });
                                        },
                                        value: _myCount,
                                      ),
                                    ),
                                  )),
                              // textFiled(true,"عدد أفراد الأسرة",Container(
                              //   width: 2,
                              //     height:2,
                              //     child: Image.asset("Assets/people.png",scale:18.5,color: Color(0xffB0B3CB).withOpacity(0.7))),(val){setState(() {
                              //   familyCount=val;
                              // });}),
                              mobile(),
                              // textFiled(true,"رقم الجوال",Image.asset("Assets/Mobile.png"),(val){setState(() {
                              //   Phone=val;
                              // });}),
                              textFiled(false,"***********",InkWell(
                                  onTap: (){
                                    setState(() {
                                      _obscureText=!_obscureText;
                                    });
                                  },//Image.asset("Assets/location.png")

                                  child:_obscureText? const Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child:const Icon(Icons.lock_outline,color: Color(0xffB0B3CB),) ,
                                  ):const Padding(
                                      padding: const EdgeInsets.only(bottom: 7.0),
                                      child:const Icon(Icons.lock_open,color: Color(0xffB0B3CB),))),(val){setState(() {
                                        Password=val;
                                      });})
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              //  message!=null?Text(message):Container(),
             SizedBox(height: 2,),
             endButton(),
              ],
            )
            ),
            endText(),
          ],
        ),
      ),
    );
  }
  Widget FullName(){
    return    backgroungtextfielid(Center(
      child:Row(
        children: [ Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            height: MediaQuery.of(context).size.height*0.07,
            // padding: EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width* 0.82,
            child:  TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
              cursorColor: Color(0xfff99b1d),
              keyboardType:TextInputType.text,
              autofocus: false,
              onChanged: (val)=>setState(()=>Name=val),
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 16),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  prefixIcon:tajerAccount?Image.asset("Assets/icon-store.png",color:Color(0xfffB0B3CB,)):Image.asset("Assets/icon-account.png",color:Color(0xfffB0B3CB,)) ,
                  border: OutlineInputBorder(
                    borderSide:  BorderSide(width: 1.00, color: Color(0xffDBE2ED) ),
                    borderRadius: BorderRadius.circular(8.0,),
                  ),
                  hintText:tajerAccount?"اسم الجهة المانحة":"الاسم كاملا",
                 // icon:tajerAccount?Image.asset("Assets/icon-store.png",color:Color(0xfff99b1d),):Image.asset("Assets/icon-account.png") ,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  labelStyle: null
              ),

            ))
        ) ],
        ),
          )
    );
  }
  Widget textFiled(bool textInputType,String hinttext,Widget icon,Function function){
    bool obscureTextbool=false;
    return    backgroungtextfielid(Center(
      child:Row(
        children: [ Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: MediaQuery.of(context).size.height*0.07,
          // padding: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width* 0.82,
          child: TextFormField(
            onChanged: function,
           // style: TextStyle( color: Colors.white),
            cursorColor: Color(0xfff99b1d),
            maxLength:textInputType? 9:25,
            keyboardType:textInputType?TextInputType.number:TextInputType.text,

            obscureText:hinttext=="***********"? _obscureText:false,
           // textAlign: TextAlign.right,
            decoration: InputDecoration(
              filled: true,

                //hoverColor:Colors.black45 ,
               fillColor: Colors.white,
               // to trigger disabledBorder


                contentPadding: EdgeInsets.only(top: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1,color: Colors.grey[300]),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 1,)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 1,color: Colors.black)
                  ),


                prefixIcon:icon,
               // border: InputBorder.none,
                hintText:hinttext,
               // icon:icon ,

                hintStyle: TextStyle(color: Colors.grey[400] ),
                labelStyle: null
            ),

          ),
        ),
      )]),
    ));
  }

String Output;
  getLoggedInState() async {
   // Navigator.push(context, new MaterialPageRoute(builder: (context)=>  maps()));
    if(civil_registry==null)civil_registry="1";
   // context.read<providerUser>().cityEdit(_mySelection);
    if(tajerAccount){
      {
        if(conditionsOfJoining){
          print("4444");
          await networkRequest.resturantRegister(Name,Password,"966"+"$Phone",_mySelection,district).then((value){
            setState(() {
              Output  = value;
            });
          });}else if(conditionsOfJoining){
          Fluttertoast.showToast(
              msg: "يجب عليك موافقة على شروط الانضمام",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }
    }else{
      print("45555554");
      await networkRequest.register(Name,Password,"966"+"$Phone",civil_registry,familyCount,district,_mySelection).then((value){
        setState(() {
          Output  = value;
        });
      });
    }
print (Output);
    if(Output=="تم"){
      // Fluttertoast.showToast(
      //     msg: " يرجى الانتظار لحين تفعيل حسابك",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
      //     textColor: Colors.white,
      //     fontSize: 16.0
      // );
      if(Output!= "رقم الجوال موجود مسبقاً")
      {Navigator.push(context, new MaterialPageRoute(builder: (context)=>  maps()));}
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (_){
      //       return  SignIn();
      //     }),(route)=> false
      // );
     // Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Home(tajerAccount)));
    }else{setState(() {message=Output;}
    );
    Fluttertoast.showToast(
        msg: message==null&&tajerAccount?"يجب عليك موافقة على شروط الانضمام":message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
        textColor: Colors.white,
        fontSize: 16.0
    );
    }
  }
  Widget endButton(){
    return  InkWell(
      onTap: ()=>{getLoggedInState()

      },
      child: Container(
        height: MediaQuery.of(context).size.height *0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buttonFill(widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back,color: Colors.white,size: 15,),
                SizedBox(width: 6,),
                Text(
                  "أنشئ حساب",
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color:Color(0xffffffff),
                  ),
                )
              ],
            ),),
          //  SizedBox(height: 27,),
          ],
        ),
      ),
    );
  }
  Widget endText(){
    return    Container(
        height: MediaQuery.of(context).size.height *0.11,
        //color:Color(0xFFDBE2ED) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=>  SignIn())),
                child:  Text(
              "تسجيل دخول",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                fontSize: 14,
                color:Color(0xff888a9c),
              ),
            ))
          ],
        ),
      )
    ;
  }
  Widget mobile(){
    return  backgroungtextfielid(
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height*0.07,
            // padding: EdgeInsets.only(top: 15),
            width: MediaQuery.of(context).size.width* 0.835,
            child: TextFormField(
              //onChanged: (val)=>setState((){searchWord=val;}),
              cursorColor: Color(0xfff99b1d),
              maxLength: 9,
              keyboardType:TextInputType.number,
              onChanged:(vall)=>setState(()=>Phone=vall),
              decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(8.0,)
                  ),
                  border: OutlineInputBorder(
                    borderSide:  BorderSide(width: 1.00, color: Color(0xffDBE2ED) ),
                    borderRadius: BorderRadius.circular(8.0,),
                  ),
                 prefixIcon:  Container(
                   margin: EdgeInsets.only(bottom: 4,top: 4,left: 16,right: 16),
                     child: Image.asset("Assets/num.jpg",width: 38,)),
                  suffixIcon:  Image.asset("Assets/Mobile.png"),
                //  border: InputBorder.none,
                  hintText: "5XXXXXXXX",
                  focusColor: Color(0xffDBE2ED),


                  hintStyle: TextStyle(color: Colors.grey[400]),
                  labelStyle: null
              ),
            ),
          ),
        )
    );
  }
}
