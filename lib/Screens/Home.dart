import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:thanks/Screens/AdminPages/AddOrder.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/Notifications.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/m.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/matjer.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/matjerRestaurant.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/matjerUser.dart';
import 'package:thanks/Screens/BottomNavigationBarScreens/profile.dart';
import 'package:thanks/Screens/Cart.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/services/helperFunctions.dart';


import 'BottomNavigationBarScreens/MyOrders.dart';
import 'BottomNavigationBarScreens/matjarMonthly.dart';
class Home extends StatefulWidget {
  bool tajerAccount;

  Home(this.tajerAccount);

  @override
  _HomeState createState() => _HomeState(tajerAccount);
}

class _HomeState extends State<Home> {
  bool tajerAccount;

  _HomeState(this.tajerAccount);

  bool Admin;
  int _selectedIndex = 4;
 bool selectedOrder;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });

      if(tajerAccount && _selectedIndex==1){
        print("pp");setState(() {
        selectedOrder=true; });
      }else{
        selectedOrder=false;
        setState(() {

        });
      }

  }
  int Length;
  getLengthInState() async {
    await networkRequest.getCart().then((value){
      setState(() {
        Length  = value.length;
      });
    });
  }

@override
  void initState() {
  getLengthInState();
  selectedOrder=false;
  _selectedIndex=  tajerAccount?3:4;
    // TODO: implement initState
    super.initState();
  }
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
   // getLengthInState();
    HelperFunctions.saveUserLoggedInSharedPreference(true);
    HelperFunctions.saveUserAdminSharedPreference(tajerAccount);
      List<Widget> _widgetOptions = <Widget>[
      profile(),
      Notifications(),
      Cart(),
      MyOrders(),
      matjerUser(false)
     // matjer(tajerAccount),
    ];
      List<Widget> _widgettajerAccount = <Widget>[
      profile(),
        matjerMonthly(tajerAccount,true),
      AddOrder(),
      matjer(tajerAccount,false),
      matjerRestaurant(),
    ];
    Admin=tajerAccount;
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: Center(
        child: Admin?_widgettajerAccount.elementAt(_selectedIndex):_widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }


  BottomNavigationBar bottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("Assets/icon-settings.png",color: _selectedIndex==0?Color(0xfff99b1d):Color(0xFF748A9D),),
          label: '',
        ),
        BottomNavigationBarItem(
          icon:Image.asset("Assets/RepeatGrid1.png",color: _selectedIndex==1?Color(0xfff99b1d):Color(0xFF748A9D),),
          label: '',
        ),
        BottomNavigationBarItem(
          icon:
          Container(
            decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Color.fromRGBO(34, 134, 234, .3),
                blurRadius: 12,
                offset: Offset(0, 5))],
            ),
            child:Stack(
              children: [
              // Badge(
              // shape: BadgeShape.circle,
              // borderRadius: BorderRadius.circular(100),
              // child: Icon(Icons.settings),
              // badgeContent: Container(
              //   height: 5,
              //   width: 5,
              //   decoration:
              //   BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              // )),
                CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Admin?Color(0xff16BA75): _selectedIndex!=2?Color(0xff999BAE):Color(0xffEEEEE).withOpacity(0.4),
                  child: Center(child:Admin? Icon(Icons.add,color: Colors.white,):Image.asset("Assets/noun_basket_821481.png",color: _selectedIndex==2?Color(0xfff99b1d):Color(0xFFFFFFFF),),),
                ),
                tajerAccount ||Length==null||Length==0?Container(height: 0,width: 0,) : Positioned(
                  top: 0,
                  right: 0,
                  child: CircleAvatar(
                    
                    radius: 10.0,
                    backgroundColor:Color(0xfff99b1d),
                    child: Center(child: Text("$Length",style: TextStyle(color: Colors.white),),),
                  ),
                ),
              ],
            )),
          label: '',
        ),
        BottomNavigationBarItem(
          icon:Image.asset("Assets/icon-recipes.png",color: _selectedIndex==3?Color(0xfff99b1d):Color(0xFF748A9D),),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset("Assets/icon-store.png",color: _selectedIndex==4?Color(0xfff99b1d):Color(0xFF748A9D),),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }


}
