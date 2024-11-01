import 'package:ai_bot_test/DrawerPages/About.dart';
import 'package:ai_bot_test/DrawerPages/Settings.dart';
import 'package:ai_bot_test/DrawerPages/Privarcy.dart';
import 'package:ai_bot_test/DrawerPages/Help.dart';
import 'package:ai_bot_test/DrawerPages/Login.dart';
import 'package:ai_bot_test/DrawerPages/Logout.dart';
import 'package:flutter/material.dart';
import 'package:ai_bot_test/DrawerPages/Profile.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Sheyma'),
            accountEmail: const Text('sheyma@gmail.com'),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                  'https://www.flaticon.com/free-icon/avatar_6858504'),
            )),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://www.flaticon.com/free-icon/avatar_6858504'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ));
              }),
          ListTile(
              leading: Icon(Icons.lock),
              title: Text('Gizlilik'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PrivarcyPage(),
                ));
              }),
          ListTile(
              leading: Icon(Icons.help),
              title: Text('Yardım'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HelpPage(),
                ));
              }),
          ListTile(
              leading: Icon(Icons.info),
              title: Text('Hakkında'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ));
              }),
          ListTile(
              leading: Icon(Icons.login),
              title: Text('Giriş Yap'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              }),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Çıkış Yap'),
              iconColor: Colors.green,
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LogoutPage(),
                ));
              }),
        ],
        //Hello World im sheyma
      ),
    );
  }
}
