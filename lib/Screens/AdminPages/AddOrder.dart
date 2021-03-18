import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanks/Screens/Home.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/services/helperFunctions.dart';
import 'package:thanks/widget/buttonFill.dart';
class AddOrder extends StatefulWidget {
  var id ;

  AddOrder({this.id});

  @override
  _AddOrderState createState() => _AddOrderState(id: id);
}

class _AddOrderState extends State<AddOrder> {
  var id ;

  _AddOrderState({this.id});

  List<String> list=<String>["رز مع لحم","رز مع دجاج","برجر","وجبة مشاوي","رز مع لحم ضاني","وجبة غذائية"];
  List<String> sweet=<String>["حلويات","مشروبات غازية","عصير","خبز","اخري"];
  bool userIsAminIn;
  NetworkRequest networkRequest=new NetworkRequest();
  int Count=1;
  int CountMeals=1;
  int typeofmeal;
  int chooseAdditives;
  getAdminInState() async {
    await HelperFunctions.getUserAdminSharedPreference().then((value){
      setState(() {
        userIsAminIn  = value;
      });
    });
  }
  @override
  void initState() {
    typeofmeal=1;
    getAdminInState();
    chooseAdditives=1;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 2,
        backgroundColor: Colors.white,
        title:  Text(
         "إضافة وجبة",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
           // mainAxisAlignment: MainAxisAlignment.end,
            children: [
             Container(
               height: 132,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.end,
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
                       textDirection: TextDirection.rtl,child: Grid(list,typeofmeal,"typeMeal")),
                 ],
               ),
             ),
              SizedBox(height: 8,),
              new Text(
                "عدد الافراد للوجبة",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color:Color(0xff17130c),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){setState(() {if(Count>1){Count--;}});},
                    child:  backgroundAddButton(Container(   margin: EdgeInsets.only(bottom: 16),
                        child: Icon(Icons.minimize_outlined,color: Colors.white,)), Color(0xff888a9c)),
                  ),
                  num(Count),
                  InkWell(
                    onTap: (){setState(() {Count++;});},
                    child: backgroundAddButton(Icon(Icons.add,color: Colors.white,), Color(0xff16BA75))),
                ],
              ),
              SizedBox(height: 16,),
              Container(
              height: 132,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
              new Text(
                "إضافات مع الوجبة ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color:Color(0xff17130c),
                ),
              ),
              SizedBox(height: 2,),


             Directionality(
                textDirection: TextDirection.rtl, child:Grid(sweet,chooseAdditives,"addition"))])),
              SizedBox(height: 8,),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: new Text(
                  "عدد الواجبات متاحة",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Tajawal",fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color:Color(0xff17130c),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){setState(() {if(CountMeals>1){CountMeals--;}});},
                    child:  backgroundAddButton(Container(
                      margin: EdgeInsets.only(bottom: 16),
                        child: Icon(Icons.minimize_outlined,color: Colors.white,)), Color(0xff888a9c)),
                  ),
                  num(CountMeals),
                  InkWell(
                      onTap: (){setState(() {CountMeals++;});},
                      child: backgroundAddButton(Icon(Icons.add,color: Colors.white,), Color(0xff16BA75))),
                ],
              ),
              SizedBox(height: 16,),
               Center(
                child: InkWell(
                  onTap: () async {
                    if(id!=null){
                      await geteditproductInState();
                    }else{
                   await getresultInState();}
                   Fluttertoast.showToast(
                       msg: result,
                       toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       timeInSecForIosWeb: 1,
                       backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
                       textColor: Colors.white,
                       fontSize: 16.0
                   );
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_){
                          return Home(userIsAminIn);
                        }),(route)=> false
                    );
                   // networkRequest.Addproduct(list[typeofmeal],Count,sweet[chooseAdditives]);
                  },

                  child: buttonFill(widget: Center(
                    child: Text(
                      id!=null?"تعديل":"إضافة",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "DIN Next LT W23",fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color:Color(0xffffffff),
                      ),
                    ),
                  ),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  String result;
  geteditproductInState() async {
    //await networkRequest.add();
    //await networkRequest.Addproduct("","","");
    print(list[typeofmeal]+"$Count"+sweet[chooseAdditives]);
    await networkRequest.editproduct(list[typeofmeal],"$Count",sweet[chooseAdditives],id).then((value) {
      Fluttertoast.showToast(
          msg: value,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        result =
            value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")
      });
    });
    print(result);

  }

  getresultInState() async {
    //await networkRequest.add();
   //await networkRequest.Addproduct("","","");
    await networkRequest.add(list[typeofmeal],"$Count",sweet[chooseAdditives]).then((value) {
      Fluttertoast.showToast(
          msg: value,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xfff99b1d).withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        result =
            value; // (result =="لديك طلب من مطعم اخر لم يكتمل بعد" || result =="تم اضافة الوجبة مسبقاً")
      });
    });
    print(result);

  }
  Widget Grid(List list,choose,String meals){
    return Expanded(
      child: InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 75/ 40,
            children: List.generate(list.length, (index) {
              return Center(
                child:GridSingleItem(list[index],index,choose,meals),
              );
            }),
          ),
        ),
      ) ,
    );
  }
  Widget GridSingleItem(String name,int index,choose,String meals){
    return InkWell(
      onTap: (){
        if(meals=="addition"){
        setState(() {

           chooseAdditives=index;
        });
      }else{
          setState(() {
             typeofmeal=index;
          });
        }
      },
      child: new Container(
            height: 37.88,
            width: 100.00,
            decoration: BoxDecoration(
              color:choose==index?Color(0xff16BA75) :Color(0xfff5f5f5),borderRadius: BorderRadius.circular(6.00),
            ),
        child:
        Center(
          child: new Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Tajawal",fontWeight: FontWeight.w500,
            fontSize: 14,
            color:choose==index?Color(0xffffffff):Color(0xff888a9c),
          ),
      ),
        ),
      ),
    );
  }
  Widget num(Count){
    return new Container(
      height: 36.00,
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
            fontSize: 20,
            color:Color(0xff717171),
          ),
        ),
      ),
    );
  }
  Widget backgroundAddButton(Widget widget,Color color){
    return new Container(
      height: 36.00,
      width: 46.68,
      decoration: BoxDecoration(
        color:color,
   borderRadius: BorderRadius.circular(6.00),
      ),
      child:Center(child: widget) ,
    );
  }
}
