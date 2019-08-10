import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class OnBoardingPage extends StatefulWidget {
  final String title;

  OnBoardingPage({this.title});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _slideIndex = 0;

  List<IconData> icons = [
    Icons.library_books,
    Icons.pin_drop,
    Icons.create_new_folder,
    Icons.import_contacts,
    Icons.date_range,
  ];

  List<String> desc = [
    "Always Updated.\nAlways Blessed.",
    "Where would you like to go?\nParish & MSK Location.",
    "Reservations and Save Trees.\nPaperless Forms.",
    "Integrated Bible.\nAccessible Armor.",
    "Don't miss any events.\nSee you there!"
  ];

  // IndexController was imported from Transformer Page View
  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {
    TransformerPageView transformerPageView = TransformerPageView(
      pageSnapping: true,
      onPageChanged: (index) {
        setState(() {
          this._slideIndex = index;
        });
      },
      loop: false,
      controller: controller,
      transformer: new PageTransformerBuilder(
          builder: (Widget child, TransformInfo info) {
        return new Material(
          color: Colors.white,
          elevation: 8.0,
          textStyle: new TextStyle(color: Colors.white),
          borderRadius: new BorderRadius.circular(12.0),
          child: new Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffF58524), Color(0xffF92B7F)])),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new ParallaxContainer(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 19, left: 19, right: 19),
                          child: Row(
                            children: <Widget>[
                              Spacer(),
                              Text('VIVA ARANZAZU',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.white)),
                              Text(' PH',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300)),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                    position: info.position,
                    translationFactor: 700.0,
                  ),
                  new ParallaxContainer(
                    child: new Icon(
                      icons[info.index],
                      color: Colors.white,
                      size: 60,
                    ),
                    position: info.position,
                    translationFactor: 400.0,
                  ),
                  new ParallaxContainer(
                    child: new Text(desc[info.index],
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                    position: info.position,
                    translationFactor: 1000.0,
                  ),
                  new ParallaxContainer(
                    child: Dots(
                      controller: controller,
                      slideIndex: _slideIndex,
                      numberOfDots: icons.length,
                    ),
                    position: info.position,
                    translationFactor: 500.0,
                  ),
                  new Container(
                    child: GestureDetector(
                      onTap: () {
                        if (_slideIndex == icons.length - 1) {
                          setWelcomeTrue();
                          Navigator.of(context).pushReplacementNamed('/signup');
                        } else {
                          controller.move(_slideIndex + 1);
                        }
                      },
                      child: Container(
                        height: 36,
                        width: 120,
                        child: Material(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(2),
                              bottom: Radius.circular(2)),
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Color(0xffB92D00),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      itemCount: 5,
    );

    return Scaffold(
        backgroundColor: Colors.transparent, body: transformerPageView);
  }

  Future setWelcomeTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('welcome', true);
  }
}

class Dots extends StatelessWidget {
  final IndexController controller;
  final int slideIndex;
  final int numberOfDots;

  Dots({this.controller, this.slideIndex, this.numberOfDots});

  Widget _activeSlide(int index) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
        onTap: () {
          controller.move(index);
        },
        child: new Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.58),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ));
  }

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _generateDots(),
      ),
    );
  }
}
