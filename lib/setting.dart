import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sound',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Enable sound effects'),
              value: _soundEnabled,
              onChanged: (bool value) {
                setState(() {
                  _soundEnabled = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Vibration',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SwitchListTile(
              title: Text('Enable vibration'),
              value: _vibrationEnabled,
              onChanged: (bool value) {
                setState(() {
                  _vibrationEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
