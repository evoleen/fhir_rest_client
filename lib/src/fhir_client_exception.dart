class FhirClientException implements Exception {
  final String cause;
  FhirClientException(this.cause);
}

class FhirClientEntityNotFoundException implements Exception {}
