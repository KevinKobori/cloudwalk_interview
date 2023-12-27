enum DomainFailure {
  unexpected('Unexpected'),
  notFound('notFound'),
  invalidData('invalidData'),
  internalServerError('internalServerError'),
  notHaveInternetConnection('Not Have Internet Connection');

  final String message;

  const DomainFailure(this.message);
}
