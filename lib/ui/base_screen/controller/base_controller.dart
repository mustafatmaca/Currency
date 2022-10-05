import 'package:currency/ui/exchange_page/view/exchange_page.dart';
import 'package:currency/ui/home_page/view/home_page.dart';
import 'package:flutter/cupertino.dart';

class BaseController extends ChangeNotifier {
  int _selectedIndex = 0;

  List<Widget> widgetOptions = <Widget>[const HomePage(), ExchangePage()];

  int get selected {
    return _selectedIndex;
  }

  set selected(final int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
