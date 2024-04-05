import 'package:http/http.dart' as http;
import 'package:shop_app/model/productmodel.dart';

class Remoteservises {
  static var client = http.Client();

  static Future<List<Welcome>> fetchproduct() async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return welcomeFromJson(jsonString);
    } else {
      throw " not gettit";
    }
  }
}
