class Category {
  final int categoryId;
  final String name;
  Category({this.categoryId, this.name});
}

final trainCategory = Category(
  categoryId: 0,
  name: 'جاهز للتسليم',
);

final busCategory = Category(
  categoryId: 1,
  name: 'تم التسليم',
);


final busCategor = Category(
  categoryId: 2,
  name: 'رفض الطلب',
);


final categories = [
  trainCategory,
  busCategory,
  busCategor,
];
