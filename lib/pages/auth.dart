import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/main.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };

  final GlobalKey<FormState> _authFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 768.0 ? 700.0 : deviceWidth * .95;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _buildBackgroundGradient(),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Form(
                key: _authFormKey,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 110,
                        child: Image.asset('assets/absa.png'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Employee',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Montserrat-Black',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    _buildBaTextField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildPasswordTextField(),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Esqueceu a palavra passe?',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ScopedModelDescendant<MainModel>(
                      builder: (BuildContext context, Widget child,
                          MainModel model) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                              textColor: Colors.white,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () => _submitForm(model.login)),
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'É a primeira vez?',
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm(Function login) {
    if (!_authFormKey.currentState.validate()) {
      return;
    }
    _authFormKey.currentState.save();
    login(_formData['email'], _formData['password']);
    Navigator.pushReplacementNamed(context, '/homepage');
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptTerms'] = value;
        });
      },
      title: Text('Accept the terms'),
      subtitle: Text('Don\'t worry you will like this terms'),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
        obscureText: true,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            errorStyle: TextStyle(color: Colors.white),
            labelText: 'Palavra passe',
            labelStyle:
                TextStyle(color: Colors.white.withOpacity(.75), fontSize: 16),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Colors.white.withOpacity(.75),
            ),
            filled: true,
            fillColor: Colors.black26),
        onSaved: (String value) {
          _formData['password'] = value;
        },
        validator: (String value) {
          if (value.isEmpty || value.length <= 7) {
            return 'A sua password não é valida';
          }
        });
  }

  Widget _buildBaTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
        labelText: 'Número mecanográfico',
        labelStyle:
            TextStyle(color: Colors.white.withOpacity(.75), fontSize: 16),
        hintText: 'Por exemplo BA009999',
        hintStyle: TextStyle(color: Colors.white54, fontSize: 12),
        prefixIcon: Icon(
          Icons.person_outline,
          color: Colors.white.withOpacity(.75),
        ),
        filled: true,
        fillColor: Colors.black26,
      ),
      onSaved: (String value) {
        _formData['email'] = value;
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"((BA)|(ba)|(Ba)|(bA))(00)([0-9]{4})").hasMatch(value)) {
          return "Certifique-se de que tenha este formato BA00####";
        }
      },
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
        image: AssetImage('assets/background.jpg'));
  }

  LinearGradient _buildBackgroundGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [const Color(0xFFBE0028), const Color(0xFF2E071B)],
      tileMode: TileMode.clamp,
    );
  }
}
