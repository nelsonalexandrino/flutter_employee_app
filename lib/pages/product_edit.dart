import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../scoped_models/main.dart';

class ProductEditPage extends StatefulWidget {
  /* final Function addProduct;
  final Function updateProduct;
  final Product product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex}); */

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedProduct);
        return model.selectedProductIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit product'),
                ),
                body: pageContent,
              );
      },
    );
  }

  GestureDetector _buildPageContent(BuildContext context, Product product) {
    final double deviceWidh = MediaQuery.of(context).size.width;
    final double targetWith = deviceWidh > 550 ? 500.0 : deviceWidh * .95;
    final double targetPadding = deviceWidh - targetWith;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextField(product),
              _buildDescriptionTextField(product),
              _buildPriceTextField(product),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return RaisedButton(
          textColor: Colors.white,
          child: Text('Guardar'),
          onPressed: () => _submitForm(model.addProduct, model.updateProduct,
              model.selectProductIndex, model.selectedProductIndex),
        );
      },
    );
  }

  _submitForm(
      Function addProduct, Function updateProduct, Function selectProductIndex,
      [int selectedProductIndex]) {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();

    if (selectedProductIndex == null) {
      addProduct(_formData['title'], _formData['description'],
          _formData['image'], _formData['price']);
    } else {
      updateProduct(_formData['title'], _formData['description'],
          _formData['image'], _formData['price']);
    }

    Navigator.pushReplacementNamed(context, '/homepage')
        .then((_) => selectProductIndex(null));
  }

  Widget _buildPriceTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product price'),
      initialValue: product == null ? '' : product.price.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onSaved: (String value) {
        /* setState(() {
          _priceValue = double.parse(value);
        }); */
        _formData['price'] = double.parse(value);
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return "Price is requeried and should be a number";
        }
      },
    );
  }

  Widget _buildDescriptionTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product description'),
      initialValue: product == null ? '' : product.description,
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return "Please say more something";
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildTitleTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product title'),
      initialValue: product == null ? '' : product.title,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return "Title is required";
        }
      },
      onSaved: (String value) {
        _formData['title'] = value;
      },
    );
  }
}
