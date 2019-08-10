import 'package:flutter/material.dart';
import 'package:viva_aranzazu/widgets/authentication/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Viva',
                      style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Aranzazu',
                          style: TextStyle(
                              fontSize: 70.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '!',
                          style: TextStyle(
                              fontSize: 70.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      children: buildInputs(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(top: 25, left: 20),
                    child: InkWell(
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlue,
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        submit();
                      } else {
                        _autoValidate = true;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("You don't have any account?",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                    )),
                SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    textFields.add(
      TextFormField(
        onSaved: (value) => _email = value,
        validator: (value) => validateEmail(value),
        decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
              fontFamily: 'MontSerrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
    textFields.add(
      TextFormField(
        onSaved: (value) => _password = value,
        validator: (value) {
          if (value.isEmpty) return 'Please enter your password';
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
              fontFamily: 'MontSerrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
        obscureText: true,
      ),
    );
    return textFields;
  }

  void submit() async {
    final form = formKey.currentState;
    form.save();

    try {
      final authService = Provider
          .of(context)
          .authService;
      String uid =
      await authService.signInWithEmailAndPassword(_email, _password);
      print("Signed in with ID $uid");
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      print(e);
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return 'Please enter your email address';
    if (!regex.hasMatch(value))
      return 'Please enter a valid email.';
    else
      return null;
  }
}
