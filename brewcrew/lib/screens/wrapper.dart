import 'package:brewcrew/screens/authenticate/authenticate.dart';
import 'package:brewcrew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //accessing user data from provider
    final user = Provider.of<User>(context);

    //return home or authenticate on authstate
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
