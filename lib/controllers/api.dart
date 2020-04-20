import 'package:covidapp/models/user.dart';
import 'package:http/http.dart' as http;

import 'credentials.dart';

class Request{

  static Future<String> register(RegisterCredentials credentials) async {
    Map<String, String> form = new Map();
    form["username"] = credentials.cpf;
    form["password"] = credentials.password;
    form["email"] = credentials.email;
    form["name"] = credentials.name;
    form["zip"] = credentials.zip;

    var uri = "/users";
    var res = await http.Client().post(Uri.encodeFull(uri), body: form);


  }
}