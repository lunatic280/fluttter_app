// menu_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hagsig_app/model/menu_model.dart';

class MenuApi {
  // API에서 메뉴 데이터를 가져오는 함수
  Future<List<Menu>> fetchMenu() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api'));


    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      // JSON 리스트를 Menu 객체 리스트로 변환
      return body.map((dynamic item) => Menu.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
