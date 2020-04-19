import 'dart:developer';

import 'package:covidapp/controllers/routes.dart';
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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
        Text(
          'Nome',
          textAlign: TextAlign.center,
        ),
        Image(
          alignment: Alignment.center,
          image: NetworkImage('https://via.placeholder.com/150'),
        ),
        Text(
          'Sintomas',
          textAlign: TextAlign.center,
        ),
        Text(
            selectedChoices.join(" , ")
        )
      ],
    );
  }
  // Symptoms choice picker
  Widget choiceChips(BuildContext context) {
    return Column( children: [
      Container(
        child: Text(
          'O QUE VOCÊ ESTÁ SENTINDO AGORA?',
          style: optionStyle,
        ),
      ),
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
              log(item);
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
        Text(
          'Precauções e Recomendações',
          textAlign: TextAlign.center,
        ),
        Image(
          alignment: Alignment.center,
          image: NetworkImage('https://via.placeholder.com/150'),
        ),
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
        Text(
          'Fale com seu Médico',
          textAlign: TextAlign.center,
        ),
        Text(
            'Número para Contato',
          textAlign: TextAlign.center,
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
        Text(
          'CONFIGURAÇÕES',
          textAlign: TextAlign.center,
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
            icon: Icon(Icons.access_alarm),
            title: Text('Sintomas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
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
            icon: Icon(Icons.android),
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