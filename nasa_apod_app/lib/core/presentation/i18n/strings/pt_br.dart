import 'package:nasa_apod_app/nasa_apod_app.dart';

class PtBr implements Translation {
  /// Failures
  @override
  String get unexpectedFailure => 'Erro inesperado!';
  @override
  String get notHaveInternetConnectionFailure =>
      'Verifique sua conexão com a internet e tente novamente!';

  /// Strings
  @override
  String get reload => 'Recarregue!';
}
