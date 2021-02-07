import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/services/helperFunctions.dart';

import 'Screens/Auth/SignIn.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جمعية حفظ النعمة',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFF99B1D),
        accentColor: Colors.grey[200],
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool userIsLoggedIn;
  bool userIsAminIn;



  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }
  getAdminInState() async {
    await HelperFunctions.getUserAdminSharedPreference().then((value){
      setState(() {
        userIsAminIn  = value;
      });
    });
  }

  void initState(){
    userIsLoggedIn=false;
    getLoggedInState();
    getAdminInState();
    super.initState();
    start();
  }
  start()async{
    return Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_){
            return userIsLoggedIn != null ?  userIsLoggedIn ? Home(userIsAminIn) :  SignIn(): SignIn(); SignIn();//
          })
      );
    }) ;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Container(
          width: double.infinity,
          child:Center(
            child:Image.asset("Assets/Splash.png",fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),// Text(translator.translate('appTitle')),//
          )),
    );

  }
}

