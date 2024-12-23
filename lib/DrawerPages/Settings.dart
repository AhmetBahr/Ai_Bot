import 'package:ai_bot_test/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  final String appbarString = 'Ayarlar';
  final String ThemeString = 'Theme';

  @override
  State<SettingsPage> createState() => _settingsPage();
}

class _settingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.appbarString,
          style: const TextStyle(
            fontFamily: 'SemiJoined',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              ListTile(
                title: Text(
                  widget.ThemeString,
                  style: const TextStyle(
                    fontFamily: 'SemiJoined',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //color: Colors.black,
                  ),
                ),
                trailing: Switch(
                  activeColor: Colors.green[400],
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.transparent,
                  value: ThemeProvider.isSelected,
                  onChanged: (value) {
                    ThemeProvider.toggleTheme();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
