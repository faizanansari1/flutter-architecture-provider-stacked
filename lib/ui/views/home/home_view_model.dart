import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = "Home View";
  String get title => '$_title $_counter';

  int _counter = 0;
  int get counter => _counter;

  void updateCounter() {
    _counter++;
    notifyListeners();
  }

  List _itemList = [];
  List get getData => _itemList;

  void incVotes(int index) {
    _itemList[index]['votes']++;
    notifyListeners();
  }

  void onDelete(int index) {
    _itemList.removeAt(index);
    notifyListeners();
  }

  void addItem(String value) {
    getData.add({'title': value, "votes": 0});
    notifyListeners();
  }
}
