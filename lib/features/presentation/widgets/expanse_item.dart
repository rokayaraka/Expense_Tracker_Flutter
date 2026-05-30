import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';
import 'package:flutter/material.dart';

class ExpanseItem extends StatelessWidget {
  const ExpanseItem({super.key, required this.expanse});

final ExpanseEntity expanse;

IconData get categoryIcon{
  switch (expanse.category){
    case Category.food
    :return Icons.fastfood;
    case Category.leisure
    :return Icons.movie;
    case Category.travel
    :return Icons.flight;
    case Category.work
    :return Icons.work;
    }
}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
    color: Colors.blue.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(

                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                categoryIcon,
                color: Colors.blue.shade800,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expanse.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${expanse.category.name.toUpperCase()} • ${expanse.date.day}/${expanse.date.month}/${expanse.date.year}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Text(
              '\$${expanse.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}