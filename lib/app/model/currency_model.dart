class CurrencyModel {
  String? code;
  double? value;

  CurrencyModel({this.code, this.value});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        code: json['code'] as String?, value: json['value'] as double?);
  }

  Map<String, dynamic> toJson() {
    var r = {'code': code, 'value': value};
    r.removeWhere((key, value) => value == null);
    return r;
  }
}
