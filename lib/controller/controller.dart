import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth_controller.dart';
import 'product_controller.dart';

class AppProviders {
  static final providers = <SingleChildWidget>[
    ListenableProvider(create: (_) => ProductController()),
    ListenableProvider(create: (_) => AuthController()),
  ];
}
