import 'package:flutter/material.dart';
import 'package:mygardenapp/provider/dark_theme_provider.dart';
import 'package:mygardenapp/screens/home_screen.dart';
import 'package:mygardenapp/screens/carts.dart';
import 'package:mygardenapp/screens/categories.dart';
import 'package:mygardenapp/screens/users.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectIndex = 0;
  final List<Map<String, dynamic>> _pagesIndex = [
    {'page': HomeScreen(), 'title': 'HomePage'},
    {'page': CartScreen(), 'title': 'Cart for your Buy'},
    {'page': CategoriesScreen(), 'title': 'Category of Vegetable'},
    {'page': UserScreen(), 'title': 'User'}
  ];

  // create select page function
  void _selectIndexPage(int index) {
    setState(() {
      selectIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pagesIndex[selectIndex]['title']),
      // ),
      body: _pagesIndex[selectIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        onTap: _selectIndexPage,
        currentIndex: selectIndex,
        unselectedItemColor: _isDark ? Colors.grey : Colors.black26,
        selectedItemColor: _isDark ? Colors.lightGreenAccent.shade200 : Colors.lightBlue,
        backgroundColor: _isDark ? Colors.grey : Colors.grey[20],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(selectIndex == 0 ? IconlyBold.home : IconlyLight.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(selectIndex == 1 ? IconlyBold.buy : IconlyLight.buy),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(selectIndex == 2 ? IconlyBold.category : IconlyLight.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(selectIndex == 3 ? IconlyBold.user3 : IconlyLight.user3),label: "User"),
        ],
      ),

    );
  }
}
