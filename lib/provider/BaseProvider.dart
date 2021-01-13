import 'package:flutter/widgets.dart';
import 'package:flutter_nusantech/shared/ViewState.dart';


class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
