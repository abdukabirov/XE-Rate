import 'package:dio/dio.dart';

class CryptoModel {
  final String name;
  final double price;
  final String image;
  final double percent;
  final bool isPriceIncreasing;

  CryptoModel({
    required this.name,
    required this.price,
    required this.image,
    required this.percent,
    required this.isPriceIncreasing,
  });
}

class Coins {
  final Dio _dio = Dio();

  Future<List<CryptoModel>> getCrypto() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets'
        '?vs_currency=usd'
        '&order=market_cap_desc'
        '&per_page=100'
        '&page=1'
        '&sparkline=false'
        '&price_change_percentage=24h';

    final response = await _dio.get(url);

    final List data = response.data;

    return data.map((coin) {
      final percent =
          (coin['price_change_percentage_24h'] ?? 0).toDouble();

      return CryptoModel(
        name: coin['symbol'].toString().toUpperCase(),
        price: (coin['current_price'] ?? 0).toDouble(),
        image: coin['image'] ?? '',
        percent: percent,
        isPriceIncreasing: percent >= 0,
      );
    }).toList();
  }
}