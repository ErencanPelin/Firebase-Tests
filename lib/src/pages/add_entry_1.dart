import 'package:flutter/material.dart';
import 'package:pillowjournal/src/data/journal_entry.dart';
import 'package:pillowjournal/src/pages/add_entry_2.dart';
import 'package:pillowjournal/src/pages/routes/route.dart';

class AddEntry1 extends StatefulWidget {
  final NewJournalEntry newEntry;

  const AddEntry1({super.key, required this.newEntry});

  @override
  State<AddEntry1> createState() => _AddEntry1();
}

class _AddEntry1 extends State<AddEntry1> {
  int value = -1;
  Widget customRadioButton(String text, int index) {
    return SizedBox(
      height: 70,
      width: 90,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(100, 40, 165, 255)),
          backgroundColor: MaterialStateProperty.all<Color>((value == index)
              ? Colors.blue.withOpacity(0.25)
              : Colors.transparent),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                    color: (value == index)
                        ? Colors.blue.withOpacity(0.5)
                        : Theme.of(context).iconTheme.color!.withOpacity(0.2),
                    width: 3,
                    strokeAlign: StrokeAlign.inside)),
          ),
        ),
        onPressed: () {
          setState(() {
            value = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image(
              image: AssetImage('assets/icons/$text'), fit: BoxFit.fitHeight),
        ),
      ),
    );
  }

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
                      'Today I feel...',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customRadioButton('cloud-computing.png', 0),
                      customRadioButton('contrast.png', 1),
                      customRadioButton('ice-storm.png', 2),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            (value != -1)
                                ? const Color.fromARGB(135, 172, 234, 101)
                                : const Color.fromARGB(175, 62, 174, 254)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            (value != -1)
                                ? const Color.fromARGB(255, 139, 195, 74)
                                : Colors.blue),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: (value != -1)
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
                          Text((value != -1) ? 'Next' : "Skip"),
                          Icon(
                              (value != -1) ? Icons.check : Icons.fast_forward),
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

  void nextView(BuildContext context) {
    //apply to journal entry

    //load next view
    Navigator.of(context).push(
        Routes.createHorizontalRoute(AddEntry2(newEntry: widget.newEntry)));
  }
}
