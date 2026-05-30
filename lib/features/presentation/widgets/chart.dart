import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expanses});
  final List<ExpanseEntity> expanses;

  double get totatExpanses {
    double total = 0;
    for (final expanse in expanses) {
      total += expanse.amount;
    }
    return total;
  }

  double categoryTotal(Category category) {
    double total = 0;
    for (final expanse in expanses) {
      if (expanse.category == category) {
        total += expanse.amount;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final foodTotal = categoryTotal(Category.food);
    final leisureTotal = categoryTotal(Category.leisure);
    final travelTotal = categoryTotal(Category.travel);
    final workTotal = categoryTotal(Category.work);

    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.blue.shade200, Colors.grey.shade300],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Expense Statistics",
            style: GoogleFonts.aBeeZee(
              color: Colors.blue.shade900,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChartBar(fill: totatExpanses==0?0:foodTotal/totatExpanses,),
              ChartBar(fill: totatExpanses==0?0:leisureTotal/totatExpanses,),
              ChartBar(fill: totatExpanses==0?0:travelTotal/totatExpanses,),
              ChartBar(fill: totatExpanses==0?0:workTotal/totatExpanses,),
            ],
          )),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Food",
              style: TextStyle(color: Colors.black),
              ),
               Text("Leisure",
              style: TextStyle(color: Colors.black),
              ),
               Text("Travel",
              style: TextStyle(color: Colors.black),
              ),
               Text("Work",
              style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
