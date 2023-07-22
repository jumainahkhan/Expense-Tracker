class HomeModel {
  int value;
  String category;
  DateTime date;

  HomeModel({
    required this.value,
    required this.category,
    required this.date,
  });
  @override
  String toString() {
    return "Value: $value, Category: $category, Date: $date";
  }
}
