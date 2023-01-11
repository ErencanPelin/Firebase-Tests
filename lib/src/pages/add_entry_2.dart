import 'package:flutter/material.dart';
import 'package:pillowjournal/src/data/journal_entry.dart';
import 'package:pillowjournal/src/pages/add_entry_3.dart';
import 'package:pillowjournal/src/pages/routes/route.dart';

class AddEntry2 extends StatefulWidget {
  final NewJournalEntry newEntry;

  const AddEntry2({super.key, required this.newEntry});

  @override
  State<AddEntry2> createState() => _AddEntry2();
}

class _AddEntry2 extends State<AddEntry2> {
  final entry1Controller = TextEditingController();
  final entry2Controller = TextEditingController();

  @override
  void dispose() {
    entry1Controller.dispose();
    entry2Controller.dispose();
    super.dispose();
  }

  Widget customTextField(
          String prefixLabel, TextEditingController thisController,
          [bool? isEnabled]) =>
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(prefixLabel),
        Expanded(
            child: TextField(
          controller: thisController,
          enabled: isEnabled,
          textInputAction: TextInputAction.next,
          onChanged: (value) => setState(() {}),
          maxLength: 25,
          decoration: const InputDecoration(
            isDense: true,
          ),
        )),
      ]);

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '2 things I\'m stressed about :',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customTextField('1. ', entry1Controller),
                      customTextField('2. ', entry2Controller,
                          entry1Controller.text.trim().isNotEmpty),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(isNext()
                            ? const Color.fromARGB(135, 172, 234, 101)
                            : const Color.fromARGB(175, 62, 174, 254)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            isNext()
                                ? const Color.fromARGB(255, 139, 195, 74)
                                : Colors.blue),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: isNext()
                                      ? Colors.lightGreen
                                      : Colors.blue,
                                  width: 3,
                                  strokeAlign: StrokeAlign.inside)),
                        ),
                      ),
                      onPressed: () => nextView(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(isNext() ? 'Next' : "Skip"),
                          Icon(isNext() ? Icons.check : Icons.fast_forward),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  bool isNext() => entry1Controller.text.trim().isNotEmpty;

  void nextView(BuildContext context) {
    //apply the journal entry

    //load next view
    Navigator.of(context).push(
        Routes.createHorizontalRoute(AddEntry3(newEntry: widget.newEntry)));
  }
}
