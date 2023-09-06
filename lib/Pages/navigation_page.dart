import 'package:flutter/material.dart';
import 'package:flutter_material_components_v1/Pages/add_event_page.dart';
import 'package:flutter_material_components_v1/Pages/bookings_page.dart';
import 'package:flutter_material_components_v1/Pages/events_page.dart';
import 'package:flutter_material_components_v1/Pages/profile_page.dart';
import 'package:flutter_material_components_v1/Pages/search_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<NavigationPage> {
  int currentPageIndex = 0;
  final screens = [
    const EventsPage(),
    const SearchPage(),
    const SizedBox.shrink(),
    const BookingsPage(),
    const ProfilePage(),
  ];

  Future _showAddBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 146,
        width: 400,
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                height: 5, // Adjust the height as needed
                width: 30, // Adjust the width as needed
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .outlineVariant, // Change the color as needed
                  borderRadius: BorderRadius.circular(
                      20), // Adjust the border radius to make it more or less rounded
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onBackground,
                  textStyle: Theme.of(context).textTheme.titleMedium),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 26),
                      child: Text(
                        "Add an Organization",
                      ),
                    )
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddEventPage()),
                );
              },
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onBackground,
                  textStyle: Theme.of(context).textTheme.titleMedium),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.event,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 26),
                      child: Text(
                        "New Event",
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        onDestinationSelected: (int index) {
          if (index == 2) {
            // Show bottom sheet when "Add" button is pressed
            _showAddBottomSheet(context);
          } else {
            setState(() {
              currentPageIndex = index;
            });
          }
        },
        indicatorColor: Theme.of(context).colorScheme.secondaryContainer,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add),
            icon: Icon(Icons.add),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.menu_book),
            icon: Icon(Icons.menu_book_outlined),
            label: 'Bookings',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
