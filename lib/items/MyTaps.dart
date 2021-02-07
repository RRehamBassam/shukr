import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/items/category.dart';
import 'package:thanks/items/catgeory_widget.dart';
import 'package:thanks/services/app_state.dart';
class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 30.0),
          child: Consumer<AppState>(
            builder: (context, appState, _) {
              print(appState.selectedCategory);
              return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 53.0,
                width: MediaQuery.of(context).size.width *0.68,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: Color(0xff16BA75),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    for (final category in categories)
                      CategoryWidget(
                        category: category,
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
