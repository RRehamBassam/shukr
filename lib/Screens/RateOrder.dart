import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thanks/widget/buttonFill.dart';
import 'package:thanks/widget/buttonUnfill.dart';
class RateOrder extends StatefulWidget {
  @override
  _RateOrderState createState() => _RateOrderState();
}

class _RateOrderState extends State<RateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
          toolbarHeight: 80,
        elevation: 2,
        title:new Text(
          "تقييم الطلب",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 22,
            color:Color(0xff17130c),
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.69,
              margin: EdgeInsets.symmetric(horizontal: 16,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16,),
                    height: MediaQuery.of(context).size.height*0.1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "ما هو تقييمك للمطعم والخدمة",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color:Color(0xff17130c),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    child: Center(
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        glowColor:Color(0xfff99b1d).withOpacity(0.1),
                        unratedColor:Colors.grey.withOpacity(0.1) ,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color(0xfff99b1d),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,

                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:     "اذا كان لديك أي ملاحظات علي المطعم يمكنك كتابتها هنا",
                          hintStyle: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 14,
                            color:Color(0xff000000).withOpacity(0.50),
                          )
                      ),
                    ),
                  ),
                  new Container(
                    height: 1.00,
                    width: 343.00,
                    decoration: BoxDecoration(
                      color: Color(0xffbdc4cc),
                      border: Border.all(width: 0.50, color: Color(0xffdddddd),), borderRadius: BorderRadius.circular(4.00),
                    ),
                  ),
                  SizedBox(height: 6,),

                ],
              ),
            ),
            Container(
              //height: MediaQuery.of(context).size.height*0.3,
              child:   buttonFill(widget: Center(
                child: new Text(
                  "ارسال التقييم",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color:Color(0xffffffff),
                  ),
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
