import 'package:dio/dio.dart';
import 'package:fhir_rest_client/fhir_rest_client.dart';

Future<void> main() async {
  final fhirRestclient = FhirRestClient(
    dio: Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        headers: {
          'Authorization': 'Bearer MYTOKEN',
        },
      ),
    ),
    baseUrl: Uri.parse('https://myfhirrestserver.com'),
  );

  final patients = await fhirRestclient.execute(
    request: FhirRequest(
      operation: FhirRequestOperation.search,
      entityName: 'Patient',
    ),
  );

  print(patients);
}
