import 'package:covidapp/models/user.dart';
import 'package:http/http.dart' as http;

import 'credentials.dart';

class request{

  static Future<String> register(RegisterCredentials credentials) async {
    Map<String, String> form = new Map();
    form["username"] = User().cpf;
    form["password"] = User().password;
    form["email"] = User().email;

    var uri = "/users";
    var res = await http.Client().post(Uri.encodeFull(uri), body: form);


  }
}