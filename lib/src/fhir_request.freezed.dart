// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fhir_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FhirRequest {
  FhirRequestOperation get operation;

  /// Specifies the compartment name to use, for example 'Patient'.
  /// Together with [compartmentId] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  String? get compartmentName;

  /// Specifies the compartment ID to use, for example '12345'.
  /// Together with [compartmentName] the full compartment reference will
  /// be constructed, such as 'Patient/12345'.
  /// If no compartment is specified, the request will be processed
  /// without a compartment. If a compartment is specified, the request
  /// will be scoped to the compartment.
  String? get compartmentId;

  /// Name of entity to query, such as 'Patient'
  String get entityName;

  /// ID of entity to query. This is only needed to read queries but not
  /// required for searches.
  String? get entityId;

  /// Parameters to attach to the request. In case of create or update operations,
  /// this will contain the JSON body of the entity to create or update.
  /// For read operations, this will be search parameters that are passed
  /// as URL query parameters.
  Map<String, dynamic> get parameters;

  /// Additional path parameters to attach to the request.
  List<String> get pathParameters;

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FhirRequestCopyWith<FhirRequest> get copyWith =>
      _$FhirRequestCopyWithImpl<FhirRequest>(this as FhirRequest, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FhirRequest &&
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
                .equals(other.parameters, parameters) &&
            const DeepCollectionEquality()
                .equals(other.pathParameters, pathParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      operation,
      compartmentName,
      compartmentId,
      entityName,
      entityId,
      const DeepCollectionEquality().hash(parameters),
      const DeepCollectionEquality().hash(pathParameters));

  @override
  String toString() {
    return 'FhirRequest(operation: $operation, compartmentName: $compartmentName, compartmentId: $compartmentId, entityName: $entityName, entityId: $entityId, parameters: $parameters, pathParameters: $pathParameters)';
  }
}

/// @nodoc
abstract mixin class $FhirRequestCopyWith<$Res> {
  factory $FhirRequestCopyWith(
          FhirRequest value, $Res Function(FhirRequest) _then) =
      _$FhirRequestCopyWithImpl;
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
class _$FhirRequestCopyWithImpl<$Res> implements $FhirRequestCopyWith<$Res> {
  _$FhirRequestCopyWithImpl(this._self, this._then);

  final FhirRequest _self;
  final $Res Function(FhirRequest) _then;

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
    return _then(_self.copyWith(
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as FhirRequestOperation,
      compartmentName: freezed == compartmentName
          ? _self.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentId: freezed == compartmentId
          ? _self.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: null == entityName
          ? _self.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: null == parameters
          ? _self.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pathParameters: null == pathParameters
          ? _self.pathParameters
          : pathParameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FhirRequest].
extension FhirRequestPatterns on FhirRequest {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FhirRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FhirRequest() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FhirRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FhirRequest():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FhirRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FhirRequest() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            FhirRequestOperation operation,
            String? compartmentName,
            String? compartmentId,
            String entityName,
            String? entityId,
            Map<String, dynamic> parameters,
            List<String> pathParameters)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FhirRequest() when $default != null:
        return $default(
            _that.operation,
            _that.compartmentName,
            _that.compartmentId,
            _that.entityName,
            _that.entityId,
            _that.parameters,
            _that.pathParameters);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            FhirRequestOperation operation,
            String? compartmentName,
            String? compartmentId,
            String entityName,
            String? entityId,
            Map<String, dynamic> parameters,
            List<String> pathParameters)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FhirRequest():
        return $default(
            _that.operation,
            _that.compartmentName,
            _that.compartmentId,
            _that.entityName,
            _that.entityId,
            _that.parameters,
            _that.pathParameters);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            FhirRequestOperation operation,
            String? compartmentName,
            String? compartmentId,
            String entityName,
            String? entityId,
            Map<String, dynamic> parameters,
            List<String> pathParameters)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FhirRequest() when $default != null:
        return $default(
            _that.operation,
            _that.compartmentName,
            _that.compartmentId,
            _that.entityName,
            _that.entityId,
            _that.parameters,
            _that.pathParameters);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FhirRequest extends FhirRequest {
  const _FhirRequest(
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

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FhirRequestCopyWith<_FhirRequest> get copyWith =>
      __$FhirRequestCopyWithImpl<_FhirRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FhirRequest &&
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

  @override
  String toString() {
    return 'FhirRequest(operation: $operation, compartmentName: $compartmentName, compartmentId: $compartmentId, entityName: $entityName, entityId: $entityId, parameters: $parameters, pathParameters: $pathParameters)';
  }
}

/// @nodoc
abstract mixin class _$FhirRequestCopyWith<$Res>
    implements $FhirRequestCopyWith<$Res> {
  factory _$FhirRequestCopyWith(
          _FhirRequest value, $Res Function(_FhirRequest) _then) =
      __$FhirRequestCopyWithImpl;
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
class __$FhirRequestCopyWithImpl<$Res> implements _$FhirRequestCopyWith<$Res> {
  __$FhirRequestCopyWithImpl(this._self, this._then);

  final _FhirRequest _self;
  final $Res Function(_FhirRequest) _then;

  /// Create a copy of FhirRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? operation = null,
    Object? compartmentName = freezed,
    Object? compartmentId = freezed,
    Object? entityName = null,
    Object? entityId = freezed,
    Object? parameters = null,
    Object? pathParameters = null,
  }) {
    return _then(_FhirRequest(
      operation: null == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as FhirRequestOperation,
      compartmentName: freezed == compartmentName
          ? _self.compartmentName
          : compartmentName // ignore: cast_nullable_to_non_nullable
              as String?,
      compartmentId: freezed == compartmentId
          ? _self.compartmentId
          : compartmentId // ignore: cast_nullable_to_non_nullable
              as String?,
      entityName: null == entityName
          ? _self.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _self.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      parameters: null == parameters
          ? _self._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      pathParameters: null == pathParameters
          ? _self._pathParameters
          : pathParameters // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
