import 'package:flutter/material.dart';
import 'package:brewcrew/shared/constants.dart';

class SettingsFrom extends StatefulWidget {
  @override
  _SettingsFromState createState() => _SettingsFromState();
}

final _formKey = GlobalKey<FormState>();

final List<String> sugars = ['0', '1', '2', '3', '4'];
// form values
String _currentName;
String _currentSugars;
int _currentStrength;

class _SettingsFromState extends State<SettingsFrom> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: "Update name"),
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentSugars ?? '0',
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
            activeColor: Colors.brown,
          ),
          RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              }),
        ],
      ),
    );
  }
}
