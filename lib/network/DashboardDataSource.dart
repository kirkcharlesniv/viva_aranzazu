import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viva_aranzazu/model/search.dart';

class DashboardDataSource {
  final http.Client client;

  final String _searchBaseUrl =
      'http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/news/';

  DashboardDataSource(this.client);

  Future<SearchResult> browseDashboard({int index}) async {
    final urlRaw = _searchBaseUrl + index.toString();
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.body);
    } else {
      throw SearchError(json.decode(response.body)['message']);
    }
  }
}