import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/expanse_item.dart';
import 'package:expanse_tracker_app/features/presentation/widgets/new_expanse.dart';
import 'package:flutter/material.dart';

class ExpanseList extends StatelessWidget {
 
  const ExpanseList({
    super.key,
    required this.expanses,
    required this.removeExpanse,
    required this.editExpanse,
  });

  final List<ExpanseEntity> expanses;
  final void Function(ExpanseEntity expanse) removeExpanse;
  final Future<void> Function(ExpanseEntity oldExpanse, ExpanseEntity newExpanse) editExpanse;
 


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expanses.length,
      itemBuilder: (context, index) {
        final expanse = expanses[index];

        return Dismissible(key: ValueKey(expanse),
        background: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerRight,
           child: Icon(Icons.delete,color: Colors.white,)),
           onDismissed: (direction){
            removeExpanse(expanse);
           },
           child: GestureDetector(
             onTap: (){
               showModalBottomSheet(
                 backgroundColor: Colors.blue.shade100,
                 context: context,
                 isScrollControlled: true,
                 useSafeArea: true,
                 builder: (_) => NewExpanse(
                   addExpanse: (newExp) => editExpanse(expanse, newExp),
                   expanses: expanse,
                 ),
               );
             },
             child: ExpanseItem(expanse: expanse),
           ),
        );
    
        
      },

    );
  }
}