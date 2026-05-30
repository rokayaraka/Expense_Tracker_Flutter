import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';

class ExpanseModel extends ExpanseEntity {
  ExpanseModel({
    required super.title,
    required super.amount,
    required super.date,
    required super.category,
  });

  Map<String,dynamic> toJson(){
    return {
      'title':title,
      'amount':amount,
      'date':date.toIso8601String(),
      'category':category.name,
    };
  }

  factory ExpanseModel.fromJson(Map<String,dynamic>json){
    return ExpanseModel(
      title: json['title'], 
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: Category.values.firstWhere((e)=>e.name==json['category'],),
      );
  }
}