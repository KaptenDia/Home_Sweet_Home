import 'package:flutter/widgets.dart';
import 'package:home_sweet_home/models/product_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Product> _favorite = [];

  List<Product> get favorite => _favorite;

  set favorite(List<Product> favorite) {
    _favorite = favorite;
    notifyListeners();
  }

  setProduct(Product product) {
    if (!isFavorite(product)) {
      _favorite.add(product);
    } else {
      _favorite.removeWhere((element) => element.id == product.id);
    }

    notifyListeners();
  }

  isFavorite(Product product) {
    if (_favorite.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
