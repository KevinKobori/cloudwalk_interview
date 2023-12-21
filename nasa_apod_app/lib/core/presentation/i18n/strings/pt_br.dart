import 'package:nasa_apod_app/nasa_apod_app.dart';

class PtBr implements Translation {
  /// Failures
  @override
  String get unexpectedFailure => 'Erro inesperado!';
  @override
  String get notHaveInternetConnectionFailure =>
      'Verifique sua conexão com a internet e tente novamente!';
  @override
  String get invalidDataFailure => 'Dados inválidos!';
  @override
  String get notFoundFailure => 'Não encontrado!';
  @override
  String get internalServerErrorFailure => 'Erro no servidor';

  /// Strings
  @override
  String get reload => 'Recarregue!';
}
