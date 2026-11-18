import 'package:flutter/material.dart';
import 'cv_screen.dart';
import 'family_screen.dart';
import 'contact_screen.dart';
import 'login_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    CvScreen(),
    FamilyScreen(),
    ContactScreen(),
  ];

  final List<String> _titles = const [
    'Mon CV',
    'Ma Famille',
    'Contact',
  ];

  void _onSelectTab(int index) {
    setState(() => _currentIndex = index);
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.logout_rounded, color: Colors.redAccent),
            SizedBox(width: 10),
            Text('Déconnexion'),
          ],
        ),
        content: const Text('Souhaitez-vous vous déconnecter de l\'application ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('Déconnexion'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Se déconnecter',
            onPressed: _confirmLogout,
          ),
        ],
      ),

      // Menu latéral Drawer
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary,
                    colorScheme.primaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 34,
                  backgroundColor: colorScheme.primaryContainer,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.jpg',
                      width: 68,
                      height: 68,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              accountName: const Text(
                'YABEZE GIFT LOM',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              accountEmail: const Text('gjabets@gmail.com'),
            ),
            ListTile(
              leading: Icon(
                Icons.person_outline_rounded,
                color: _currentIndex == 0 ? colorScheme.primary : null,
              ),
              title: const Text('Mon CV'),
              selected: _currentIndex == 0,
              onTap: () {
                _onSelectTab(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.people_outline_rounded,
                color: _currentIndex == 1 ? colorScheme.primary : null,
              ),
              title: const Text('Ma Famille'),
              selected: _currentIndex == 1,
              onTap: () {
                _onSelectTab(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_mail_outlined,
                color: _currentIndex == 2 ? colorScheme.primary : null,
              ),
              title: const Text('Mes Coordonnées'),
              selected: _currentIndex == 2,
              onTap: () {
                _onSelectTab(2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
              title: const Text(
                'Se déconnecter',
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
                _confirmLogout();
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),

      // Page active
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      // Barre de navigation inférieure
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onSelectTab,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Accueil (CV)',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_rounded),
            label: 'Famille',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_phone_outlined),
            selectedIcon: Icon(Icons.contact_phone_rounded),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
