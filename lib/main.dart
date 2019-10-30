import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/product_admin.dart';
import './pages/products_page.dart';
import './pages/product_details.dart';
import './pages/splashcreeen.dart';
import './pages/wellcome.dart';
import './scoped_models/main.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var absaRed = MaterialColor(0xFFBE0028, const <int, Color>{
      50: const Color(0xFFBE0028),
      100: const Color(0xFFBE0028),
      200: const Color(0xFFBE0028),
      300: const Color(0xFFBE0028),
      400: const Color(0xFFBE0028),
      500: const Color(0xFFBE0028),
      600: const Color(0xFFBE0028),
      700: const Color(0xFFBE0028),
      800: const Color(0xFFBE0028),
      900: const Color(0xFFBE0028),
    });

    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        //debugShowMaterialGrid: true,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: absaRed,
          accentColor: Color(0xFFBE0028),
          fontFamily: 'Bitter',
          buttonColor: Color(0xFFBE0028),
        ),
        //home: AuthPage(),
        routes: {
          '/': (BuildContext context) => SplashPage(),
          '/wellcome': (BuildContext context) => WellcomePage(),
          '/authpage': (BuildContext context) => AuthPage(),
          '/homepage': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ProductAdminPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);

            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => ProductDetails(
                      index,
                    ));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ProductsPage());
        },
      ),
    );
  }
}
