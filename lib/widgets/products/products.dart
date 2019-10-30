import 'package:flutter/material.dart';
import './product_card.dart';
import '../../models/product.dart';
import '../../scoped_models/main.dart';

import 'package:scoped_model/scoped_model.dart';

class Products extends StatelessWidget {
  Widget _buildProducList(List<Product> products) {
    Widget cardProducts = Center(
      child: Text(
        'Ainda não há comunicações...mas não fique assim, já já as comunicações estarão ai...estão a caminho...',
        textAlign: TextAlign.center,
      ),
    );

    if (products.length > 0) {
      cardProducts = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    }

    return cardProducts;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProducList(model.displayedProducts);
      },
    );
  }
}
