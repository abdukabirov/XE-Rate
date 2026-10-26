import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyModel {
  final String baseCode;
  final String targetCurrency;
  final double rate;
  final String flagUrl;
  final String display_symbol;
  final String currency_name;

  CurrencyModel({
    required this.baseCode,
    required this.targetCurrency,
    required this.rate,
    required this.flagUrl,
    required this.display_symbol,
    required this.currency_name,
  });
}

class CurrencyInfo {
  final String name;
  final String symbol;
  final String flag;

  const CurrencyInfo({
    required this.name,
    required this.symbol,
    required this.flag,
  });
}

final Map<String, CurrencyInfo> currencyData = {
  "USD": const CurrencyInfo(
    name: "US Dollar",
    symbol: "\$",
    flag: "https://flagcdn.com/w80/us.png",
  ),
  "EUR": const CurrencyInfo(
    name: "Euro",
    symbol: "€",
    flag: "https://flagcdn.com/w80/eu.png",
  ),
  "GBP": const CurrencyInfo(
    name: "British Pound",
    symbol: "£",
    flag: "https://flagcdn.com/w80/gb.png",
  ),
  "JPY": const CurrencyInfo(
    name: "Japanese Yen",
    symbol: "¥",
    flag: "https://flagcdn.com/w80/jp.png",
  ),
  "CAD": const CurrencyInfo(
    name: "Canadian Dollar",
    symbol: "\$",
    flag: "https://flagcdn.com/w80/ca.png",
  ),
  "AUD": const CurrencyInfo(
    name: "Australian Dollar",
    symbol: "\$",
    flag: "https://flagcdn.com/w80/au.png",
  ),
  "INR": const CurrencyInfo(
    name: "Indian Rupee",
    symbol: "₹",
    flag: "https://flagcdn.com/w80/in.png",
  ),
};

Future<List<CurrencyModel>> getCurrencies() async {
  const baseCurrency = "GBP";

  final url = Uri.parse("https://open.er-api.com/v6/latest/$baseCurrency");

  final response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception("Currency API error");
  }

  final data = jsonDecode(response.body);

  if (data["result"] != "success") {
    throw Exception("API failed");
  }

  final rates = data["rates"] as Map<String, dynamic>;

  return rates.entries.map((entry) {
    final code = entry.key;

    final info = currencyData[code] ??
        CurrencyInfo(
          name: code,
          symbol: code,
          flag: "https://flagcdn.com/w80/un.png",
        );

    return CurrencyModel(
      baseCode: baseCurrency,
      targetCurrency: code,
      rate: (entry.value as num).toDouble(),
      flagUrl: info.flag,
      display_symbol: info.symbol,
      currency_name: info.name,
    );
  }).toList();
}
