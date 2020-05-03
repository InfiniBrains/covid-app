import 'dart:convert';

import 'package:covidapp/models/form.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/controllers/api.dart';

class AppBody extends StatefulWidget {

  @override
  _AppBody createState() => _AppBody();
}

class _AppBody extends State<AppBody> {
  bool isSelected = false;

  // List for choice chips

  List<String> selectedChoices = List();

  SymptomsForm symptoms = new SymptomsForm();

  int _selectedIndex = 0;
  static const TextStyle titletext =
  TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue);
  static const TextStyle bodytext =
  TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Future getSymptoms() async {
   var form = await Request.getSymptoms();
   Map<String, dynamic> result = form[0];
   symptoms = SymptomsForm.fromJson(result);
   sintomasToMap();
  }
  sintomas() {
    symptoms.dryCough = sint['Tosse'];
    symptoms.fever = sint['Febre'];
    symptoms.stuffyNose = sint['Nariz Entupido'];
    symptoms.shortOfBreath = sint['Falta de Ar'];
    symptoms.bodyAche = sint['Dor no Corpo'];
    symptoms.headAche = sint['Dor de Cabeça'];
    symptoms.smell = sint['Perca de Olfato'];
    symptoms.taste = sint['Perca de Paladar'];
    symptoms.dizziness = sint['Tontura'];
    symptoms.diarrhea = sint['Diarreia'];
    symptoms.vomit = sint['Vomito'];
    symptoms.throatProblems = sint['Dor de Garganta'];
    symptoms.exposed = sint['Contato com Infectado'];
    symptoms.tiredness = sint['Cansaço'];
    symptoms.nausea = sint['Nausea'];
    //Request.postSymptoms(symptoms);
  }
  sintomasToMap() {
    sint['Tosse'] = symptoms.dryCough;
    sint['Febre'] = symptoms.fever;
    sint['Nariz Entupido'] = symptoms.stuffyNose;
    sint['Falta de Ar'] = symptoms.shortOfBreath;
    sint['Dor no Corpo'] = symptoms.bodyAche;
    sint['Dor de Cabeça'] = symptoms.headAche;
    sint['Perca de Olfato'] = symptoms.smell;
    sint['Perca de Paladar'] = symptoms.taste;
    sint['Tontura'] = symptoms.dizziness;
    sint['Diarreia'] = symptoms.diarrhea;
    sint['Vomito'] = symptoms.vomit;
    sint['Dor de Garganta'] = symptoms.throatProblems;
    sint['Contato com Infectado'] = symptoms.exposed;
    sint['Cansaço'] = symptoms.tiredness;
    sint['Nausea'] = symptoms.nausea;
    sint.forEach((key, value) {
      value == true ? selectedChoices.add('${key}') : '';
    });
  }

  Map<String,bool> sint = {
    'Tosse': false,
    'Nariz Entupido': false,
    'Falta de Ar': false,
    'Febre': false,
    'Dor no Corpo': false,
    'Dor de Cabeça': false,
    'Perca de Olfato': false,
    'Perca de Paladar': false,
    'Tontura': false,
    'Diarreia': false,
    'Vomito': false,
    'Dor de Garganta': false,
    'Contato com Infectado': false,
    'Cansaço': false,
    'Nausea': false,

  };

  @override
  Widget build(BuildContext context) {
   // Request.getSymptoms();
    //Request.postSymptoms(symptoms);
    List<Widget> _widgetOptions = <Widget>[
      profile(context),
      choiceChips(context),
      precautions(context),
      speakToDoctor(context),
      chat(context),
      config(context),
    ];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: bottomBar(context),
      ),
    );
  }
  // profile widget
  Widget profile(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
          Text(
            'Nome',
            textAlign: TextAlign.center,
            style: titletext,
        ),
        SizedBox(height: 20,),
        Container(
          width: 150,
          height: 150,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              width: 2,
              color: Colors.blue,
            ) ,
            image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage('https://via.placeholder.com/150'))
          )
        ),
        SizedBox(height: 20,),
        Text(
          'SINTOMAS:',
          textAlign: TextAlign.center,
          style: bodytext,
        ),
        SizedBox(height: 20,),
        Text(
            selectedChoices.join(" , ")
        ),
        RaisedButton(
          child: Text('Pegar'),
          onPressed: () {
            getSymptoms();
            sintomasToMap();
          },
        )
      ],
    );
  }
  // Symptoms choice picker
  Widget choiceChips(BuildContext context) {
    return Column( children: [
      SizedBox(height: 50,),
      Container(
        child: Text(
          'O que estou sentindo agora?',
          style: titletext,
        ),
      ),
      SizedBox(height: 20,),
        Wrap(
        children: _buildChoiceList(),
          ),
    ]);
  }
  _buildChoiceList() {
    List<Widget> choices = List();
    sint.forEach((k,v) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text('${k}'),
          selected: selectedChoices.contains('${k}'),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains('${k}')
                  ? selectedChoices.remove('${k}')
                  : selectedChoices.add('${k}');
              sint['${k}'] = selected;
              sintomas();
            });
          },
        ),
      ));
    });    return choices;
  }
  // precautions widget
  Widget precautions(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Text(
          'Precauções e Recomendações',
          textAlign: TextAlign.center,
          style: titletext,
        ),
        SizedBox(height: 20,),
        Image(
          alignment: Alignment.center,
          image: NetworkImage('https://via.placeholder.com/150'),
        ),
        SizedBox(height: 20,),
        Text(
          'Pokem ipsum dolor sit amet Escavalier Gold Blaziken Altaria Victini Parasect.'
              ' Earthquake Tynamo Giovanni Dratini Glitch City make it double Volcarona.'
              ' Cascade Badge Thundurus Swalot Palpitoad Cloyster ex ea commodo consequat Staraptor.'
              ' Poison Sinnoh Blitzle Spiritomb Archen Rotom Wooper. '
              'Rock Flygon Lanturn Swalot Riolu Chinchou Skarmory.'
        )
      ],
    );
  }
  // speak o your doctor widget
  Widget speakToDoctor(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Text(
          'Fale com seu Médico',
          textAlign: TextAlign.center,
          style: titletext,
        ),
        SizedBox(height: 20,),
        Text(
            'Número para Contato',
          textAlign: TextAlign.center,
          style: bodytext,
        )
      ],
    );
  }
  // todo: implement chat widget
  Widget chat(BuildContext context) {
    return Column(
      children: [
        Text(
          'INSIRA AQUI O CHAT',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  //todo: app config
  Widget config(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Text(
          'Configurações',
          textAlign: TextAlign.center,
          style: titletext,
        ),
      ],
    );
  }
  //todo: transformar em topNavBar
  Widget bottomBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Perfil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            title: Text('Sintomas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            title: Text('Precauções'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            title: Text('Telefone'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      );

  }
}