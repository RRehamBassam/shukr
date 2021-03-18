
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/services/app_state.dart';

class ok extends StatefulWidget {
  @override
  _okState createState() => _okState();
}

class _okState extends State<ok> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return InkWell(
      onTap: (){
        appState.updateCategory(3);
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
            "تاكيد",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",fontWeight: FontWeight.w700,
              fontSize: 18,
              color:Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
