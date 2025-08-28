import 'package:dio/dio.dart';
import 'package:fhir/r4.dart';
import 'package:fhir_rest_client/src/fhir_request.dart';
import 'package:fhir_rest_client/src/fhir_rest_client_exception.dart';

class FhirRestClient {
  final Dio dio;
  final Uri baseUrl;

  FhirRestClient({required this.dio, required this.baseUrl});

  Future<Map<String, dynamic>> getCapabilityStatement() async {
    final response = await dio.get(
      baseUrl.replace(path: 'metadata').toString(),
      options: Options(
        headers: {
          'Accept': 'application/fhir+json',
          'Content-type': 'application/fhir+json',
        },
      ),
    );

    return response.data as Map<String, dynamic>;
  }

  /// Assembles the URL (without parameters) for the request, consisting
  /// of the FHIR server's base URL, the path to the compartment (if requested)
  /// and the path to the entity including its ID.
  Uri _assembleUrlForRequest(FhirRequest request) {
    final requestCompartmentName = request.compartmentName;
    final requestCompartmentId = request.compartmentId;
    final requestEntityId = request.entityId;
    final requestPathParameters = request.pathParameters;
    // check if we have a valid compartment definition or no definition at all
    if ((requestCompartmentName == null) ^ (requestCompartmentId == null)) {
      throw FhirRestClientException(
          'Compartment must be specified by entity AND id or not at all.');
    }

    // point request to absolute endpoint URL and optionally add the compartment
    // to the URL
    Uri requestUrl = baseUrl.replace(pathSegments: [
      ...baseUrl.pathSegments,
      if (requestCompartmentName != null) requestCompartmentName,
      if (requestCompartmentId != null) requestCompartmentId,
      request.entityName,
      if (requestEntityId != null) requestEntityId,
      if (requestPathParameters.isNotEmpty) ...requestPathParameters,
    ]);

    return requestUrl;
  }

  /// Sends a CREATE request to the FHIR server. Throws if the request is not
  /// successful. Returns the decoded JSON response otherwise.
  Future<Map<String, dynamic>> _create({required FhirRequest request}) async {
    // compose final request URL based on base URL and parameters
    final requestUrl = _assembleUrlForRequest(request);

    // set proper resourceType - but only if we don't run a special operation
    // such as $reindex, $export or similar (these operations usually have
    // different resourceType as parameter)
    final parameters = Map.from(request.parameters);
    if (!request.entityName.startsWith('\$') && request.entityName.isNotEmpty) {
      parameters["resourceType"] = request.entityName;
    }

    // send request
    final response = await dio.post(
      requestUrl.toString(),
      data: parameters,
      options: Options(
        headers: {
          'Accept': 'application/fhir+json',
          'Content-type': 'application/fhir+json',
        },
      ),
    );

    switch (response.statusCode) {
      // request was ok
      case 200:
      case 201:
        return response.data as Map<String, dynamic>;
      // backend validation failed
      case 400:
        final operationOutcome =
            OperationOutcome.fromJson(response.data as Map<String, dynamic>);
        throw FhirRestClientException(
            'Backend errors: ${operationOutcome.issue.map((e) => e.diagnostics).join(', ')}');
      // we are not authorized to query the backend
      case 401:
        throw FhirRestClientException(
            'Not authorized to make requests to the FHIR backend.');
      case 500:
        throw FhirRestClientException(
            'Invalid request - FHIR backend encountered internal server error.');
      default:
        throw FhirRestClientException('Error querying FHIR backend.');
    }
  }

  /// Sends a search GET request to the FHIR server. Throws if the request is not
  /// successful. Returns the decoded JSON response otherwise.
  /// [uri] is a relative Uri to [baseUrl].
  Future<Map<String, dynamic>> _search({required FhirRequest request}) async {
    if (request.entityId != null) {
      throw FhirRestClientException(
          'Cannot execute search operation for entity ${request.entityName} with explicit id ${request.entityId}.');
    }

    // compose final request URL based on base URL and parameters
    var requestUrl = _assembleUrlForRequest(request);

    // add any optional query parameters if necessary
    if (request.parameters.isNotEmpty) {
      requestUrl = requestUrl.replace(queryParameters: request.parameters);
    }

    // send request
    final response = await dio.get(
      requestUrl.toString(),
      options: Options(
        headers: {
          'Accept': 'application/fhir+json',
          'Content-type': 'application/fhir+json',
        },
      ),
    );

    switch (response.statusCode) {
      // request was ok
      case 200:
        return response.data as Map<String, dynamic>;
      // backend validation failed
      case 400:
        final operationOutcome =
            OperationOutcome.fromJson(response.data as Map<String, dynamic>);
        throw FhirRestClientException(
            'Backend errors: ${operationOutcome.issue.map((e) => e.diagnostics).join(', ')}');
      // we are not authorized to query the backend
      case 401:
        throw FhirRestClientException(
            'Not authorized to make requests to the FHIR backend.');
      case 500:
        throw FhirRestClientException(
            'Invalid request - FHIR backend encountered internal server error.');
      default:
        throw FhirRestClientException('Error querying FHIR backend.');
    }
  }

