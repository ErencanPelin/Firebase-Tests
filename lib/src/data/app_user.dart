import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String id;
  final String f_name;
  final DateTime accCreationDate;

  AppUser(this.id, this.f_name, this.accCreationDate);

  static AppUser fromJson(Map<String, dynamic> json) => AppUser(
        json['id'],
        json['f_name'],
        (json['accCreationDate'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'f_name': f_name,
        'accCreationDate': accCreationDate,
      };
}