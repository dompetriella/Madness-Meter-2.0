// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpellImpl _$$SpellImplFromJson(Map<String, dynamic> json) => _$SpellImpl(
      spellName: json['spellName'] as String,
      description: json['description'] as String,
      spellType: json['spellType'] as int,
    );

Map<String, dynamic> _$$SpellImplToJson(_$SpellImpl instance) =>
    <String, dynamic>{
      'spellName': instance.spellName,
      'description': instance.description,
      'spellType': instance.spellType,
    };
