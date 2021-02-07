import 'package:flutter/material.dart';
class checkBox extends StatefulWidget {
  bool checkBoxValue;

  checkBox(this.checkBoxValue);
  @override
  _checkBoxState createState() => _checkBoxState(checkBoxValue);
}

class _checkBoxState extends State<checkBox> {
  bool checkBoxValue;

  _checkBoxState(this.checkBoxValue);

  @override
  Widget build(BuildContext context) {
    //ServerAddressesRequests serverAddressesRequests=new ServerAddressesRequests();
    return CheckboxListTile(
       title: Row(
         crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
            Text("  شروط الانضمام ",textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 14,
              color:Color(0xff888a9c),
            ),),
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
           checkBoxValue = true;
            }
          });
          Text("توافق علي شروط الانضمام  ",);
         // Text("  شروط الانضمام ",style: TextStyle(color: Colors.black),);
        });
  }
}
