import 'dart:convert';
import 'package:http/http.dart' as http;

class UserNetwork {
  Future<void> makeSignUpRequest(Map<String, String> reqBody) async {
    final data = await http.post(Uri.parse('http://localhost:5000/sign-up'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(reqBody));
    final response = jsonDecode(data.body);
    print(response);
    return;
  }
}
