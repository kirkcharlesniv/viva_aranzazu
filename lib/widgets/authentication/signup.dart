import 'package:flutter/material.dart';
import 'package:viva_aranzazu/widgets/authentication/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password, _name;
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
                      'Hello',
                      style: TextStyle(
                          fontSize: 70.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'There',
                          style: TextStyle(
                              fontSize: 70.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '.',
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
                            "REGISTER",
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
                  )
                ],
              ),
            ),
          ],
        ));
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    textFields.add(
      TextFormField(
        onSaved: (value) => _name = value,
        validator: (value) => validateName(value),
        decoration: InputDecoration(
          labelText: 'Full Name',
          labelStyle: TextStyle(
            fontFamily: 'MontSerrat',
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
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
    textFields.add(TextFormField(
      onSaved: (value) => _password = value,
      validator: (value) => validatePassword(value),
      decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            fontFamily: 'MontSerrat',
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          )),
      obscureText: true,
    ));
    return textFields;
  }

  void submit() async {
    final form = formKey.currentState;
    form.save();

    try {
      final authService = Provider
          .of(context)
          .authService;
      String uid = await authService.createUserWithEmailAndPassword(
          _email, _password, _name);
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

  String validatePassword(String value) {
    Pattern pattern = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return 'Please enter your email address';
    if (!regex.hasMatch(value))
      return 'Minimum of eight characters, at least one letter and one number.';
    else
      return null;
  }

  String validateName(String value) {
    Pattern pattern = r"^([A-z\'\.-ᶜ]*(\s))+[A-z\'\.-ᶜ]*$";
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return 'Please enter your name';
    if (!regex.hasMatch(value))
      return 'Please enter a valid name';
    else
      return null;
  }
}
