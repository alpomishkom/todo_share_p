import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';

class DBService with ChangeNotifier {
  DBService() {
    creade();
  }

  List<String> todoList = [];

  Future<void> creade() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    todoList = sharedPreferences.getStringList("totoya") ?? [];
    notifyListeners();
  }

  Future<void> saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('totoya', todoList);
    notifyListeners();
  }

  void add(String not) {
    todoList.add(not);
    saveData();
    notifyListeners();
  }

  void remove(int index) {
    todoList.removeAt(index);
    saveData();
    notifyListeners();
  }

  void update(int index, String not) {
    todoList[index] = not;
    saveData();
    notifyListeners();
  }

}
