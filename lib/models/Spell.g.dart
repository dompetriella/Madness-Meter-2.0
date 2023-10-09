// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Spell _$$_SpellFromJson(Map<String, dynamic> json) => _$_Spell(
      createdAt: DateTime.parse(json['created_at'] as String),
      spellName: json['spell_name'] as String,
      description: json['description'] as String,
      spellType: json['spell_type'] as int,
      availableCampaigns: (json['available_campaigns'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_SpellToJson(_$_Spell instance) => <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'spell_name': instance.spellName,
      'description': instance.description,
      'spell_type': instance.spellType,
      'available_campaigns': instance.availableCampaigns,
    };
