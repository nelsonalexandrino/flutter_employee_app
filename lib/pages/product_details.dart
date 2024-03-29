import 'package:flutter/material.dart';
import '../widgets/ui_elements/title_default.dart';
import 'dart:async';
import '../widgets/products/price_tag.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/main.dart';
import '../models/product.dart';

class ProductDetails extends StatelessWidget {
  final int productIndex;

  ProductDetails(this.productIndex);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          final Product product = model.allProducts[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Column(
              children: <Widget>[
                Image.asset(product.image),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  child: Column(
                    children: <Widget>[
                      _buildAddressPriceTitleRow(product.title, product.price),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(product.description)
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAddressPriceTitleRow(String title, double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleDefault(title),
            SizedBox(
              height: 10.0,
            ),
            Text('Address: Bairro 25 de Junho A')
          ],
        ),
        PriceTag(price),
      ],
    );
  }
}
