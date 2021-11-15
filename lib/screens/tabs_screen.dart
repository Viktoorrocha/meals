import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = ['Lista de Categorias', 'Meus favoritos'];

  final List<Widget> _screens = [CategoriesScreen(), FavoriteScreen()];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedScreenIndex]),
        ),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: _selectScreen,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedScreenIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: Text('Categorias'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                title: Text('Favoritos'),
              ),
            ]));
  }
}
