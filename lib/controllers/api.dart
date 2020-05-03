import 'package:covidapp/models/form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'credentials.dart';

class Request{

  static String _jwt;
  //static String url = 'https://covid-the.herokuapp.com';
  static String url = 'https://http://localhost:1337';

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
    print(cpf.toString());
    print(res.body);

    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      _jwt = map["jwt"];
      return _jwt;
    }else{
      return null;
    }
  }
  static Future<String> postSymptoms(SymptomsForm symptomsForm) async {
    Map<String, bool> form = new Map();
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

    Map<String, String> header = new Map();
    header["Authorization"] = "Bearer " + _jwt;

    //var uri = url + "/form";
    //var res = await http.Client().post(Uri.encodeFull(uri), body: form, headers: header);
    //print(res.body);
    print(symptomsForm.exposed);

  }
  static Future<String> getSymptoms() async {
    Map<String, String> header = new Map();
    header["Authorization"] = "Bearer " + _jwt;

    var uri = url + "/form";
    var res = await http.Client().get(Uri.encodeFull(uri), headers: header);
    print(res.body);

  }
}