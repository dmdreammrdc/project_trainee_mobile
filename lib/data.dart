import 'dart:convert';
import 'package:http/http.dart' as http;

class Provinces {
  Future<List<String>> data_Provinces() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/kongvut/thai-province-data/master/json/thai_provinces.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map<String>((province) => province['name_th']).toList();
    } else {
      throw Exception('Failed to load provinces');
    }
  }
}