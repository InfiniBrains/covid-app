import 'package:flutter/material.dart';
import '../models/user.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _registerKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _registerKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'CPF'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Favor colocar CPF.';
                              }
                            },
                            onSaved: (val) => setState(() => _user.cpf = val),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Nome'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Favor colocar nome.';
                              }
                            },
                            onSaved: (val) => setState(() => _user.name = val),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Estado'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Favor colocar nome.';
                              }
                            },
                            onSaved: (val) => setState(() => _user.state = val),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Cidade'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Favor colocar nome.';
                              }
                            },
                            onSaved: (val) => setState(() => _user.city = val),
                          ),
                          TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Data de nascimento'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Favor colocar data de nascimento.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.birth = val)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    final form = _registerKey.currentState;
                                    if (form.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                    }
                                  },
                                  child: Text('Entrar'))),
                        ])))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}