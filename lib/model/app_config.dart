class AppConfig {
  String baseUrl = '';
  String appName = '';
  bool isProd = false;

  AppConfig(
      this.baseUrl, this.appName, this.isProd);

  AppConfig.emptyAppConfig();
}
