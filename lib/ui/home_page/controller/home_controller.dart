import 'dart:collection';

import 'package:currency/app/api/api.dart';
import 'package:currency/app/model/currency_model.dart';
import 'package:currency/core/helper/request_helper.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  final List<String> currencies = ['USD', 'EUR', 'GBP', 'TRY'];

  String _selectedItem = "USD";

  Api api = Api();

  Future<List<CurrencyModel>> _futureCurrency =
      RequestHelper().getCurrencies("USD");

  UnmodifiableListView<String> get items {
    return UnmodifiableListView(currencies);
  }

  String get selected {
    return _selectedItem;
  }

  set selected(final String item) {
    _selectedItem = item;
    notifyListeners();
  }

  Future<List<CurrencyModel>> get futureCur {
    return _futureCurrency;
  }

  set futureCur(final Future<List<CurrencyModel>> item) {
    _futureCurrency = item;
    notifyListeners();
  }
}
