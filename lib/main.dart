import 'package:flutter/material.dart';

import 'components/filter.dart';
import 'components/search_bar.dart';
import 'components/slide_section.dart';
import 'components/ticket_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color(0xffEB1956)).copyWith(
          secondary: const Color(0xff1A153A),
        ),
        fontFamily: "Inter",
        appBarTheme: Theme.of(context)
            .appBarTheme
            .copyWith(foregroundColor: Colors.black),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("DISCOVER SHOWS"),
        bottom: CustomSearchBar(
          onFilter: (context) {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const FilterBottomSheet(),
                    ));
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SlideSection(),
          Center(
            child: TicketDetail(),
          ),
          Center(
            child: Text("Favorites"),
          ),
          Center(
            child: Text("Account"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _tabController.index,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.blue),
        onTap: (index) {
          setState(() {
            _tabController.animateTo(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplane_ticket,
            ),
            label: "Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
//
