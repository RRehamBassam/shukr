
import 'package:flutter/material.dart';
import 'package:thanks/Screens/Auth/CreateAccount.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/models/User.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/backgroungtextfielid.dart';
import 'package:thanks/widget/buttonUnfill.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String phoneNumber;
  String changePass;
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
               height: MediaQuery.of(context).size.height * 0.888,
           width:MediaQuery.of(context).size.width ,
           decoration: new BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
               boxShadow: [BoxShadow(
                   color: Color.fromRGBO(34, 134, 234, .3),
                   blurRadius: 20,
                   offset: Offset(0, 10)
               )]
           ),
             child: Column(
               children: [
                 Container(
                   height: MediaQuery.of(context).size.height *0.37,
                  child:partOne() ,
                 ),
                 Expanded(
                   flex: 1,
                  child:partTwo() ,
                 ),
                 Expanded(
                   flex: 1,
                   child:partThree() ,
                 ),
               ],
             ),
           ),

             Container(
               height: MediaQuery.of(context).size.height *0.11,
               //color:Color(0xFFDBE2ED) ,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                     InkWell(
                    onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=>  CreateAccount(true))),
                         child:Text(
                     "تسجيل اشتراك مطعم",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                       fontSize: 14,
                       color:Color(0xff888a9c),
                     ),
                   ))
                 ],
               ),
             ),

         ],
       ),
     ),
    );
  }
  bool _obscureText=true;
  Widget partOne(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 25,),
        Image.asset("Assets/logo.png"),
      ],
    );}
  Widget partTwo(){
return Column(
 children: [
   backgroungtextfielid(
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
               onChanged:(vall)=>setState(()=>phoneNumber=vall),
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
   ),
   SizedBox(height: 8,),
   backgroungtextfielid(Row(
     children: [
       Directionality(
         textDirection: TextDirection.rtl,
         child: Container(
           // padding: EdgeInsets.only(top: 15),
           width: MediaQuery.of(context).size.width* 0.78,
           child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
             cursorColor: Color(0xfff99b1d),
             maxLength: 9,
             keyboardType:TextInputType.text,
             autofocus: false,
             obscureText: _obscureText,
             onChanged: (vall)=>setState(()=>changePass=vall),
             decoration: InputDecoration(
                 border: InputBorder.none,
                 hintText: "***********",
                 icon: InkWell(
                     onTap: (){
                       setState(() {
                         _obscureText=!_obscureText;
                       });
                     },
                     child:_obscureText? const Padding(
                       padding: const EdgeInsets.only(top: 0.0),
                       child:const Icon(Icons.lock_outline,color: Color(0xffB0B3CB),) ,
                     ):const Padding(
                         padding: const EdgeInsets.only(bottom: 7.0),
                         child:const Icon(Icons.lock_open,color: Color(0xffB0B3CB),))),

                 hintStyle: TextStyle(color: Colors.grey[400]),
                 labelStyle: null
             ),

           ),
         ),
       )
     ],
   )),
   SizedBox(height: 8,),
   Container(
     width: MediaQuery.of(context).size.width* 0.8,
     child: Align(
       alignment:Alignment.centerRight,
       child: new Text(
         "نسيت كلمة المرور؟",
         textAlign: TextAlign.center,
         style: TextStyle(
           fontFamily: "Tajawal",fontWeight: FontWeight.w500,
           fontSize: 16,
           color:Color(0xffa6bcd0),
         ),
       ),
     ),
   )
 ],
);
  }
  Widget partThree(){
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        message!=null?Text(message,style: TextStyle(color: Colors.red),):Container(),
        SizedBox(height: 2,),
        button(phoneNumber,changePass),
        SizedBox(height: 8,),
        InkWell(
        onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=>  CreateAccount(false))),
        child:
        buttonUnfill()),
        message!=null?SizedBox(height: 22,) :SizedBox(height: 27,),
      ],
    );
  }
  dynamic Output;
  String message;
  User user;
  getLoggedInState() async {
    await networkRequest.login(phoneNumber,changePass).then((value){
      setState(() {
        Output  = value;
      });
    });
    if(Output is String){
      setState(() {message=Output;});
    }else{
        user=Output;
        HelperFunctions.saveUserNameSharedPreference(user.name);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_){
            return Home(false);
          }),(route)=> false
      );
     // Navigator.push(context, new MaterialPageRoute(builder: (context)=>  Home(false)));
    }
  }
 Widget button(String phone ,String pass){
   return InkWell(
     onTap: ()=>{

       getLoggedInState()
     // if (itemCount is Map) {
     //   return [];
     //   }
      // networkRequest.login("",""),


     },
     child: new Container(
       height: MediaQuery.of(context).size.width*0.15,
       width: MediaQuery.of(context).size.width*0.82,
       decoration: BoxDecoration(
         color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
       ),
       child: Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Icon(Icons.arrow_back,color: Colors.white,size: 15,),
             SizedBox(width: 6,),
             Text(
               "تسجيل دخول",
               style: TextStyle(
                 fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                 fontSize: 16,
                 color:Color(0xffffffff),
               ),
             )
           ],
         ),
       ),
     ),
   );
  }
}
