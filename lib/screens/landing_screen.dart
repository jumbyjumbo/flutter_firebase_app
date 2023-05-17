import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import '../utils/logo.dart';

//handle page view
final _pageController = PageController(initialPage: 1);
//click pages
final pageView = PageView(
  scrollDirection: Axis.horizontal,
  controller: _pageController,
  children: [
    GridView.count(
      crossAxisCount: 4,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Card(
          color: Colors.blue,
          child: Center(
            child: Text(
              'upgrade $index',
            ),
          ),
        );
      }),
    ),
    Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton.large(
                  onPressed: () {
                    print('click');
                  },
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: FloatingActionButton.large(
                  onPressed: () {
                    print('click');
                  },
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    GridView.count(
      crossAxisCount: 4,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Card(
          color: Colors.yellow,
          child: Center(
            child: Text(
              'upgrade $index',
            ),
          ),
        );
      }),
    ),
  ],
);

//list of pages for navigation bar
final List<Widget> pageList = [
  Container(
      alignment: Alignment.center,
      child: GridView.count(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return Container(
            color: white,
            alignment: Alignment.center,
            child: Center(
              child: Text(
                'Item $index',
              ),
            ),
          );
        }),
      )),
  pageView,
  Container(
    alignment: Alignment.center,
    child: const Text('profile',
        style:
            TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 70)),
  ),
];

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  //page index for navigation bar
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top nav bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25.0), // here the desired height
        child: Container(
          color: Colors.transparent,
          child: const Center(child: Text('My Custom AppBar')),
        ),
      ),

      //main body
      body: pageList[currentPageIndex],

      //bottom nav bar
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.transparent,
        destinations: const [
          //home button
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: white,
              size: 32,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: white,
              size: 32,
            ),
            label: 'home',
          ),

          //click button
          NavigationDestination(
            icon: Logo(height: 32),
            label: 'click',
          ),

          //profile button
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: white,
              size: 32,
            ),
            icon: Icon(
              Icons.person_outline,
              color: white,
              size: 32,
            ),
            label: 'profile',
          )
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
