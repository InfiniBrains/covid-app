import 'dart:wasm';

class User {
  String cpf = '';
  String email = '';
  String password = '';
  String name = '';
  String birth = '';
  String state = '';
  String city = '';
  String zip = '';
  List coordinates = [];
  Object location = {
    "type": "point",
  };
  List<String> reportList = [
    "Tosse",
    "Febre",
    "Falta de ar",
    "Perda de oufato",
    "Diarréia",
    "Espirros",
    "Enjoô",
    "Dor no corpo",
    "Dor na Garganta",
  ];
  List<String> symptoms =[];

  //  todo: Make the post function
  save() {
    print('post login');
  }
}