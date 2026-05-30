import 'package:expanse_tracker_app/features/data/expanse_local_data.dart';
import 'package:expanse_tracker_app/features/data/models/expanse_model.dart';
import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';
import 'package:expanse_tracker_app/features/domain/expanse_repository.dart';

class ExpanseRepoImplement implements ExpanseRepository {
  final ExpanseLocalData localData;
  ExpanseRepoImplement(this.localData);
  @override
  Future<List<ExpanseEntity>> getExpanse() async {
    return await localData.getExpanses();
  }

  @override
  Future<void> saveExpanses(List<ExpanseEntity> expanses) async {
    final models = expanses
        .map(
          (e) => ExpanseModel(
            title: e.title,
            amount: e.amount,
            date: e.date,
            category: e.category,
          ),
        )
        .toList();
        await localData.saveExpanses(models);
  }
}
