import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viva_aranzazu/model/search.dart';

class SearchDataSource {
  final http.Client client;

  final String _searchBaseUrl =
      'http://aranzazushrine.ph/home/index.php/wp-json/capie/v1/search/news';

  SearchDataSource(this.client);

  Future<SearchResult> searchArticles({
    String query,
    int index,
  }) async {
    final urlRaw = _searchBaseUrl + '?s=$query' + '&page=$index';
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.body);
    } else {
      throw MessageError(json.decode(response.body)['message']);
    }
  }
}
