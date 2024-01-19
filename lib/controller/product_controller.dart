import 'package:tezda/config/topsnackbar.dart';
import 'package:tezda/controller/locator.dart';
import 'package:tezda/model/products.dart';
import 'package:tezda/network/service/product_service.dart';
import 'package:tezda/responsive_state/base_view_model.dart';
import 'package:tezda/responsive_state/view_state.dart';

class ProductController extends BaseNotifier {
  var productAPI = locator<ProductService>();
  List<dynamic> _product = <dynamic>[];

  final List<Products> _favouriteProduct = <Products>[];

  List<dynamic> get products => _product;
  List<Products> get favouriteProduct => _favouriteProduct;

  handleFavourite(Products product) {
    if (_favouriteProduct.contains(product)) {
      _favouriteProduct.remove(product);
    } else {
      _favouriteProduct.add(product);
    }
    setState(ViewState.DataFetched);
  }

  Future<void> fetchAllProduct(context) async {
    try {
      var apiResponse = await productAPI.fetchAllProduct();
      if (apiResponse.statusCode == 200) {
        _product = apiResponse.data.map((e) => Products.fromJson(e)).toList();
        setState(ViewState.Idle);
      } else {
        // ignore: use_build_context_synchronously
        return topSnackBar(context, apiResponse.statusMessage!, SnackBar.error);
      }
    } catch (e) {
      setState(ViewState.Idle);
      // ignore: use_build_context_synchronously
      return topSnackBar(context, e.toString(), SnackBar.error);
    }
  }
}
