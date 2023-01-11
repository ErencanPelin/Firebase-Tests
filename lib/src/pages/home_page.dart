import 'dart:ui';

import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:pillowjournal/src/data/journal_entry.dart';
import 'package:pillowjournal/src/pages/achievements.dart';
import 'package:pillowjournal/src/pages/notifications.dart';
import 'package:pillowjournal/src/pages/routes/route.dart';
import 'package:pillowjournal/src/pages/add_entry_1.dart';
import 'package:pillowjournal/src/pages/calendar_widget.dart';
import 'package:pillowjournal/src/pages/profile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  static final _widgetOptions = <Widget>[
    const CalendarWidget(), //calendar page
    ProfileWidget(), //profile page
    NotificationsWidget(), //achievements page
    AchievementWidget(), //achievements page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Image.asset(
            "assets/images/day.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              shadowColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            extendBody: true,
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: FluidNavBar(
              animationFactor: 0.5,
              style: FluidNavBarStyle(
                barBackgroundColor:
                    Theme.of(context).appBarTheme.backgroundColor,
                iconUnselectedForegroundColor: Theme.of(context).disabledColor,
                iconSelectedForegroundColor: Theme.of(context).focusColor,
              ), // (1)
              icons: [
                // (2)
                FluidNavBarIcon(
                    icon: Icons.home,
                    unselectedForegroundColor:
                        Theme.of(context).iconTheme.color),
                FluidNavBarIcon(
                    icon: Icons.person,
                    unselectedForegroundColor:
                        Theme.of(context).iconTheme.color),
                FluidNavBarIcon(
                    icon: Icons.notifications,
                    unselectedForegroundColor:
                        Theme.of(context).iconTheme.color),
                FluidNavBarIcon(
                    icon: Icons.emoji_events,
                    unselectedForegroundColor:
                        Theme.of(context).iconTheme.color)
              ],
              onChange: (index) => _onItemTapped(index),
            ),
            floatingActionButton: FloatingActionButton(
              child: Text("New"),
              onPressed: () {
                Navigator.of(context).push(Routes.createVerticalRoute(AddEntry1(
                  newEntry: NewJournalEntry(),
                )));
              },
            ),
          ),
        ],
      );
}
