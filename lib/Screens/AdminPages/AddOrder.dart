import 'package:flutter/material.dart';
import 'package:thanks/widget/buttonFill.dart';
class AddOrder extends StatefulWidget {
  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  List<String> list=<String>["رز مع لحم","رز مع دجاج","برجر","وجبة مشاوي","رز مع لحم ضاني","وجبة غذائية"];
  List<String> sweet=<String>["حلويات","مشروبات غازية","عصير","خبز","اخري"];
  int Count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
         "الطلبات الشهرية",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 22,
            color:Color(0xff17130c),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
         // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            new Text(
              "نوع الوجبة",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 18,
                color:Color(0xff17130c),
              ),
            ),
            SizedBox(height: 2,),
        Directionality(
          textDirection: TextDirection.rtl,child: Grid(list)),
            new Text(
              "عدد الافراد للوجبة",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 18,
                color:Color(0xff17130c),
              ),
            ),
            SizedBox(height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){setState(() {if(Count>0){Count--;}});},
                  child:  backgroundAddButton(Icon(Icons.minimize_outlined,color: Colors.white,), Color(0xff888a9c)),
                ),
                num(),
                InkWell(
                  onTap: (){setState(() {Count++;});},
                  child: backgroundAddButton(Icon(Icons.add,color: Colors.white,), Color(0xff16BA75))),
              ],
            ),
            SizedBox(height: 3,),
            new Text(
              "إضافات مع الوجبة",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                fontSize: 18,
                color:Color(0xff17130c),
              ),
            ),
            SizedBox(height: 2,),
           Directionality(
              textDirection: TextDirection.rtl, child:Grid(sweet)),
             Center(
              child: buttonFill(widget: Center(
                child: Text(
                  "إضافة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "DIN Next LT W23",fontWeight: FontWeight.w500,
                    fontSize: 22,
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
  Widget Grid(List list){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 75/ 40,
          children: List.generate(list.length, (index) {
            return Center(
              child:GridSingleItem(list[index]),
            );
          }),
        ),
      ) ,
    );
  }
  Widget GridSingleItem(String name){
    return new Container(
          height: 37.88,
          width: 100.00,
          decoration: BoxDecoration(
            color: Color(0xfff5f5f5),borderRadius: BorderRadius.circular(6.00),
          ),
      child:
      Center(
        child: new Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Tajawal",fontWeight: FontWeight.w500,
          fontSize: 14,
          color:Color(0xff888a9c),
        ),
    ),
      ),
    );
  }
  Widget num(){
    return new Container(
      height: 52.00,
      width: 186.00,
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),borderRadius: BorderRadius.circular(6.00),
      ),
      child: Center(
        child: new Text(
          "${Count}",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: "DIN Next LT W23",
            fontSize: 24,
            color:Color(0xff717171),
          ),
        ),
      ),
    );
  }
  Widget backgroundAddButton(Widget widget,Color color){
    return new Container(
      height: 52.00,
      width: 53.68,
      decoration: BoxDecoration(
        color:color,
   borderRadius: BorderRadius.circular(6.00),
      ),
      child:Center(child: widget) ,
    );
  }
}
