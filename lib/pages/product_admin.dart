import 'package:flutter/material.dart';

import './product_edit.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {
  /* final Function addProduct, deleteProduct, updateProduct;
  final List<Product> products; 

  ProductAdminPage(
      this.addProduct, this.updateProduct, this.deleteProduct, this.products);*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Products'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create produtc',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Products',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[ProductEditPage(), ProducListPage()],
        ),
      ),
    );
  }

  Drawer _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Manage Products'),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Product List'),
            onTap: () => Navigator.pushReplacementNamed(context, '/homepage'),
          )
        ],
      ),
    );
  }
}
