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
        home: new FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              default:
                if (!snapshot.hasError) {
                  return snapshot.data.getBool("welcome") != null
                      ? new HomeController()
                      : new OnBoardingPage();
                } else {
                  print(snapshot.error);
                  return new Scaffold(
                    body: Center(
                      child: Text(snapshot.error),
                    ),
                  );
                }
            }
          },
        ),
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
