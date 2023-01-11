import 'package:cloud_firestore/cloud_firestore.dart';

class JournalEntry{
  final String title;
  final DateTime date;
  final String contents;

  JournalEntry(this.title, this.date, this.contents);

  static JournalEntry fromJson(Map<String, dynamic> json) => JournalEntry(
        json['title'],
        (json['date'] as Timestamp).toDate(),
        json['contents'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date,
        'contents': contents,
      };
}

class NewJournalEntry{
  String? title;
  DateTime? date;
  String? contents;

  NewJournalEntry();

  JournalEntry SaveToJournal() => JournalEntry(title!, date!, contents!);
}