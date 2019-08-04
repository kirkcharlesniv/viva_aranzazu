import 'package:flutter/material.dart';
import 'package:viva_aranzazu/model/search/SearchItem.dart';
import 'package:timeago/timeago.dart' as timeago;

class ListItemCard extends StatelessWidget {
  final SearchItem searchItem;

  ListItemCard(this.searchItem);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                searchItem.thumbnail,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            searchItem.title,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Text(
            searchItem.excerpt,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 11,
                fontWeight: FontWeight.w300,
                color: Color(0xff737474)),
          ),
          SizedBox(height: 7.0),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text(
              timeago.format(DateTime.parse(searchItem.date)),
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 9.5,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff737474)),
            ),
            Spacer(),
            Icon(
              Icons.more_vert,
              color: Color(0xff737474),
              size: 17,
            )
          ]),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
