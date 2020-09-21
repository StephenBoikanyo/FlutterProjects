import 'package:flutter/material.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brewcrew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/screens/home/brew_list.dart';
import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/screens/home/settings_form.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: SettingsFrom());
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text("Brew Crew"),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text("Settings"))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
