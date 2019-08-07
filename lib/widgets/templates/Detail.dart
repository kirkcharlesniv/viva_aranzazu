import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeago;
import 'package:viva_aranzazu/model/search/SearchItem.dart';

class Item {
  final String item;

  Item(this.item);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['item']);
  }
}

class DetailPage extends StatelessWidget {
  final int page;
  final SearchItem prevItem;

  DetailPage(this.page, this.prevItem);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailScreen(page, prevItem, context),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int page;
  final SearchItem prevItem;
  final BuildContext materialAppBuildContext;

  DetailScreen(this.page, this.prevItem, this.materialAppBuildContext);

  Future<Item> getItem() async {
    final response = await http.get(
        "http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/fetch/article?id=" +
            page.toString());
    final responseJson = json.decode(response.body);
    return Item.fromJson(responseJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Item>(
        future: getItem(),
        builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          leading: new IconButton(
                            icon:
                                new Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () =>
                                Navigator.pop(materialAppBuildContext),
                          ),
                          title: Text(
                            prevItem.title,
                          ),
                          backgroundColor: Colors.green,
                          expandedHeight: 200.0,
                          snap: true,
                          pinned: true,
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image.network(
                              prevItem.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 22, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    prevItem.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 10),
                                    child: SizedBox(
                                      width: 34,
                                      height: 3.5,
                                      child: const DecoratedBox(
                                        decoration: const BoxDecoration(
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: new Container(
                                            width: 25,
                                            height: 25,
                                            decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: new NetworkImage(
                                                        prevItem
                                                            .authorImage)))),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "By",
                                                style: TextStyle(
                                                    color: Color(0xff8E8E8E),
                                                    fontSize: 9),
                                              ),
                                              Text(
                                                " ${prevItem.authorName}",
                                                style: TextStyle(fontSize: 9),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            timeago.format(
                                                DateTime.parse(prevItem.date)),
                                            style: TextStyle(
                                                color: Color(0xff8E8E8E),
                                                fontSize: 7,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 11, right: 11),
                            child: Container(
                              child: HtmlWidget(
                                snapshot.data.item,
                                webView: true,
                                textStyle:
                                    TextStyle(color: Colors.black, height: 1.2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text("ERROR OCCURRED"),
                      ),
                    )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
