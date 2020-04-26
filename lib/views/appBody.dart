import 'dart:developer';

import 'package:covidapp/controllers/routes.dart';
import 'package:covidapp/models/form.dart';
import 'package:covidapp/models/user.dart';
import 'package:flutter/material.dart';

class AppBody extends StatefulWidget {

  @override
  _AppBody createState() => _AppBody();
}

class _AppBody extends State<AppBody> {
  bool isSelected = false;
  // List for choice chips

  List<String> selectedChoices = List();

  SymptomsForm symptoms;

  Map<String, dynamic> symptomsPost = Map();

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


  @override
  Widget build(BuildContext context) {
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
    )
    ]);
  }
  _buildChoiceList() {
    List<Widget> choices = List();
    User().reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              print(item);
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