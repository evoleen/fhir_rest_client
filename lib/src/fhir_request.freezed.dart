// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FhirRequest {
  FhirRequestOperation get operation => throw _privateConstructorUsedError;

  /// Specifies the compartment name to use, for example 'Patient'.
  /// Together with [compartmentId] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  String? get compartmentName => throw _privateConstructorUsedError;

  /// Specifies the compartment ID to use, for example '12345'.
  /// Together with [compartmentName] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  String? get compartmentId => throw _privateConstructorUsedError;

  /// Name of entity to query, such as 'Patient'
  String get entityName => throw _privateConstructorUsedError;

  /// ID of entity to query. This is only needed to read queries but not
  /// required for searches.
  String? get entityId => throw _privateConstructorUsedError;

  /// Parameters to attach to the request. In case of create or update operations,
  /// this will contain the JSON body of the entity to create or update.
  /// For read operations, this will be search parameters that are passed
  /// as URL query parameters.
  Map<String, dynamic> get parameters => throw _privateConstructorUsedError;

  /// Additional path parameters to attach to the request.
  List<String> get pathParameters => throw _privateConstructorUsedError;

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FhirRequestCopyWith<FhirRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FhirRequestCopyWith<$Res> {
  factory $FhirRequestCopyWith(
          FhirRequest value, $Res Function(FhirRequest) then) =
      _$FhirRequestCopyWithImpl<$Res, FhirRequest>;
  @useResult
  $Res call(
      {FhirRequestOperation operation,
      String? compartmentName,
      String? compartmentId,
      String entityName,
      String? entityId,
      Map<String, dynamic> parameters,
      List<String> pathParameters});
}

/// @nodoc
class _$FhirRequestCopyWithImpl<$Res, $Val extends FhirRequest>
    implements $FhirRequestCopyWith<$Res> {
  _$FhirRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? compartmentName = freezed,
    Object? compartmentId = freezed,
    Object? entityName = null,
    Object? entityId = freezed,
    Object? parameters = null,
    Object? pathParameters = null,
  }) {
    return _then(_value.copyWith(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as FhirRequestOperation,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentId: freezed == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: null == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pathParameters: null == pathParameters
          ? _value.pathParameters
          : pathParameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FhirRequestImplCopyWith<$Res>
    implements $FhirRequestCopyWith<$Res> {
  factory _$$FhirRequestImplCopyWith(
          _$FhirRequestImpl value, $Res Function(_$FhirRequestImpl) then) =
      __$$FhirRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FhirRequestOperation operation,
      String? compartmentName,
      String? compartmentId,
      String entityName,
      String? entityId,
      Map<String, dynamic> parameters,
      List<String> pathParameters});
}

/// @nodoc
class __$$FhirRequestImplCopyWithImpl<$Res>
    extends _$FhirRequestCopyWithImpl<$Res, _$FhirRequestImpl>
    implements _$$FhirRequestImplCopyWith<$Res> {
  __$$FhirRequestImplCopyWithImpl(
      _$FhirRequestImpl _value, $Res Function(_$FhirRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? operation = null,
    Object? compartmentName = freezed,
    Object? compartmentId = freezed,
    Object? entityName = null,
    Object? entityId = freezed,
    Object? parameters = null,
    Object? pathParameters = null,
  }) {
    return _then(_$FhirRequestImpl(
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as FhirRequestOperation,
      compartmentName: freezed == compartmentName
          ? _value.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentId: freezed == compartmentId
          ? _value.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: null == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pathParameters: null == pathParameters
          ? _value._pathParameters
          : pathParameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FhirRequestImpl extends _FhirRequest {
  const _$FhirRequestImpl(
      {required this.operation,
      this.compartmentName,
      this.compartmentId,
      required this.entityName,
      this.entityId,
      final Map<String, dynamic> parameters = const {},
      final List<String> pathParameters = const []})
      : _parameters = parameters,
        _pathParameters = pathParameters,
        super._();

  @override
  final FhirRequestOperation operation;

  /// Specifies the compartment name to use, for example 'Patient'.
  /// Together with [compartmentId] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  @override
  final String? compartmentName;

  /// Specifies the compartment ID to use, for example '12345'.
  /// Together with [compartmentName] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  @override
  final String? compartmentId;

  /// Name of entity to query, such as 'Patient'
  @override
  final String entityName;

  /// ID of entity to query. This is only needed to read queries but not
  /// required for searches.
  @override
  final String? entityId;

  /// Parameters to attach to the request. In case of create or update operations,
  /// this will contain the JSON body of the entity to create or update.
  /// For read operations, this will be search parameters that are passed
  /// as URL query parameters.
  final Map<String, dynamic> _parameters;

  /// Parameters to attach to the request. In case of create or update operations,
  /// this will contain the JSON body of the entity to create or update.
  /// For read operations, this will be search parameters that are passed
  /// as URL query parameters.
  @override
  @JsonKey()
  Map<String, dynamic> get parameters {
    if (_parameters is EqualUnmodifiableMapView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_parameters);
  }

  /// Additional path parameters to attach to the request.
  final List<String> _pathParameters;

  /// Additional path parameters to attach to the request.
  @override
  @JsonKey()
  List<String> get pathParameters {
    if (_pathParameters is EqualUnmodifiableListView) return _pathParameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathParameters);
  }

  @override
  String toString() {
    return 'FhirRequest(operation: $operation, compartmentName: $compartmentName, compartmentId: $compartmentId, entityName: $entityName, entityId: $entityId, parameters: $parameters, pathParameters: $pathParameters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FhirRequestImpl &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.compartmentName, compartmentName) ||
                other.compartmentName == compartmentName) &&
            (identical(other.compartmentId, compartmentId) ||
                other.compartmentId == compartmentId) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters) &&
            const DeepCollectionEquality()
                .equals(other._pathParameters, _pathParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operation,
      compartmentName,
      compartmentId,
      entityName,
      entityId,
      const DeepCollectionEquality().hash(_parameters),
      const DeepCollectionEquality().hash(_pathParameters));

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FhirRequestImplCopyWith<_$FhirRequestImpl> get copyWith =>
      __$$FhirRequestImplCopyWithImpl<_$FhirRequestImpl>(this, _$identity);
}

abstract class _FhirRequest extends FhirRequest {
  const factory _FhirRequest(
      {required final FhirRequestOperation operation,
      final String? compartmentName,
      final String? compartmentId,
      required final String entityName,
      final String? entityId,
      final Map<String, dynamic> parameters,
      final List<String> pathParameters}) = _$FhirRequestImpl;
  const _FhirRequest._() : super._();

  @override
  FhirRequestOperation get operation;

  /// Specifies the compartment name to use, for example 'Patient'.
  /// Together with [compartmentId] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  @override
  String? get compartmentName;

  /// Specifies the compartment ID to use, for example '12345'.
  /// Together with [compartmentName] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  @override
  String? get compartmentId;

  /// Name of entity to query, such as 'Patient'
  @override
  String get entityName;

  /// ID of entity to query. This is only needed to read queries but not
  /// required for searches.
  @override
  String? get entityId;

  /// Parameters to attach to the request. In case of create or update operations,
  /// this will contain the JSON body of the entity to create or update.
  /// For read operations, this will be search parameters that are passed
  /// as URL query parameters.
  @override
  Map<String, dynamic> get parameters;

  /// Additional path parameters to attach to the request.
  @override
  List<String> get pathParameters;

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FhirRequestImplCopyWith<_$FhirRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
