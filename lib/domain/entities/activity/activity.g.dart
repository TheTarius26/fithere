// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) => Activity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      locationAddress: json['locationAddress'] as String,
      locationPoint: json['locationPoint'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      maxParticipants: json['maxParticipants'] as int,
      currentParticipants: json['currentParticipants'] as int,
      price: json['price'] as int,
      creatorId: json['creatorId'] as String,
      creatorName: json['creatorName'] as String,
      creatorImageUrl: json['creatorImageUrl'] as String,
    );

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'locationAddress': instance.locationAddress,
      'locationPoint': instance.locationPoint,
      'dateTime': instance.dateTime.toIso8601String(),
      'maxParticipants': instance.maxParticipants,
      'currentParticipants': instance.currentParticipants,
      'price': instance.price,
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'creatorImageUrl': instance.creatorImageUrl,
    };
