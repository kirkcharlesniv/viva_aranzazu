import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  style: TextStyle(fontSize: 70.0, fontWeight: FontWeight.bold),
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
              TextField(
                //TODO: IMPLEMENT DATA VALIDATION
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    fontFamily: 'MontSerrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                    //TODO: IMPLEMENT DATA VALIDATION
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontFamily: 'MontSerrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    )),
                obscureText: true,
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
                  print("Tapped on Register button");
                  //TODO: REGISTER TO FIREBASE DATABASE
                },
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
