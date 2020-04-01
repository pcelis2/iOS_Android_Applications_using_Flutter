import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const String GITHUB_URL = "https://github.com/pcelis2";
const String PHONE_NUMBER = "tel:+1 323 485 1233";
const String EMAIL_ADDRESS =
    "mailto:pcelis2@toromail.csudh.edu?subject=Hello Pedro, I am emailing you using your App&body=Your Message";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const double FONT_SIZE_NAME = 40.0;
  static const double FONT_SIZE_JOB_TITLE = 20.0;
  static const double FONT_SIZE_BODY = 18.0;
  static const double FONT_SIZE_SUBBODY = 12.0;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      SystemChrome.setEnabledSystemUIOverlays([]);
    }

    @override
    void dispose() {
      // Add code before the super
      SystemChrome.restoreSystemUIOverlays();
    }

    String getStatus() {
      int day = DateTime.now().weekday;
      print(day);
      if (day == 1 || day == 3 || day == 4) {
        return "Available";
      } else
        return "Unavailable";
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade200,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 75.0,
                backgroundImage: AssetImage('images/DSC_0177.JPG'),
              ),
              Text(
                'Pedro Celis',
                style: TextStyle(
                  fontSize: FONT_SIZE_NAME,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'JUNIOR DEVELOPER',
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontFamily: 'Source Sans Pro',
                  fontSize: FONT_SIZE_JOB_TITLE,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.teal),
              ),
              Card(
                elevation: 20.0,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  onTap: () {
                    _launchCALL();
                  },
                  leading: Icon(
                    Icons.phone,
                    size: 30.0,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '(323) 485 1233',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro',
                      fontSize: FONT_SIZE_BODY,
                    ),
                  ),
                  subtitle: Text(
                    'Monday, Wednesday, Thursday',
                    style: TextStyle(
                      fontSize: FONT_SIZE_SUBBODY,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 20.0,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  onTap: () {
                    _launchEMAIL();
                  },
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                    size: 30.0,
                  ),
                  title: Text(
                    'pcelis2@toromail.csudh.edu',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: FONT_SIZE_BODY,
                    ),
                  ),
                  subtitle: Text(
                    'Anytime',
                    style: TextStyle(
                      fontSize: FONT_SIZE_SUBBODY,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 20.0,
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                    onTap: () {
                      _launchURL();
                    },
                    leading: Icon(
                      FontAwesomeIcons.github,
                      color: Colors.teal,
                      size: 30.0,
                    ),
                    title: Text(
                      'pcelis2',
                      style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontSize: FONT_SIZE_BODY,
                      ),
                    ),
                    subtitle: Text(
                      'Check out my repo!',
                      style: TextStyle(
                        fontSize: FONT_SIZE_SUBBODY,
                      ),
                    )),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(color: Colors.teal),
              ),
              Text(
                getStatus(),
                style: TextStyle(
                  color: Colors.teal.shade100,
                  fontFamily: 'Source Sans Pro',
                  fontSize: FONT_SIZE_JOB_TITLE,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchCALL() async {
  const url = PHONE_NUMBER;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchEMAIL() async {
  const url = EMAIL_ADDRESS;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL() async {
  const url = GITHUB_URL;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
