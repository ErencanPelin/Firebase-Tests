import 'package:flutter/material.dart';
import 'package:pillowjournal/src/data/journal_entry.dart';

class ViewEntryWidget extends StatelessWidget {
  final JournalEntry entry;

  const ViewEntryWidget({super.key, required this.entry});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(entry.title),
        ),
      );
}
