import 'package:currency/app/api/api.dart';
import 'package:currency/app/model/currency_model.dart';

class RequestHelper {
  Api api = Api();

  Future<List<CurrencyModel>> getCurrencies(String? value) {
    return api.fetchCurrency(value);
  }

  Future<CurrencyModel> getExchangeRate(String? baseValue, String targetValue) {
    return api.fetchExchangeRate(baseValue, targetValue);
  }
}
