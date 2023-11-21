// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.bio,
    required this.activities,
    this.password = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String id;
  final String name;
  final String email;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String password;
  final String imageUrl;
  final String bio;
  final List<String> activities;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
    String? bio,
    List<String>? activities,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      bio: bio ?? this.bio,
      activities: activities ?? this.activities,
    );
  }
}
