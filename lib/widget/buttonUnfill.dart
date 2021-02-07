import 'package:flutter/material.dart';
class buttonUnfill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.width*0.15,
      width: MediaQuery.of(context).size.width*0.82,
      decoration: BoxDecoration(
      // color: Color(0xfff99b1d),
      border: Border.all(width: 2.00, color: Color(0xfff99b1d),), borderRadius: BorderRadius.circular(36.00),
      ),
      child:  Center(
        child: Text(
          "تسجيل  حساب مستفيد",
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w700,
            fontSize: 14,
            color:Color(0xff4b4a4a),
          ),
        ),
      ),
     );
  }
}
