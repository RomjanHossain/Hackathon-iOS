import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  List<String> movieFav = [];
  List<String> tvFav = [];
  int favMovie = 0;
  int favTv = 0;

  void addTV(bool newOri) {
    favTv += 1;
    notifyListeners();
  }

  void removeTV(bool newOri) {
    favTv -= 1;
    notifyListeners();
  }

  void addMovie() {
    favMovie += 1;
    notifyListeners();
  }

  void removeMovie() {
    favMovie -= 1;
    notifyListeners();
  }
}
