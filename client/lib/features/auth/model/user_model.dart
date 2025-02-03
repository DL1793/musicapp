// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String id;
  final String timestamp;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.timestamp,
  });



  UserModel copyWith({
    String? name,
    String? email,
    String? id,
    String? timestamp,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'timestamp': timestamp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
      timestamp: map['timestamp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, id: $id, timestamp: $timestamp)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.id == id &&
      other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      id.hashCode ^
      timestamp.hashCode;
  }
}
