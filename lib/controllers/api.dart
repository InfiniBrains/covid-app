import 'package:covidapp/models/form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'credentials.dart';

class Request{

  static String _jwt;
  static String _userId;
  //static String url = 'https://covid-the.herokuapp.com';
  static String url = 'http://10.0.2.2:1337';

  static Future<String> register(RegisterCredentials credentials) async {
    Map<String, String> form = new Map();
    form["username"] = credentials.cpf;
    form["password"] = credentials.cpf;
    form["cpf"] = credentials.cpf;
    form["email"] = credentials.email;
    form["name"] = credentials.name;
    form["zip"] = credentials.zip;

    var uri = url + "/auth/local/register";
    var res = await http.Client().post(Uri.encodeFull(uri), body: form);
    print(res.body);

  }

  static Future<String> login(String cpf) async {
    Map<String, String> form = new Map();
    form["identifier"] = cpf;
    form["password"] = cpf;

    var uri = url + "/auth/local";
    var res = await http.Client().post(Uri.encodeFull(uri), body: form);

    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      Map<String, dynamic> mapUser = map["user"];
      print(map);
      _jwt = map["jwt"];
      _userId = mapUser["_id"];
      return _jwt;
    }else{
      return null;
    }
  }
  //todo:improve user id injection on backend
  static Future<String> postSymptoms(SymptomsForm symptomsForm) async {
    Map<String, dynamic> form = new Map();
    form["dryCough"] = symptomsForm.dryCough;
    form["fever"] = symptomsForm.fever;
    form["bodyAche"] = symptomsForm.bodyAche;
    form["headAche"] = symptomsForm.headAche;
    form["throatProblems"] = symptomsForm.throatProblems;
    form["tiredness"] = symptomsForm.tiredness;
    form["diarrhea"] = symptomsForm.diarrhea;
    form["vomit"] = symptomsForm.vomit;
    form["dizziness"] = symptomsForm.dizziness;
    form["smell"] = symptomsForm.smell;
    form["taste"] = symptomsForm.taste;
    form["stuffyNose"] = symptomsForm.stuffyNose;
    form["nausea"] = symptomsForm.nausea;
    form["user"] = _userId;

    Map<String, String> header = new Map();
    header["Authorization"] = "Bearer " + _jwt;

    var uri = url + "/forms";
    var res = await http.Client().post(Uri.encodeFull(uri), body: jsonEncode(form), headers: header);
    print(res.body);

  }
  static Future<List<dynamic>> getSymptoms() async {
    Map<String, String> header = new Map();
    header["Authorization"] = "Bearer " + _jwt;

    var uri = url + "/forms?user=" + _userId + "&_sort=updatedAt:DESC";
    var res = await http.Client().get(Uri.encodeFull(uri), headers: header);
    List form = jsonDecode(res.body);
    //print(form[0]);
    return form;

  }
}