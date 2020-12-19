import 'dart:convert';
import 'package:http/http.dart' as http;

/*
The home screen will contain 3 individual lists of items 
(title, release date, rating, image, etc.) using reusable view. 
The order is as follow
*/

class NetworkData {
  NetworkData(this.url);
  final url;
  var query = {
    'api_key': '1a97f3b8d5deee1d649c0025f3acf75c',
  };
  var queryMovies = {
    // https://api.themoviedb.org/3/discover/movie
    'api_key': ' 1a97f3b8d5deee1d649c0025f3acf75c',
    'primary_release_year': '2020',
    'sort_by': 'vote_average.desc',
  };
  var queryTv = {
    'api_key': '1a97f3b8d5deee1d649c0025f3acf75c',
    'primary_release_year': '2020',
    'sort_by': 'vote_average.desc',
  };
  var queryMoviesDetail = {
    'api_key': '1a97f3b8d5deee1d649c0025f3acf75c',
  };

  var queryParameters = {
    'api': '1a97f3b8d5deee1d649c0025f3acf75c',
    'param2': 'two',
  };

  // var uri = Uri.https(
  //   'https://api.themoviedb.org/3/trending/all/week',

  // );
  // var response = await http.get(uri, headers: {
  //   HttpHeaders.authorizationHeader: 'Token $token',
  //   HttpHeaders.contentTypeHeader: 'application/json',
  // });
  /*
var endpointUrl = 'https://www.myurl.com/api/v1/user';
Map<String, String> queryParams = {
  'param1': '1',
  'param2': '2'
};
String queryString = Uri(queryParameters: queryParams).query;

var requestUrl = endpointUrl + '?' + queryString; // result - https://www.myurl.com/api/v1/user?param1=1&param2=2
var response = await http.get(requestUrl);
  */

  Future getTrand() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }

  Future getMovie() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }

  Future getTv() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }

  //? detail part
  Future getTvDetail() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }

  Future getMovieDetail() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }
}

class Movies {
  final String title;
  final bool rating;
  final String release;
  // final ImageData image;

  Movies({this.title, this.rating, this.release});
}
