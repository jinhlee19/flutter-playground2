//TODO: Add your imports here.
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'APIKEY';

// class CoinData {
//   //TODO: Create your getCoinData() method here.
//   // Future getCoinData() async {
//   //   String requestURL = "$coinAPIURL/BTC/USD?apikey=$apiKey";
//   //   http.Response response = await http.get(requestURL);
//   Future getCoinData() async {
//     //TODO 4: Update the URL to use the selectedCurrency input.
//     String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
//     http.Response response = await http.get(Uri.parse(requestURL));
//
//     if (response.statusCode == 200) {
//       var decodedData = jsonDecode(response.body);
//       var lastPrice = decodedData['rate'];
//       return lastPrice;
//     } else {
//       print(response.statusCode);
//       throw 'Problem with the get request';
//     }
//   }
// }
class CoinData {
  //TODO 3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData() async {
    //TODO 4: Update the URL to use the selectedCurrency input.
    String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
