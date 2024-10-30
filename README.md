# [Evoleen](https://www.evoleen-technology.com) Fhir Rest Client

This package helps developers to retrieve and manipulate FHIR data with REST client.

This package does not manage authentication into a fhir server, for this feature exists [Azure Identity](https://pub.dev/packages/azure_identity)

## Example

```
final fhirRestclient = FhirRestClient(
    dio: Dio(
        BaseOptions(
            connectTimeout: const Duration(milliseconds: 30000),
            receiveTimeout: const Duration(milliseconds: 30000),
            headers: {
                'Accept': 'application/fhir+json',
                'Content-type': 'application/fhir+json',
                'Authorization': 'Bearer MYTOKEN',
            },
        ),
    ),
    baseUrl: Uri.parse('https://myfhirrestserver.com),
);

final patients = await restClient!.execute(
    request: FhirRequest(
        operation: FhirRequestOperation.search,
        entityName: 'Patient',
    ),
);

print(patients);
```


```[pubspec.yaml]
fhir_rest_client: ^0.0.1
```


