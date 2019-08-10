import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viva_aranzazu/injection_container.dart';
import 'package:viva_aranzazu/services/auth_service.dart';
import 'package:viva_aranzazu/widgets/authentication/login.dart';
import 'package:viva_aranzazu/widgets/authentication/provider.dart';
import 'package:viva_aranzazu/widgets/authentication/signup.dart';
import 'package:viva_aranzazu/widgets/dashboard_page.dart';
import 'package:viva_aranzazu/widgets/onboarding.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      authService: AuthService(),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) => new RegisterPage(),
          '/home': (BuildContext context) => new DashboardPage()
        },
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.red.shade600,
          accentColor: Colors.redAccent.shade400,
        ),
//      home: LoginPage(),
        home: HomeController(),
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider
        .of(context)
        .authService;
    return StreamBuilder(
        stream: authService.onAuthStateChanged,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool signedIn = snapshot.hasData;
            return signedIn ? DashboardPage() : LoginPage();
          }
          return CircularProgressIndicator();
        });
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LoginPage()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnBoardingPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 20), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
