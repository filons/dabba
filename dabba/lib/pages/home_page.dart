import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dabba/pages/nouveau_accueil.dart';
import 'package:dabba/pages/alertes.dart';
import 'package:dabba/pages/stocks.dart';
import 'package:dabba/pages/assistant.dart';
import 'package:dabba/pages/communaute.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AccueilContent(),
    const MyAlertesPage(),
    const MyAssistantPage(),
    const MyStocksPage(),
    const MyCommunautePage(),
  ];

  final List<NavigationDestination> _destinations = [
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.chartLine, size: 20),
      selectedIcon: Icon(FontAwesomeIcons.chartLine, size: 20),
      label: 'Accueil',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.bell, size: 20),
      selectedIcon: Icon(FontAwesomeIcons.solidBell, size: 20),
      label: 'Alertes',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.circleQuestion, size: 20),
      selectedIcon: Icon(FontAwesomeIcons.solidCircleQuestion, size: 20),
      label: 'Assistant',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.warehouse, size: 20),
      selectedIcon: Icon(FontAwesomeIcons.warehouse, size: 20),
      label: 'Stocks',
    ),
    NavigationDestination(
      icon: Icon(FontAwesomeIcons.userGroup, size: 20),
      selectedIcon: Icon(FontAwesomeIcons.userGroup, size: 20),
      label: 'Communauté',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DABBA'),
        elevation: 18,
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: theme.colorScheme.primary.withOpacity(0.5),
              child: const Icon(FontAwesomeIcons.user),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _destinations,
      ),
    );
  }
}
