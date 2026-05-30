import 'package:expanse_tracker_app/features/data/expanse_local_data.dart';
import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';
import 'package:expanse_tracker_app/features/domain/expanse_repo_implement.dart';
import 'package:flutter/foundation.dart';



class ExpanseController extends ChangeNotifier {
  final repository = ExpanseRepoImplement(ExpanseLocalData());

  List<ExpanseEntity> expanses =[];
  Future<void> loadExpanses()async{
    final loaded = await repository.getExpanse();
    expanses = List<ExpanseEntity>.from(loaded);
    notifyListeners();
  }
  Future<void>addExpanses(ExpanseEntity expanse)async{
    // defensively ensure we have a growable list before adding
    expanses = List<ExpanseEntity>.from(expanses);
    expanses.add(expanse);
    await repository.saveExpanses(expanses);
    notifyListeners();
  }

  Future<void>deleteExpanse(ExpanseEntity expanse)async{
    expanses.remove(expanse);
    await repository.saveExpanses(expanses);
    notifyListeners();
  }
    
  

}