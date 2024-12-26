import 'package:ai_bot_test/DrawerPages/Settings.dart';

import 'package:ai_bot_test/Service/asset_manager.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final Color drawerBackgroundColor =
        Theme.of(context).appBarTheme.backgroundColor ?? Colors.green;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'User',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge, // Tema renklerini kullan
            ),
            accountEmail: Text(
              'User@gmail.com',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium, // Tema renklerini kullan
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  AssetsManager.userImage, // Yerel avatar resmi
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: drawerBackgroundColor, // Tema rengini kullan
            ),
          ),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ));
              }),
          // ListTile(
          //     leading: const Icon(Icons.lock),
          //     title: const Text('Gizlilik'),
          //     iconColor: Colors.green,
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const PrivarcyPage(),
          //       ));
          //     }),
          // ListTile(
          //     leading: const Icon(Icons.help),
          //     title: const Text('Yardım'),
          //     iconColor: Colors.green,
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const HelpPage(),
          //       ));
          //     }),
          // ListTile(
          //     leading: const Icon(Icons.info),
          //     title: const Text('Hakkında'),
          //     iconColor: Colors.green,
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const AboutPage(),
          //       ));
          //     }),
          // ListTile(
          //     leading: const Icon(Icons.login),
          //     title: const Text('Giriş Yap'),
          //     iconColor: Colors.green,
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const LoginPage(),
          //       ));
          //     }),
          // ListTile(
          //     leading: const Icon(Icons.logout),
          //     title: const Text('Çıkış Yap'),
          //     iconColor: Colors.green,
          //     onTap: () {
          //       Navigator.pop(context);
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => const LogoutPage(),
          //       ));
          //     }),
        ],
        //Hello World im sheyma
      ),
    );
  }
}