  /// Sends a read GET request to the FHIR server. Throws if the request is not
  /// successful. Returns the decoded JSON response otherwise.
  /// [uri] is a relative Uri to [baseUrl].
  Future<Map<String, dynamic>> _read({required FhirRequest request}) async {
    if (request.entityId == null) {
      throw FhirRestClientException(
          'Cannot execute read operation for entity ${request.entityName} without entity id.');
    }

    // compose final request URL based on base URL and parameters
    var requestUrl = _assembleUrlForRequest(request);

    // add any optional query parameters if necessary
    if (request.parameters.isNotEmpty) {
      requestUrl = requestUrl.replace(queryParameters: request.parameters);
    }

    // send request
    final response = await dio.get(
      requestUrl.toString(),
      options: Options(
        headers: {
          'Accept': 'application/fhir+json',
          'Content-type': 'application/fhir+json',
        },
      ),
    );

    switch (response.statusCode) {
      // request was ok
      case 200:
        return response.data as Map<String, dynamic>;
      // backend validation failed
      case 400:
        final operationOutcome =
            OperationOutcome.fromJson(response.data as Map<String, dynamic>);
        throw FhirRestClientException(
            'Backend errors: ${operationOutcome.issue.map((e) => e.diagnostics).join(', ')}');
      // we are not authorized to query the backend
      case 401:
        throw FhirRestClientException(
            'Not authorized to make requests to the FHIR backend.');
      // entity was not found
      case 404:
      case 410:
        throw FhirRestClientEntityNotFoundException();
      case 500:
        throw FhirRestClientException(
            'Invalid request - FHIR backend encountered internal server error.');
      default:
        throw FhirRestClientException('Error querying FHIR backend.');
    }
  }

  /// Sends an UPDATE request to the FHIR server. Throws if the request is not
  /// successful. Returns the decoded JSON response otherwise.
  Future<Map<String, dynamic>> _update({required FhirRequest request}) async {
    // compose final request URL based on base URL and parameters
    final requestUrl = _assembleUrlForRequest(request);

    // set proper resourceType
    final parameters = Map.from(request.parameters);
    parameters["id"] = request.entityId;
    parameters["resourceType"] = request.entityName;

    // send request
    final response = await dio.put(
      requestUrl.toString(),
      data: parameters,
      options: Options(
        headers: {
          'Accept': 'application/fhir+json',
          'Content-type': 'application/fhir+json',
        },
      ),
    );

    switch (response.statusCode) {
      // request was ok
      case 200:
      case 201:
        return response.data as Map<String, dynamic>;
      // backend validation failed
      case 400:
        final operationOutcome =
            OperationOutcome.fromJson(response.data as Map<String, dynamic>);
        throw FhirRestClientException(
            'Backend errors: ${operationOutcome.issue.map((e) => e.diagnostics).join(', ')}');
      // we are not authorized to query the backend
      case 401:
        throw FhirRestClientException(
            'Not authorized to make requests to the FHIR backend.');
      // entity was not found
      case 404:
      case 410:
        throw FhirRestClientEntityNotFoundException();
      case 500:
        throw FhirRestClientException(
            'Invalid request - FHIR backend encountered internal server error.');
      default:
        throw FhirRestClientException('Error querying FHIR backend.');
    }
  }

  /// Sends a DELETE request to the FHIR server. Throws if the request is not
  /// successful. Returns the decoded JSON response otherwise.
  Future<Map<String, dynamic>> _delete({required FhirRequest request}) async {
    // compose final request URL based on base URL and parameters
    final requestUrl = _assembleUrlForRequest(request);

    // send request
    final response = await dio.delete(
      requestUrl.toString(),
      options: Options(
        headers: {
          'Accept': 'application/fhir+json',
          'Content-type': 'application/fhir+json',
        },
      ),
    );

    switch (response.statusCode) {
      // request was ok
      case 200:
      case 204:
        return <String, dynamic>{};
      // backend validation failed
      case 400:
        final operationOutcome =
            OperationOutcome.fromJson(response.data as Map<String, dynamic>);
        throw FhirRestClientException(
            'Backend errors: ${operationOutcome.issue.map((e) => e.diagnostics).join(', ')}');
      // we are not authorized to query the backend
      case 401:
        throw FhirRestClientException(
            'Not authorized to make requests to the FHIR backend.');
      // entity was not found
      case 404:
      case 410:
        throw FhirRestClientEntityNotFoundException();
      case 500:
        throw FhirRestClientException(
            'Invalid request - FHIR backend encountered internal server error.');
      default:
        throw FhirRestClientException('Error querying FHIR backend.');
    }
  }

  /// Executes a FHIR request and returns the result in JSON format.
  Future<Map<String, dynamic>> execute({required FhirRequest request}) async {
    switch (request.operation) {
      case FhirRequestOperation.create:
        return _create(request: request);
      case FhirRequestOperation.search:
        return _search(request: request);
      case FhirRequestOperation.read:
        return _read(request: request);
      case FhirRequestOperation.update:
        return _update(request: request);
      case FhirRequestOperation.delete:
        return _delete(request: request);
    }
  }

  /// Determines if the result of a request returned a "not found" error.
  static bool isNotFoundError(Map<String, dynamic> requestResult) {
    try {
      return requestResult['resourceType'] == 'OperationOutcome' &&
          requestResult['issue']['code'] == 'not-found';
    } catch (e) {
      return false;
    }
  }
}
