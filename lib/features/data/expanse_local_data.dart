import 'dart:convert';

import 'package:expanse_tracker_app/features/data/models/expanse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ExpanseLocalData {
  static const String key='expanses';
  Future<void> saveExpanses(List<ExpanseModel>expanses)async{
    final prefs = await SharedPreferences.getInstance();
    final data = expanses.map((e)=>jsonEncode(e.toJson())).toList();
    await prefs.setStringList(key, data);
  }

  Future<List<ExpanseModel>> getExpanses()async{
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key);
    if(data==null) return [];
    return data.map((e)=>ExpanseModel.fromJson(jsonDecode(e))).toList();
  }

}