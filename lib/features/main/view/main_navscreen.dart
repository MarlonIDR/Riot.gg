import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:riotgg/components/bottomnavbar/custom_bottom_navBar.dart';
import 'package:riotgg/features/main/pages/champion/view/champion_page.dart';
import 'package:riotgg/features/main/pages/home/view/home_page.dart';
import 'package:riotgg/features/main/pages/random_champion/View/random_champion_page.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  late final List<Widget> _screens;
  late final List<String> _nomeTelas;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _screens = [
      const HomePage(),
      const ChampionPage(),
      const RandomChampionPage(),
    ];
    _nomeTelas = [
      'Home',
      'Champions'
          'Random'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.blue,
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          animationCurve: Curves.linear,
          animationDuration: const Duration(milliseconds: 400),
          backgroundColor: Colors.green,
          buttonBackgroundColor: Colors.deepPurple,
          color: Colors.black,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          index: _currentIndex,
          items: const [
            Icon(
              Icons.house_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Icon(Icons.add, color: Colors.white),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            _nomeTelas[_currentIndex],
            style: const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: LazyIndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Tem certeza?',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              content: Text(
                'Deseja sair do aplicativo?',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              actions: [
                TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary)))),
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'Não',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Sim',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            );
          },
        )) ??
        false;
  }
}
