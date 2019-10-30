import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetWidth = deviceWidth > 768.0 ? 700.0 : deviceWidth * .95;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: _buildBackgroundGradient()),
        padding: EdgeInsets.all(10.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: SizedBox(
                          width: 150, child: Image.asset('assets/absa.png'))),
                  SizedBox(
                    height: 20,
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
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                      textColor: Colors.white,
                      child: Text(
                        'VAMOS COMEÇAR',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      onPressed: () => _submitForm()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    Navigator.pushNamed(context, '/wellcome');
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
