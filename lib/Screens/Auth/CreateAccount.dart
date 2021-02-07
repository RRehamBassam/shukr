import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/checkBox.dart';
import 'package:thanks/widget/backgroundWite.dart';
import 'package:thanks/widget/backgroungtextfielid.dart';
import 'package:thanks/widget/buttonFill.dart';
import 'SignIn.dart';
class CreateAccount extends StatefulWidget {
 bool tajerAccount;

 CreateAccount(this.tajerAccount);

  @override
  _CreateAccountState createState() => _CreateAccountState(tajerAccount);
}

class _CreateAccountState extends State<CreateAccount> {
  bool tajerAccount;
  NetworkRequest networkRequest=new NetworkRequest();
  _CreateAccountState(this.tajerAccount);
  String Name;
  String Phone;
  String civil_registry;
  String Password;
  bool _obscureText=true;
  String message;

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
                  height: MediaQuery.of(context).size.height *0.72,
                  child:ListView(
                    children: [
                     // SizedBox(height: 16,),
                      InkWell(
                        onTap: ()=>Navigator.pop(context),
                        child: Align(
                            alignment:Alignment.topLeft,
                            child: Icon(Icons.arrow_back,color: Color(0xFF748A9D),)),
                      ),
                      SizedBox(height: 18,),
                      Align(
                        alignment:Alignment.topRight,
                        child: new Text(
                          tajerAccount?"اشتراك مطعم جديد": "اشتراك جديد",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 24,
                            color:Color(0xff17130c),
                          ),
                        ),
                      ),
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
                      tajerAccount?Container(
                        alignment:Alignment.topRight,
                        height: MediaQuery.of(context).size.height *0.48,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FullName(),
                            // textFiled(false,"المدينة",Image.asset("Assets/location.png")),
                            textFiled(false,"المدينة",Image.asset("Assets/location.png"),(val){}),
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
                            checkBox(false),
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
                      ) :Container(
                      alignment:Alignment.topRight,
                      height: MediaQuery.of(context).size.height *0.48,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FullName(),
                         // textFiled(false,"المدينة",Image.asset("Assets/location.png")),
                            textFiled(false,"المدينة",Image.asset("Assets/location.png"),(val){}),
                             textFiled(true,"السجل المدني",Image.asset("Assets/RecordCivilian.png"),(val){setState(() {
                               civil_registry=val;
                             });}),
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
                      )
                    ],
                  ),
                ),
                message!=null?Text(message):Container(),
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
    return     Center(
        child: Container(
            height: MediaQuery.of(context).size.height*0.08,
            width: MediaQuery.of(context).size.width*0.82,

            decoration: BoxDecoration(

              border: Border.all(width: 1.00, color: Color(0xffDBE2ED),), borderRadius: BorderRadius.circular(8.00),
            ),
            child:Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
               children: [
               Container(
                   width: MediaQuery.of(context).size.width* 0.78,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                  cursorColor: Color(0xfff99b1d),
                  maxLength: 9,
                  keyboardType:TextInputType.text,
                  autofocus: false,
                  onChanged: (val)=>setState(()=>Name=val),
                  obscureText: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:tajerAccount?"اسم المطعم":"الاسم كاملا",
                      icon:tajerAccount?Image.asset("Assets/icon-store.png",color:Color(0xfff99b1d),):Image.asset("Assets/icon-account.png") ,
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: null
                  ),

                ))
              ],
            ),
          ),)
    );
  }
  Widget textFiled(bool textInputType,String hinttext,Widget icon,Function function){
    bool obscureTextbool=false;
    return     Center(
      child: backgroungtextfielid(Row(
        children: [ Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          // padding: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width* 0.78,
          child: TextFormField(
            onChanged: function,
            cursorColor: Color(0xfff99b1d),
            maxLength: 9,
            keyboardType:textInputType?TextInputType.number:TextInputType.text,
            autofocus: false,
            obscureText:hinttext=="***********"? _obscureText:false,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText:hinttext,
                icon:icon ,

                hintStyle: TextStyle(color: Colors.grey[400]),
                labelStyle: null
            ),

          ),
        ),
      )])),
    );
  }

String Output;
  getLoggedInState() async {
    if(civil_registry==null)civil_registry="1";
    await networkRequest.register(Name,Password,Phone,civil_registry).then((value){
      setState(() {
        Output  = value;
      });
    });
    if(Output=="تم"){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_){
            return Home(tajerAccount);
          }),(route)=> false
      );
     // Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Home(tajerAccount)));
    }else{setState(() {message=Output;});
    }
  }
  Widget endButton(){
    return  InkWell(
      onTap: ()=>{
        getLoggedInState()
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
          child: Row(
            children: [
              SizedBox(width: 20,),
              new Text(
                "+966",
                style: TextStyle(
                  fontFamily: "Acumin Pro SemiCondensed",
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color:Color(0xff7d8e9d),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                // padding: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width* 0.6,
                child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                  cursorColor: Color(0xfff99b1d),
                  maxLength: 9,
                  keyboardType:TextInputType.number,
                  onChanged:(vall)=>setState(()=>Phone=vall),
                  decoration: InputDecoration(
                    //  prefixIcon:  Image.asset("Assets/Mobile.png"),
                      suffixIcon:  Image.asset("Assets/Mobile.png"),
                      border: InputBorder.none,
                      hintText: "5XXXXXXXX",
                      icon: InkWell(
                          child: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            // child:const Icon(Icons.mobile_screen_share_outlined) ,
                          )),
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      labelStyle: null
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
