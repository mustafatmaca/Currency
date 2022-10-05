import 'dart:collection';

import 'package:currency/app/model/currency_model.dart';
import 'package:currency/core/helper/request_helper.dart';
import 'package:flutter/cupertino.dart';

class ExchangeController extends ChangeNotifier {
  final List<String> currencies = ['USD', 'EUR', 'GBP', 'TRY'];

  String _baseCurrency = "USD";
  String _targetCurrency = "TRY";

  double _baseCurrencyValue = 1;
  double _targetCurrencyValue = 1;

  Future<CurrencyModel> _futureValue =
      RequestHelper().getExchangeRate("USD", "TRY");

  UnmodifiableListView<String> get items {
    return UnmodifiableListView(currencies);
  }

  String get selectedBase {
    return _baseCurrency;
  }

  set selectedBase(final String item) {
    _baseCurrency = item;
    notifyListeners();
  }

  String get selectedTarget {
    return _targetCurrency;
  }

  set selectedTarget(final String item) {
    _targetCurrency = item;
    notifyListeners();
  }

  double get baseValue {
    return _baseCurrencyValue;
  }

  set baseValue(final double item) {
    _baseCurrencyValue = item;
    notifyListeners();
  }

  double get targetValue {
    return _targetCurrencyValue;
  }

  set targetValue(final double item) {
    _targetCurrencyValue = item;
    notifyListeners();
  }

  Future<CurrencyModel> get futureVal {
    return _futureValue;
  }

  set futureVal(final Future<CurrencyModel> item) {
    _futureValue = item;
    notifyListeners();
  }
}
