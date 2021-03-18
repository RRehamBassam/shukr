import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/api/NetworkRequest.dart';
import 'package:thanks/items/category.dart';
import 'package:thanks/items/catgeory_widget.dart';
import 'package:thanks/services/app_state.dart';
class MyTabs extends StatefulWidget {
   Function(int) callback;
   var id;

   MyTabs(this.callback,this.id);

  @override
  _MyTabsState createState() => _MyTabsState(callback,id);
}

class _MyTabsState extends State<MyTabs> {
  var id;
  Function(int) callback;

  _MyTabsState(this.callback,this.id);

  @override
  Widget build(BuildContext context) {
    NetworkRequest networkRequest=new NetworkRequest();
    return Container(
      child: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 30.0),
          child: Consumer<AppState>(
            builder: (context, appState, _) {
              print(appState.selectedCategory);
              if(appState.selectedCategory==1){
              //  networkRequest.changestatusorder(id,"4");
            //  Navigator.pop(context);
              }
              if(appState.ok==1){
              if(appState.selectedCategory==0)
                {networkRequest.changestatusorder(id,"4");}
                if(appState.selectedCategory==1)
                {networkRequest.changestatusorder(id,"2");}
                if(appState.selectedCategory==2)
                {networkRequest.changestatusorder(id,"3");}
                Navigator.pop(context);
              }
              callback(appState.selectedCategory);
              return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 220.0,
                width: MediaQuery.of(context).size.width *0.68,

                child: Column(
                  children: <Widget>[
                    for (final category in categories)
                      CategoryWidget(
                        category: category,
                      ),
                    SizedBox(height: 16,),
                    GestureDetector(
                      onTap: (){
                        appState.updateok(1);
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
                    )
                  ],
                ),
              ),
            );},
          ),
        ),
      ),
    );
  }
}
