import 'package:flutter/material.dart';
import 'package:thanks/Screens/AdminPages/ConditionsOfJoining.dart';
class checkBox extends StatefulWidget {
  bool checkBoxValue;
Function(bool) callback;
  checkBox(this.checkBoxValue,this.callback);
  @override
  _checkBoxState createState() => _checkBoxState(checkBoxValue,callback);
}

class _checkBoxState extends State<checkBox> {
  bool checkBoxValue;
  Function(bool) callback;
  _checkBoxState(this.checkBoxValue,this.callback);

  @override
  Widget build(BuildContext context) {
    //ServerAddressesRequests serverAddressesRequests=new ServerAddressesRequests();
    return CheckboxListTile(
       title: Row(
         crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
    Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context)=>  ConditionsOfJoining()));
          },
          child: Text("  شروط الانضمام ",textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 14,
              color:Color(0xff888a9c),
            ),),
        ),
        Container(
          color:Color(0xff888a9c),
          width: 100,
          height: 1,
        ),
      ],
    ),
            Text("توافق علي ",textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 14,
                color:Color(0xff888a9c),
              ),)
],),


        value: checkBoxValue,
        activeColor: Color(0xffB0B3CB),
        onChanged:(bool newValue){
          setState(() {
         //   serverAddressesRequests.IsRecevid(id);
            if(!checkBoxValue){
              callback(true);
           checkBoxValue = true;
            }
          });
          Text("توافق علي شروط الانضمام  ",);
         // Text("  شروط الانضمام ",style: TextStyle(color: Colors.black),);
        });
  }
}
