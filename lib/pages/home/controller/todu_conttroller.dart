import 'package:flutter/cupertino.dart';
import '../model/model.dart';

class TodoContteroler extends ChangeNotifier {
  static final List<Not> _list = [];

  List<Not> get list => _list;

  void gedAll({required String title, required String description}) async {
    Not listNot = Not(
      title: title,
      description: description,
      dataTime: DateTime.now().toIso8601String(),
      isChecked: false,
    );
    if (title.isNotEmpty && description.isNotEmpty) {
      _list.add(listNot);
      notifyListeners();
    }
  }
  Future<void> remov(Not not) async {
  await  _list.remove(not);
    notifyListeners();
  }



  void update(Not not,int index) {
    _list[index] = not;
    notifyListeners();
  }


}
