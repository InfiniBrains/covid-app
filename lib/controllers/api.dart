import 'package:http/http.dart' as http;
import 'dart:convert';

import 'credentials.dart';

class Request{

  static String _jwt;

  static Future<String> register(RegisterCredentials credentials) async {
    Map<String, String> form = new Map();
    form["username"] = credentials.cpf;
    form["password"] = credentials.password;
    form["email"] = credentials.email;
    form["name"] = credentials.name;
    form["zip"] = credentials.zip;

    var uri = "http://localhost:1337/users";
    var res = await http.Client().post(Uri.encodeFull(uri), body: form);
    print(res);

  }

  static Future<String> login(String cpf) async {
    Map<String, String> form = new Map();
    form["username"] = cpf;
    form["password"] = cpf;

    var uri = "http://localhost:1337/users";
    var res = await http.Client().post(Uri.encodeFull(uri), body: form);
    print(res);

    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      _jwt = map["jwt"];
      return _jwt;
    }
  }
}