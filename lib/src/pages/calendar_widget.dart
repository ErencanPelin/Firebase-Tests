import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:pillowjournal/src/data/journal_entry.dart';
import 'package:pillowjournal/src/pages/routes/route.dart';
import 'package:pillowjournal/src/pages/view_entry_widget.dart';
import 'package:pillowjournal/src/utils/utils.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder(
      stream: readEntries(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Text('Failed to load something! ${snapshot.error}')));
        } else if (snapshot.hasData) {
          final entries = snapshot.data!;
          List<JournalEntry> j = entries;
          j.sort((a, b) => a.date.compareTo(b.date));
          return GroupedListView<dynamic, String>(
            elements: j,
            floatingHeader: false,
            useStickyGroupSeparators: true,
            order: GroupedListOrder.DESC,
            groupBy: (element) =>
                weeksBetween(DateTime(element.date.year, 1, 1), element.date)
                    .toString(),
            groupSeparatorBuilder: (String groupByValue) => Container(
              alignment: Alignment.centerLeft,
              height: 60,
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Text(
                'Week $groupByValue',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            itemBuilder: (context, dynamic element) => Padding(
              padding: const EdgeInsets.all(16),
              child: InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  Navigator.of(context).push(Routes.createVerticalRoute(ViewEntryWidget(entry: element)));
                },
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Utils.getDay(element.date.weekday)),
                          Text(Utils.formattedDate(element.date),
                              style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                      Text(
                        element.title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        element.contents,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });

  int weeksBetween(DateTime from, DateTime to) {
    from = DateTime.utc(from.year, from.month, from.day);
    to = DateTime.utc(to.year, to.month, to.day);
    return (to.difference(from).inDays / 7).ceil();
  }

  Stream<List<JournalEntry>> readEntries() => FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('data')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => JournalEntry.fromJson(doc.data()))
          .toList());
}
