// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Spell _$SpellFromJson(Map<String, dynamic> json) {
  return _Spell.fromJson(json);
}

/// @nodoc
mixin _$Spell {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'spell_name')
  String get spellName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'spell_type')
  int get spellType => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_campaigns')
  List<int> get availableCampaigns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpellCopyWith<Spell> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpellCopyWith<$Res> {
  factory $SpellCopyWith(Spell value, $Res Function(Spell) then) =
      _$SpellCopyWithImpl<$Res, Spell>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'spell_name') String spellName,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'spell_type') int spellType,
      @JsonKey(name: 'available_campaigns') List<int> availableCampaigns});
}

/// @nodoc
class _$SpellCopyWithImpl<$Res, $Val extends Spell>
    implements $SpellCopyWith<$Res> {
  _$SpellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? spellName = null,
    Object? description = null,
    Object? spellType = null,
    Object? availableCampaigns = null,
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
      spellName: null == spellName
          ? _value.spellName
          : spellName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      spellType: null == spellType
          ? _value.spellType
          : spellType // ignore: cast_nullable_to_non_nullable
              as int,
      availableCampaigns: null == availableCampaigns
          ? _value.availableCampaigns
          : availableCampaigns // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpellCopyWith<$Res> implements $SpellCopyWith<$Res> {
  factory _$$_SpellCopyWith(_$_Spell value, $Res Function(_$_Spell) then) =
      __$$_SpellCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'spell_name') String spellName,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'spell_type') int spellType,
      @JsonKey(name: 'available_campaigns') List<int> availableCampaigns});
}

/// @nodoc
class __$$_SpellCopyWithImpl<$Res> extends _$SpellCopyWithImpl<$Res, _$_Spell>
    implements _$$_SpellCopyWith<$Res> {
  __$$_SpellCopyWithImpl(_$_Spell _value, $Res Function(_$_Spell) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? spellName = null,
    Object? description = null,
    Object? spellType = null,
    Object? availableCampaigns = null,
  }) {
    return _then(_$_Spell(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      spellName: null == spellName
          ? _value.spellName
          : spellName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      spellType: null == spellType
          ? _value.spellType
          : spellType // ignore: cast_nullable_to_non_nullable
              as int,
      availableCampaigns: null == availableCampaigns
          ? _value._availableCampaigns
          : availableCampaigns // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Spell with DiagnosticableTreeMixin implements _Spell {
  const _$_Spell(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'spell_name') required this.spellName,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'spell_type') required this.spellType,
      @JsonKey(name: 'available_campaigns')
      required final List<int> availableCampaigns})
      : _availableCampaigns = availableCampaigns;

  factory _$_Spell.fromJson(Map<String, dynamic> json) =>
      _$$_SpellFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'spell_name')
  final String spellName;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'spell_type')
  final int spellType;
  final List<int> _availableCampaigns;
  @override
  @JsonKey(name: 'available_campaigns')
  List<int> get availableCampaigns {
    if (_availableCampaigns is EqualUnmodifiableListView)
      return _availableCampaigns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCampaigns);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Spell(id: $id, createdAt: $createdAt, spellName: $spellName, description: $description, spellType: $spellType, availableCampaigns: $availableCampaigns)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Spell'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('spellName', spellName))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('spellType', spellType))
      ..add(DiagnosticsProperty('availableCampaigns', availableCampaigns));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Spell &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.spellName, spellName) ||
                other.spellName == spellName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.spellType, spellType) ||
                other.spellType == spellType) &&
            const DeepCollectionEquality()
                .equals(other._availableCampaigns, _availableCampaigns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      spellName,
      description,
      spellType,
      const DeepCollectionEquality().hash(_availableCampaigns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpellCopyWith<_$_Spell> get copyWith =>
      __$$_SpellCopyWithImpl<_$_Spell>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpellToJson(
      this,
    );
  }
}

abstract class _Spell implements Spell {
  const factory _Spell(
      {required final int id,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'spell_name') required final String spellName,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'spell_type') required final int spellType,
      @JsonKey(name: 'available_campaigns')
      required final List<int> availableCampaigns}) = _$_Spell;

  factory _Spell.fromJson(Map<String, dynamic> json) = _$_Spell.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'spell_name')
  String get spellName;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'spell_type')
  int get spellType;
  @override
  @JsonKey(name: 'available_campaigns')
  List<int> get availableCampaigns;
  @override
  @JsonKey(ignore: true)
  _$$_SpellCopyWith<_$_Spell> get copyWith =>
      throw _privateConstructorUsedError;
}
