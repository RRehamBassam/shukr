class Category {
  final int categoryId;
  final String name;
  Category({this.categoryId, this.name});
}

final trainCategory = Category(
  categoryId: 0,
  name: 'لا',
);

final busCategory = Category(
  categoryId: 1,
  name: 'نعم',
);



final categories = [
  trainCategory,
  busCategory,

];
