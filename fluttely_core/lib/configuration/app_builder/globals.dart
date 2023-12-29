import 'package:fluttely_core/fluttely_core.dart';

class Globals {
  // Private constructor for internal use to ensure singleton pattern.
  Globals._internal();

  // The single instance of Globals.
  static final Globals _instance = Globals._internal();

  /// Gets the singleton instance of Globals.
  /// Throws an exception if called before the module is initialized.
  static Globals get instance {
    if (!_hasInit) {
      throw Exception(
          '''Globals must be initialized before use. Call Globals.init() on main() { Globals.init(); }.''');
    }
    return _instance;
  }

  // Flag to indicate whether the Globals has been initialized.
  static bool _hasInit = false;

  /// Initializes the Globals.
  /// It initializes necessary controllers and sets the _hasInit flag to true.
  /// This method should be called before accessing the instance.
  static void initialize({required AppThemeSizesData themeSizes}) {
    if (!_hasInit) {
      _hasInit = true;
      instance.themeSizesData = themeSizes;
    }
  }

  late AppThemeSizesData themeSizesData;
}
