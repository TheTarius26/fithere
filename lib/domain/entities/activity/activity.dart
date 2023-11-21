// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity {
  Activity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.locationAddress,
    required this.locationPoint,
    required this.dateTime,
    required this.maxParticipants,
    required this.currentParticipants,
    required this.price,
    required this.creatorId,
    required this.creatorName,
    required this.creatorImageUrl,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String locationAddress;
  final String locationPoint;
  final DateTime dateTime;
  final int maxParticipants;
  final int currentParticipants;
  final int price;
  final String creatorId;
  final String creatorName;
  final String creatorImageUrl;

  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  Activity copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? locationAddress,
    String? locationPoint,
    DateTime? dateTime,
    int? maxParticipants,
    int? currentParticipants,
    int? price,
    String? creatorId,
    String? creatorName,
    String? creatorImageUrl,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      locationAddress: locationAddress ?? this.locationAddress,
      locationPoint: locationPoint ?? this.locationPoint,
      dateTime: dateTime ?? this.dateTime,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      currentParticipants: currentParticipants ?? this.currentParticipants,
      price: price ?? this.price,
      creatorId: creatorId ?? this.creatorId,
      creatorName: creatorName ?? this.creatorName,
      creatorImageUrl: creatorImageUrl ?? this.creatorImageUrl,
    );
  }
}
