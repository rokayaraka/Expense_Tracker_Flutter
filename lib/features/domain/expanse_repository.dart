import 'package:expanse_tracker_app/features/domain/expanse_entity.dart';

abstract class ExpanseRepository {
  Future<List<ExpanseEntity>> getExpanse();
  Future<void> saveExpanses(
    List<ExpanseEntity>expanses,
  );
}

