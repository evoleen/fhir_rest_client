import 'package:freezed_annotation/freezed_annotation.dart';

part 'fhir_request.freezed.dart';

/// Request operation to perform. Search is equal to read.
enum FhirRequestOperation {
  search,
  create,
  read,
  update,
  delete,
}

enum FhirSearchOperator {
  replace,
  intersect,
  add,
}

/// Describes a request to the FHIR backend.
/// [compartment] can be of the form 'Patient/1235234' and is
/// an optional part of the request. [entity] is the entity being
/// queried and [parameters] optionally contains a list of
/// search parameters.
/// The [FhirClient] will assemble the request into the format
/// of fhirBaseUrl/compartment/entity?queryParameters.
/// It can optionally be used together with validators that will
/// change part of the request parameters during validation to
/// ensure RBAC restrictions.
@freezed
class FhirRequest with _$FhirRequest {
  const FhirRequest._();

  const factory FhirRequest({
    required FhirRequestOperation operation,

    /// Specifies the compartment name to use, for example 'Patient'.
    /// Together with [compartmentId] the full compartment reference will
    /// be constructed, such as 'Patient/12345'.
    /// If no compartment is specified, the request will be processed
    /// without a compartment. If a compartment is specified, the request
    /// will be scoped to the compartment.
    String? compartmentName,

    /// Specifies the compartment ID to use, for example '12345'.
    /// Together with [compartmentName] the full compartment reference will
    /// be constructed, such as 'Patient/12345'.
    /// If no compartment is specified, the request will be processed
    /// without a compartment. If a compartment is specified, the request
    /// will be scoped to the compartment.
    String? compartmentId,

    /// Name of entity to query, such as 'Patient'
    required String entityName,

    /// ID of entity to query. This is only needed to read queries but not
    /// required for searches.
    String? entityId,

    /// Parameters to attach to the request. In case of create or update operations,
    /// this will contain the JSON body of the entity to create or update.
    /// For read operations, this will be search parameters that are passed
    /// as URL query parameters.
    @Default({}) Map<String, dynamic> parameters,
  }) = _FhirRequest;

  /// Utility function for search operations. Returns a new [FhirRequest]
  /// instance with an additional search parameter.
  /// If a parameter already exists in the request, behavior depends on
  /// [combineExisting]. The default behavior is to intersect, meaning
  /// that only those search parameters that were in the original query and
  /// those that were meant to be added are retained. Example: original query
  /// looks for _id=1,2,3 and we are to add _id=3,4,5 => then the resulting
  /// query searches for _id=3.
  /// Alternatively, the search filter can be replaced (only the new filter
  /// will be used) or extended (both old and new values are kept).
  FhirRequest addSearchFilter({
    required String onField,
    required String filter,
    FhirSearchOperator combineExisting = FhirSearchOperator.intersect,
  }) {
    if (operation != FhirRequestOperation.search) {
      throw Exception(
          'Tried to add a search parameter to a non-search FhirRequest instance.');
    }

    final filterList = List<String>.empty(growable: true);

    // if a filter with the same name already exists, don't overwrite but append
    if (parameters.containsKey(onField)) {
      final List<String> existingParameters = parameters[onField] is List
          ? parameters[onField]
          : [parameters[onField]];

      switch (combineExisting) {
        case FhirSearchOperator.add:
          filterList.addAll(existingParameters);
          filterList.add(filter);
        case FhirSearchOperator.replace:
          filterList.add(filter);
        case FhirSearchOperator.intersect:
          final oldValues = existingParameters
              .map((e) => e.split(','))
              .expand((x) => x)
              .toList();

          final newValues = filter.split(',');

          // only keep values that exist in both filters
          filterList.addAll(
              newValues.where((element) => oldValues.contains(element)));

          if (filterList.isEmpty) {
            // in case we come up empty, force an empty search result by adding
            // field=invalid&field:missing=true (which can only be satisfied
            // by an empty list)
            final newParameters = Map.of(parameters);
            newParameters[onField] = 'invalid';
            newParameters['$onField:missing'] = 'true';
            return copyWith(parameters: newParameters);
          }
      }
    } else {
      filterList.add(filter);
    }

    // return a copy of this instance with updated search parameters
    final newParameters = Map.of(parameters);
    newParameters[onField] = filterList;

    return copyWith(parameters: newParameters);
  }

  /// Utility function for search operations. Returns a new [FhirRequest]
  /// instance with an additional search parameter restricting the search
  /// to a patient reference [onField] in the searched entity which also
  /// has a Patient.managingOrganization field matching any of the
  /// organizations in [practitionerRoles].
  /// This method is used to filter search requests for patient documents
  /// by restricting the search to documents which belong to an organization
  /// in which the practitioner has matching role.
  FhirRequest addPatientOrganizationRelationshipFilter({
    required String onField,
    required List<String> organizationIds,
  }) {
    return addSearchFilter(
        onField: '$onField:Patient.organization',
        filter: organizationIds.join(','));
  }

  /// Force an empty search result by adding
  /// _tag=emptySearch (which will result in empty search list (or entities
  /// with this tag that we want to explicitly include in this scenario)

  FhirRequest enforceEmptySearchResult() {
    final newParameters = Map.of(parameters);
    newParameters['_tag'] = 'emptySearch';
    newParameters['_tag:missing'] = 'true';
    return copyWith(parameters: newParameters);
  }
}
