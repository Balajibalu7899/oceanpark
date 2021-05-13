import 'package:flutter/material.dart';
import 'package:ocean_park/pages/main/CartPage.dart';
import 'package:ocean_park/pages/main/HomePage.dart';
import 'package:ocean_park/pages/main/OrdersPage.dart';
import 'package:ocean_park/pages/main/ProductPage.dart';
import 'package:ocean_park/pages/main/ProfilePage.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  int _activePageIndex = 0;
  final List _pages = [
    HomePage(),
    ProductPage(),
    OrdersPage(),
    ProfilePage(),
  ];

  void changePage(int index) {
    setState(() {
      _activePageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_activePageIndex],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: changePage,
          currentIndex: _activePageIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).textTheme.headline1!.color,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.business_center_rounded),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.local_grocery_store_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CartPage();
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
