class FhirRestClientException implements Exception {
  final String cause;
  FhirRestClientException(this.cause);
}

class FhirRestClientEntityNotFoundException implements Exception {}
