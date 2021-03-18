import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/models/providerUser.dart';
import 'package:thanks/models/test.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/buttonFill.dart';

import '../../main.dart';
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String userName;
  String address;
  String address2;
  bool _obscureText;
  String pass;
  TextEditingController _controller = new TextEditingController();
  TextEditingController _controllerCity = new TextEditingController();
  TextEditingController _controllerCity2 = new TextEditingController();
  TextEditingController _controllerPass = new TextEditingController();

List add=[];
  getLoggedInState() async {
    await HelperFunctions.getUserNameSharedPreference().then((value){
      setState(() {
        userName  = value;
      });
    });
  }
  getAddressInState() async {
    await HelperFunctions.getUserAddressSharedPreference().then((value){
      setState(() {
         address = value;
        add= address.split("/");
         address=add[0];
         address2=add[1];
      });
    });
  }
  getPassWordInState() async {
    await HelperFunctions.getUserPassWordSharedPreference().then((value){
      setState(() {
        pass  = value;
      });
    });
  }
  String userMobile;
  getMobileInState() async {
    await HelperFunctions.getUserMobileSharedPreference().then((value){
      setState(() {
        userMobile  = value;
      });
    });
  }
  NetworkRequest networkRequest=new NetworkRequest();
 bool Modification;
  @override
  void initState() {
    _obscureText=true;
    Modification=false;
    getPassWordInState();
    getAddressInState();
    getLoggedInState();
    getMobileInState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // String city =
    //     Provider.of<providerUser>(context, listen: true).city;
    _controllerCity.text=address;
    _controllerCity2.text=address2;
    _controller.text = userName;
    _controllerPass.text= pass;
    print(pass);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 2,
          backgroundColor: Colors.white,
          title: new Text(
            "حسابي",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",
              fontSize: 20,
              color:Color(0xff000000),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*0.67,
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        new Text(
                          userName!=null?userName:"الإسم",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color:Color(0xff000000),
                          ),
                        ),
                        new Text(
                          userMobile!=null?userMobile:"+966 541121145",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 16,
                            color:Color(0xff888a9c),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 16,),
                    test((val){}),


                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: ()=>setState(()=>Modification=!Modification),
                        child: Image.asset("Assets/icon-edit.png")),
                    new Text(
                      "البيانات الشخصية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color:Color(0xff000000),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18,),
                Container(
                  height: MediaQuery.of(context).size.height*0.36,
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: [
                      background(Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        // Directionality(
                        // textDirection: TextDirection.rtl,
                        // child:Container(
                        //     // padding: EdgeInsets.only(top: 15),
                        //     width: MediaQuery.of(context).size.width* 0.6,
                        //     child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                        //       cursorColor: Color(0xfff99b1d),
                        //      // onChanged: (val)=>userName=val,
                        //       autofocus: false,
                        //       controller: _controller,
                        //       maxLength: 9,
                        //       //initialValue:userName ,
                        //       keyboardType:TextInputType.text,
                        //      // onChanged:(vall)=>setState(()=>phoneNumber=vall),
                        //       decoration: InputDecoration(
                        //         //  prefixIcon:  Image.asset("Assets/Mobile.png"),
                        //        //   suffixIcon:  Image.asset("Assets/Mobile.png"),
                        //           border: InputBorder.none,
                        //
                        //           hintText:userName!=null?userName:  "الإسم ",
                        //           icon: InkWell(
                        //               child: const Padding(
                        //                 padding: const EdgeInsets.only(top: 15.0),
                        //                 // child:const Icon(Icons.mobile_screen_share_outlined) ,
                        //               )),
                        //           hintStyle: TextStyle(color: Colors.grey[400]),
                        //           labelStyle: null
                        //       ),
                        //     ),
                        //   )),

                              Text(
                                "  $userName",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Text(
                                " | ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color:Color(0xff000000),
                                ),
                              ),
                              Text(
                                "الإسم ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color:Color(0xff888a9c),
                                ),
                              ),
                              // new Text(
                              //   userName!=null?userName:  "الإسم |  $userName",
                              //   textAlign: TextAlign.center,
                              //   style: TextStyle(
                              //     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              //     fontSize: 16,
                              //     color:Color(0xff000000),
                              //   ),
                              // ),

                          SizedBox(width: 25,),
                          backgroundOrang(Image.asset("Assets/icon-account.png",color: Colors.white,))
                        ],
                      )),
                      background(Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Text(
                            "  $address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff000000),
                            ),
                          ),
                           Text(
                            " | ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff000000),
                            ),
                          ),
                           Text(
                            "المدينة ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff888a9c),
                            ),
                          ),
                        // Directionality(
                        // textDirection: TextDirection.rtl,
                        // child: Container(
                        //     // padding: EdgeInsets.only(top: 15),
                        //     width: MediaQuery.of(context).size.width* 0.6,
                        //     child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                        //       cursorColor: Color(0xfff99b1d),
                        //       controller: _controllerCity,
                        //       maxLength: 9,
                        //       keyboardType:TextInputType.text,
                        //        onChanged:(vall)=>setState(()=>address=vall),
                        //       decoration: InputDecoration(
                        //         //  prefixIcon:  Image.asset("Assets/Mobile.png"),
                        //          // suffixIcon:  Image.asset("Assets/Mobile.png"),
                        //
                        //           border: InputBorder.none,
                        //
                        //           hintText: "المدينة",
                        //           icon: InkWell(
                        //               child: const Padding(
                        //                 padding: const EdgeInsets.only(top: 15.0),
                        //                 // child:const Icon(Icons.mobile_screen_share_outlined) ,
                        //               )),
                        //           hintStyle: TextStyle(color: Colors.grey[400]),
                        //           labelStyle: null
                        //       ),
                        //     ),
                        //   )),
                          SizedBox(width: 25,),
                          backgroundOrang(Image.asset("Assets/location.png",color: Colors.white,))
                        ],
                      )),
                      background(Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            address2!=null? "  $address2":"",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff000000),
                            ),
                          ),
                          Text(
                            " | ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff000000),
                            ),
                          ),
                          Text(
                            "الحى ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff888a9c),
                            ),
                          ),
                          // Directionality(
                          // textDirection: TextDirection.rtl,
                          // child: Container(
                          //     // padding: EdgeInsets.only(top: 15),
                          //     width: MediaQuery.of(context).size.width* 0.6,
                          //     child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                          //       cursorColor: Color(0xfff99b1d),
                          //       controller: _controllerCity,
                          //       maxLength: 9,
                          //       keyboardType:TextInputType.text,
                          //        onChanged:(vall)=>setState(()=>address=vall),
                          //       decoration: InputDecoration(
                          //         //  prefixIcon:  Image.asset("Assets/Mobile.png"),
                          //          // suffixIcon:  Image.asset("Assets/Mobile.png"),
                          //
                          //           border: InputBorder.none,
                          //
                          //           hintText: "المدينة",
                          //           icon: InkWell(
                          //               child: const Padding(
                          //                 padding: const EdgeInsets.only(top: 15.0),
                          //                 // child:const Icon(Icons.mobile_screen_share_outlined) ,
                          //               )),
                          //           hintStyle: TextStyle(color: Colors.grey[400]),
                          //           labelStyle: null
                          //       ),
                          //     ),
                          //   )),
                          SizedBox(width: 25,),
                          backgroundOrang(Image.asset("Assets/location.png",color: Colors.white,))
                        ],
                      )),
                      background(Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        Directionality(
                        textDirection: TextDirection.rtl,
                        child:Container(
                            // padding: EdgeInsets.only(top: 15),
                            width: MediaQuery.of(context).size.width* 0.6,
                            child: TextFormField(//onChanged: (val)=>setState((){searchWord=val;}),
                              cursorColor: Color(0xfff99b1d),
                              maxLength: 9,
                              autofocus: false,
                              obscureText:_obscureText,
                              controller: _controllerPass,
                              keyboardType:TextInputType.number,
                              onChanged:(vall)=>setState(()=>pass=vall),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 0,bottom: 8),
                                //  prefixIcon:  Image.asset("Assets/Mobile.png"),
                                 // suffixIcon:  Image.asset("Assets/Mobile.png"),
                                  border: InputBorder.none,
                                  hintText: "كلمة المرور",
                                  icon: InkWell(
                                      child: const Padding(
                                        padding: const EdgeInsets.only(top: 15.0),
                                        // child:const Icon(Icons.mobile_screen_share_outlined) ,
                                      )),
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  labelStyle: null
                              ),
                            ),
                          )),
                          // new Text(
                          //   "كلمة المرور ",
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                          //     fontSize: 16,
                          //     color:Color(0xff888a9c),
                          //   ),
                          // ),
                          SizedBox(width: 25,),//color: Colors.white.withOpacity(0.6)
                          backgroundOrang(InkWell(onTap: (){setState(() {_obscureText=!_obscureText;});},//Image.asset("Assets/location.png")
                              child:_obscureText? const Padding(
                                padding: const EdgeInsets.only(top: 0.0,bottom: 7.0),
                                child:Center(child: const Icon(Icons.lock_outline,color: Color(0x9effffff),)) ,
                              ):const Padding(
                                  padding: const EdgeInsets.only(bottom: 7.0),
                                  child: Center(child: Icon(Icons.lock_open,color:Color(0xaeffffff),)))))
                        ],
                      )),
                    ],
                  ),
                ),
                Spacer(),
                Modification?  InkWell(
                    onTap: () async =>{
                      if(userName!=null&& pass!=null&& address!=null ){
                       await networkRequest.edituser(userName,pass,userMobile,address),
                      setState(()=>Modification=!Modification),
              Fluttertoast.showToast(
                  msg: "تم تعديل بياناتك",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                  textColor: Colors.white,
                  fontSize: 16.0
              )}else{
                    Fluttertoast.showToast(
                    msg: "ادخل بيانات",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                    textColor: Colors.white,
                    fontSize: 16.0
                )
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.07,
                      width: MediaQuery.of(context).size.width*0.7,
                      padding: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                            color: Color.fromRGBO(34, 134, 234, .3),
                            blurRadius: 10,
                            offset: Offset(0, 4)
                        )],
                        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(50.00),
                      ),
                      child: Center(
                        child: new Text(
                          "تعديل كلمة المرور",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color:Color(0xffffffff),
                          ),
                        ),
                      ),
                    )):   Align(
                  alignment: Alignment.centerLeft,
                      child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                  onTap: (){
                        HelperFunctions.saveUserImageSharedPreference(null);
                        HelperFunctions.saveUserIdSharedPreference(null);
                        HelperFunctions.saveUserLoggedInSharedPreference(null);
                        HelperFunctions.saveUserNameSharedPreference(null);
                        HelperFunctions.saveUserMobileSharedPreference(null);
                        HelperFunctions.saveUserIsRecevidSharedPreference(null);
                        HelperFunctions.saveUserEmailSharedPreference(null);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (_){
                              return MyApp();
                            }),(route)=> false
                        );
                  },child:  Row(
                        children: [
                          SignOut(),
                          SizedBox(width: 18,),

                            new Text(
                            "تسجيل خروج",
                            style: TextStyle(
                              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color:Color(0xff000000),
                            ),
                          ),

                        ],
                  ), ),
                      ),
                    ),

                SizedBox(height: 16,)
              ],
            ),
          ),
        )
    );
  }
  Widget SignOut(){
    return new Container(
      height: 35.00,
      width: 35.00,
      decoration: BoxDecoration(
        color: Color(0xFFFEEEDA),borderRadius: BorderRadius.circular(4.00),
      ),
      child: Center(
        child: Image.asset("Assets/Group200.png"),
      ),
    );
  }
   Widget background(Widget widget){
    return     Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
      height: 46.00,
      width: MediaQuery.of(context).size.width*0.87,
      decoration: BoxDecoration(
        color: Color(0xfff5f6fb),borderRadius: BorderRadius.circular(8.00),
      ),
      child:widget  ,
    );
   }
  Widget backgroundOrang(Widget widget){
    return new Container(
      height: 35.00,
      width: 35.00,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(4.00),
      ),
      child: Center(child: widget,),
    );
  }
}
