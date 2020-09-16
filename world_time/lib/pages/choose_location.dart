import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  // int counter = 0;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Choose a Location"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[500],
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          },
        ));
  }
}

/**
 * FlatButton(
    onPressed: () {
    setState(() {
    counter += 1;
    });
    },
    child: Text("Wassup you pressed $counter times"))
 **/
/**
    void getData() async {
    //simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
    return 'Nambitha';
    });

    String bio = await Future.delayed(Duration(seconds: 3), () {
    return 'Bcom Accounting , Awesome Girlfriend';
    });

    print('Hello $username ,here are your attributes $bio');
    }

    @override
    void initState() {
    super.initState();
    getData();
    print('I am learning stuff actually');
    }
    **/
