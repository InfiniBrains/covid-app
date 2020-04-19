class User {
  String cpf = '';
  String password = '';
  String name = '';
  String birth = '';
  String state = '';
  String city = '';
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