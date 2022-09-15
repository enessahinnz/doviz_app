import 'dart:convert';

import 'package:doviz_app/model.dart';
import 'package:http/http.dart' as http;

class CryptoApi {
  static String baseURL = 'https://api.collectapi.com/economy/allCurrency';

  static const Map<String, String> headers = {
    'authorization': 'apikey collectapiden alınan api buaraya yapıştırılıcak (apikey yazan kısmı silmeden apiyi yapıştırınız)',
    'content-type': 'application/json'

  };

  static Future<List<Currency>> getCoins() async {
    List<Currency> coinList = [];

    var url = Uri.parse("$baseURL");
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      String data = response.body;
      var coins = jsonDecode(response.body)["result"];
      for (var coin in coins) {
        coinList.add(Currency.fromJson(coin));
      }

    }else {
      print("istek  başarısız");
    }
    return coinList;
  }

}