import 'package:flutter/material.dart';
import 'package:thanks/services/helperFunctions.dart';
class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String userName;
  getLoggedInState() async {
    await HelperFunctions.getUserNameSharedPreference().then((value){
      setState(() {
        userName  = value;
      });
    });
  }
  @override
  void initState() {
    getLoggedInState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      new Text(
                        userName!=null?userName:"أحمد خالد الغامدى",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color:Color(0xff000000),
                        ),
                      ),
                      new Text(
                        "+966 541121145",
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
                  Stack(
                    children: [
                      Column(children: [
                        SizedBox(height: 5,),
                      Row(
                        children: [
                          new Container(
                            height: 60.00,
                            width: 60.00,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("Assets/Avatar.png"),
                              ),borderRadius: BorderRadius.circular(6.00),
                            ),
                          ),
                          SizedBox(width: 5,)
                        ],
                      )
                      ],),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 11.0,
                            backgroundColor:Color(0xff16BA75),
                          child: Center(child: Icon(Icons.edit_outlined,color: Colors.white,size: 15,)),
                        ),
                      )
                    ],
                  )

                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("Assets/icon-edit.png"),
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
                height: MediaQuery.of(context).size.height*0.32,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    background(Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        new Text(
                          userName!=null?userName:  "الإسم | أحمد خالد الغامدي",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color:Color(0xff000000),
                          ),
                        ),
                        SizedBox(width: 25,),
                        backgroundOrang(Image.asset("Assets/icon-account.png",color: Colors.white,))
                      ],
                    )),
                    background(Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Text(
                          "  جدة",
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
                        SizedBox(width: 25,),
                        backgroundOrang(Image.asset("Assets/location.png",color: Colors.white,))
                      ],
                    )),
                    background(Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        new Text(
                          "كلمة المرور ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color:Color(0xff888a9c),
                          ),
                        ),
                        SizedBox(width: 25,),
                        backgroundOrang(Icon(Icons.lock_outline,color: Colors.white.withOpacity(0.6),))
                      ],
                    )),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SignOut(),
                  SizedBox(width: 18,),
                  new Text(
                    "تسجيل خروج",
                    style: TextStyle(
                      fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color:Color(0xff000000),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 16,)
            ],
          ),
        )
    );
  }
  Widget SignOut(){
    return new Container(
      height: 40.00,
      width: 40.00,
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
      height: 56.00,
      width: 317.00,
      decoration: BoxDecoration(
        color: Color(0xfff5f6fb),borderRadius: BorderRadius.circular(8.00),
      ),
      child:widget  ,
    );
   }
  Widget backgroundOrang(Widget widget){
    return new Container(
      height: 40.00,
      width: 40.00,
      decoration: BoxDecoration(
        color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(4.00),
      ),
      child: Center(child: widget,),
    );
  }
}
