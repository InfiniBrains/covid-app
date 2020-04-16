import 'package:covidapp/controllers/routes.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration:
                            InputDecoration(labelText: 'CPF'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Favor colocar CPF.';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _user.cpf = val),
                          ),
                          TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Senha'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Favor colocar senha.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.password = val)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form.validate()) {
                                      form.save();
                                      _user.save();
                                      _showDialog(context);
                                      Navigator.pushNamed(context, Routes.appBody);
                                    }
                                  },
                                  child: Text('Entrar')
                              )
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, Routes.register);
                                  },
                                  child: Text('Registrar')
                              )
                          ),
                        ]
                    )
                )
            )
        )
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}