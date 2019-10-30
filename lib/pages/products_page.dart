import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 31,
            icon: ImageIcon(
              AssetImage('assets/absa.png'),
            ),
            onPressed: () {},
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        title: Text('Comunicações'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          ),
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            height: 47,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Colors.white, //0xFFA60024
                    child: Text(
                      'Todas',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'MCR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'HR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'Retalho',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'Corporate',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'Governação & Controlo',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'Compliance',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FlatButton(
                    onPressed: () {},
                    color: Color(0xFFA60024), //0xFFA60024
                    child: Text(
                      'COO',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ), //body: Products(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 80,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFBE0028),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Stack(
                alignment: Alignment(0, 0),
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/user.jpg'),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'Nelson Munguambe',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 2),
              child: Text(
                'UX Developer',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              width: 250,
              color: Colors.white,
              height: 2,
            ),
            Container(
              margin: EdgeInsets.only(top: 13, right: 13, left: 13, bottom: 20),
              //480
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildSideMenuButton(
                          'Comunicações', 'assets/newsletter.png'),
                      SizedBox(
                        width: 13,
                      ),
                      _buildSideMenuButton('Câmbios', 'assets/exchange.png')
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSideMenuButton('Produtos', 'assets/growth.png'),
                      SizedBox(
                        width: 13,
                      ),
                      _buildSideMenuButton(
                          'Simul. de crédito', 'assets/simulation.png')
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSideMenuButton('Contactos', 'assets/phonebook.png'),
                      SizedBox(
                        width: 13,
                      ),
                      _buildSideMenuButton('Benefícios', 'assets/gift.png')
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSideMenuButton('Suporte', 'assets/suport.png'),
                      SizedBox(
                        width: 13,
                      ),
                      _buildSideMenuButton('Vagas', 'assets/job.png')
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSideMenuButton('Workplace', 'assets/workplace.png'),
                      SizedBox(
                        width: 13,
                      ),
                      _buildSideMenuButton('LMS', 'assets/training.png')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildSideMenuButton(String menu, String image) {
    return Expanded(
      child: Container(
        /*  decoration: BoxDecoration(border: Border.all(color: Colors.white10)), */
        /* decoration: BoxDecoration(
          boxShadow: [
            new BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: new Offset(0, 0),
                blurRadius: 1)
          ],
        ), */
        child: FlatButton(
          onPressed: () {},
          color: Color(0xFFA60024), //0xFFA60024
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: <Widget>[
                Opacity(
                  opacity: .9,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(image),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  menu,
                  style: TextStyle(
                      color: Colors.white.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/* ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
            ) 
*/

/*
UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/user.jpg'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user.jpg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/user.jpg'),
                )
              ],
              accountEmail: Text('nelson.munguambe@marrar.co.mz'),
              accountName: Text('Nelson Munguambe'),
            ),

*/
