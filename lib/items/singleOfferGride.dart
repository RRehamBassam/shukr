import 'package:flutter/material.dart';
import 'package:thanks/Screens/OrderDetails.dart';
class singleOffer extends StatefulWidget {
  String Name;

  singleOffer(this.Name);

  @override
  _singleOfferState createState() => _singleOfferState(Name);
}

class _singleOfferState extends State<singleOffer> {
  String Name;

  _singleOfferState(this.Name);
  bool requestIsDone=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.push(context, new MaterialPageRoute(builder: (context)=>  OrderDetails())),
      child: new Container(
        height: MediaQuery.of(context).size.width* 0.60,
        width:  MediaQuery.of(context).size.width* 0.51,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5) ,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00,0.00),
              color: Color(0xff000000).withOpacity(0.06),
              blurRadius: 10,
            ),
          ], borderRadius: BorderRadius.circular(8.00),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          new Container(
          height: 29,
          width:  MediaQuery.of(context).size.width* 0.15,
         // margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFF16BA75),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00,0.00),
                color: Color(0xff000000).withOpacity(0.06),
                blurRadius: 10,
              ),
            ], borderRadius: BorderRadius.circular(8.00),
          ),
          child: Center(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  " فرد",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color:Color(0xffffffff),
                  ),
                ),
                new Text(
                  "1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color:Color(0xffffffff),
                  ),
                ),
              ],
            )
          ),),

           Column(
             children: [
               Center(child: Image.asset("Assets/a.png")),
               Center(
                 child: new Text(
                   Name==null? "وجبة رز ولحم":Name,
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                     fontSize: 17,
                     color:Color(0xff17130c),
                   ),
                 ),
               ),Center(
                 child: new Text(
                   "مطعم الحاج خالد",
                   style: TextStyle(
                     fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                     fontSize: 14,
                     color:Color(0xffb3b5c4),
                   ),
                 ),
               ),
             ],
           ),
           // SizedBox(height: 4,),
            requestIsDone?botton("تم الطلب",Color(0xffB0B3CB),Color(0xffE7E8F1)): InkWell(
              onTap: ()=>setState(()=>requestIsDone=true),
              child: Center(
                child: new Container(
                  height: 34.00,
                  width: 118.00,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Color(0xfff99b1d),borderRadius: BorderRadius.circular(8.00),
                  ),
                  child: Center(
                    child: new Text(
                      "طلب الوجبة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color:Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
  Widget botton(String text,Color textColor,Color backColor){
    return  Center(
      child: new Container(
        height: 34.00,
        width: 118.00,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: backColor,borderRadius: BorderRadius.circular(8.00),
        ),
        child: Center(
          child: new Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Tajawal",fontWeight: FontWeight.w500,
              fontSize: 16,
              color:textColor,
            ),
          ),
        ),
      ),
    );
  }
}
