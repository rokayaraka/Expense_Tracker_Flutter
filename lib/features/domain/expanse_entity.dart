enum Category{
  food,leisure,travel,work,
}
class ExpanseEntity {
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  ExpanseEntity({required this.title, required this.amount, required this.date, required this.category});
  
}

