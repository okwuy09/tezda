import 'package:dio/dio.dart';
import 'package:tezda/network/network_provider.dart';
import 'package:tezda/network/urlconfig.dart';

abstract class ProductService {
  Future<Response> fetchAllProduct();
}

class ProductServiceImpl extends ProductService {
  NetworkProvider get networkProvider => globalNetworkProvider;

  @override
  Future<Response> fetchAllProduct() async {
    var response = await networkProvider.call(
      UrlConfig.products,
      RequestMethod.get,
    );
    return response;
  }
}
