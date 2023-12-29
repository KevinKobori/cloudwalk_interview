enum MapperFailure {
  invalidJsonFormat('Invalid Json Format'),
  conversionError('Conversion Error');

  final String message;

  const MapperFailure(this.message);
}
