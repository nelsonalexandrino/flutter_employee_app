import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';
import '../models/user.dart';

mixin ConnectedProducts on Model {
  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: 'nelson@gmail.com', // _authenticatedUser.email
        userId: 'jnsdjnajah'); // _authenticatedUser.id
    _products.add(newProduct);
    notifyListeners();
  }
}

mixin ProductModel on ConnectedProducts {
  bool _showFavorities = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    if (_showFavorities) {
      return _products.where((Product product) => product.isFavorite).toList();
    }
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  bool get displayFavoritesOnly {
    return _showFavorities;
  }

  Product get selectedProduct {
    if (_selProductIndex == null) {
      return null;
    }
    return _products[_selProductIndex];
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updatedProduct = Product(
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId);
    _products[_selProductIndex] = updatedProduct;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(_selProductIndex);
    notifyListeners();
  }

  void isFavoriteStatus() {
    final bool currentStatus = selectedProduct.isFavorite;
    final bool newFavoriteStatus = !currentStatus;

    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavorite: newFavoriteStatus);

    _products[_selProductIndex] = updatedProduct;
    notifyListeners();
  }

  void selectProductIndex(int index) {
    _selProductIndex = index;
    if (index != null) {
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    _showFavorities = !_showFavorities;
    notifyListeners();
  }
}

mixin UserModel on ConnectedProducts {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'klsnldsnknns', email: email, password: password);
  }
}
