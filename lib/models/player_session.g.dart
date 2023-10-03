// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerSessionImpl _$$PlayerSessionImplFromJson(Map<String, dynamic> json) =>
    _$PlayerSessionImpl(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      campaignName: json['campaign_name'] as String,
      madnessValue: json['madness_value'] as int,
      maxMadnessValue: json['max_madness_value'] as int,
    );

Map<String, dynamic> _$$PlayerSessionImplToJson(_$PlayerSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'campaign_name': instance.campaignName,
      'madness_value': instance.madnessValue,
      'max_madness_value': instance.maxMadnessValue,
    };
