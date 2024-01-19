enum UrlEnvironment { development, production }

class UrlConfig {
  /// Determines environment configuration
  static UrlEnvironment environment = UrlEnvironment.development;

  /// Base URL based on the supplied [environment]
  static String baseUrl = _getBaseUrl(environment);

  static const String devBaseUrl = "https://fakestoreapi.com/";
  static const String prodBaseUrl = "https://fakestoreapi.com/";

  static String _getBaseUrl(UrlEnvironment environment) {
    switch (environment) {
      case UrlEnvironment.production:
        return prodBaseUrl;
      case UrlEnvironment.development:
      default:
        return devBaseUrl;
    }
  }

// Routes
  static String products = "${baseUrl}products";
}
