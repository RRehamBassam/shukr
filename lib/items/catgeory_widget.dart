import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanks/items/category.dart';
import 'package:thanks/services/app_state.dart';


class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategory == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategory(category.categoryId);
        }
      },
      child: Container(
       // margin: EdgeInsets.all(4),
        width:  MediaQuery.of(context).size.width *0.75,
        height:45,
margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff95E8B7) : Color(0xffffffff).withOpacity(0.15),
          borderRadius: BorderRadius.circular(5.8),
          border: Border.all(
            color: Color(0xff000000).withOpacity(0.15),
          ),
        ),
        child: Center(
          child: Text(
            category.name,
            style: isSelected
                ? TextStyle(color: Colors.white)
                : TextStyle(color: Colors.black45),
          ),
        ),
      ),
    );
  }
}
