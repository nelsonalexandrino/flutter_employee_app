import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import '../ui_elements/address_tag.dart';
import '../../models/product.dart';
import '../../scoped_models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TitleDefault(product.title),
              PriceTag(product.price)
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          AddressTag('Bairro 25 de Junho A'),
          Text(product.userEmail),
          _buildActionsButtons(context)
        ],
      ),
    );
  }

  Widget _buildActionsButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
                context,
                '/product/' + productIndex.toString(),
              ),
        ),
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(model.allProducts[productIndex].isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                model.selectProductIndex(productIndex);
                model.isFavoriteStatus();
              },
            );
          },
        )
      ],
    );
  }
}
