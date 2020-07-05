import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servicerequest/Constants.dart';

class NetworkHelper {
  Future<dynamic> getdata(String value) async {
    var response = await http.get(Uri.parse(
        Constants.BASE_URL + value + Constants.PARAMETERS + Constants.API_KEY));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponce = jsonDecode(response.body);
      return jsonResponce;
    } else {
      return null;
    }
  }
}
