import 'package:get_it/get_it.dart';
import 'package:tezda/network/service/product_service.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<ProductService>(() => ProductServiceImpl());
}
