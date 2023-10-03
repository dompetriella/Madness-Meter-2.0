// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlayerSession _$PlayerSessionFromJson(Map<String, dynamic> json) {
  return _PlayerSession.fromJson(json);
}

/// @nodoc
mixin _$PlayerSession {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'campaign_name')
  String get campaignName => throw _privateConstructorUsedError;
  @JsonKey(name: 'madness_value')
  int get madnessValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_madness_value')
  int get maxMadnessValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayerSessionCopyWith<PlayerSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerSessionCopyWith<$Res> {
  factory $PlayerSessionCopyWith(
          PlayerSession value, $Res Function(PlayerSession) then) =
      _$PlayerSessionCopyWithImpl<$Res, PlayerSession>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'campaign_name') String campaignName,
      @JsonKey(name: 'madness_value') int madnessValue,
      @JsonKey(name: 'max_madness_value') int maxMadnessValue});
}

/// @nodoc
class _$PlayerSessionCopyWithImpl<$Res, $Val extends PlayerSession>
    implements $PlayerSessionCopyWith<$Res> {
  _$PlayerSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? campaignName = null,
    Object? madnessValue = null,
    Object? maxMadnessValue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      campaignName: null == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      madnessValue: null == madnessValue
          ? _value.madnessValue
          : madnessValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxMadnessValue: null == maxMadnessValue
          ? _value.maxMadnessValue
          : maxMadnessValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerSessionImplCopyWith<$Res>
    implements $PlayerSessionCopyWith<$Res> {
  factory _$$PlayerSessionImplCopyWith(
          _$PlayerSessionImpl value, $Res Function(_$PlayerSessionImpl) then) =
      __$$PlayerSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'campaign_name') String campaignName,
      @JsonKey(name: 'madness_value') int madnessValue,
      @JsonKey(name: 'max_madness_value') int maxMadnessValue});
}

/// @nodoc
class __$$PlayerSessionImplCopyWithImpl<$Res>
    extends _$PlayerSessionCopyWithImpl<$Res, _$PlayerSessionImpl>
    implements _$$PlayerSessionImplCopyWith<$Res> {
  __$$PlayerSessionImplCopyWithImpl(
      _$PlayerSessionImpl _value, $Res Function(_$PlayerSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? campaignName = null,
    Object? madnessValue = null,
    Object? maxMadnessValue = null,
  }) {
    return _then(_$PlayerSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      campaignName: null == campaignName
          ? _value.campaignName
          : campaignName // ignore: cast_nullable_to_non_nullable
              as String,
      madnessValue: null == madnessValue
          ? _value.madnessValue
          : madnessValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxMadnessValue: null == maxMadnessValue
          ? _value.maxMadnessValue
          : maxMadnessValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerSessionImpl
    with DiagnosticableTreeMixin
    implements _PlayerSession {
  const _$PlayerSessionImpl(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'campaign_name') required this.campaignName,
      @JsonKey(name: 'madness_value') required this.madnessValue,
      @JsonKey(name: 'max_madness_value') required this.maxMadnessValue});

  factory _$PlayerSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerSessionImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'campaign_name')
  final String campaignName;
  @override
  @JsonKey(name: 'madness_value')
  final int madnessValue;
  @override
  @JsonKey(name: 'max_madness_value')
  final int maxMadnessValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayerSession(id: $id, createdAt: $createdAt, campaignName: $campaignName, madnessValue: $madnessValue, maxMadnessValue: $maxMadnessValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayerSession'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('campaignName', campaignName))
      ..add(DiagnosticsProperty('madnessValue', madnessValue))
      ..add(DiagnosticsProperty('maxMadnessValue', maxMadnessValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.madnessValue, madnessValue) ||
                other.madnessValue == madnessValue) &&
            (identical(other.maxMadnessValue, maxMadnessValue) ||
                other.maxMadnessValue == maxMadnessValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, campaignName, madnessValue, maxMadnessValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerSessionImplCopyWith<_$PlayerSessionImpl> get copyWith =>
      __$$PlayerSessionImplCopyWithImpl<_$PlayerSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerSessionImplToJson(
      this,
    );
  }
}

abstract class _PlayerSession implements PlayerSession {
  const factory _PlayerSession(
      {required final int id,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'campaign_name') required final String campaignName,
      @JsonKey(name: 'madness_value') required final int madnessValue,
      @JsonKey(name: 'max_madness_value')
      required final int maxMadnessValue}) = _$PlayerSessionImpl;

  factory _PlayerSession.fromJson(Map<String, dynamic> json) =
      _$PlayerSessionImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'campaign_name')
  String get campaignName;
  @override
  @JsonKey(name: 'madness_value')
  int get madnessValue;
  @override
  @JsonKey(name: 'max_madness_value')
  int get maxMadnessValue;
  @override
  @JsonKey(ignore: true)
  _$$PlayerSessionImplCopyWith<_$PlayerSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
