enum LocalStorageFailure {
  unknownError('Unknown Error');

  final String message;

  const LocalStorageFailure(this.message);
}
