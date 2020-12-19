import 'package:popularmovie/services/networkD.dart';

const String api = '1a97f3b8d5deee1d649c0025f3acf75c';

class MovieModel {
  Future<dynamic> getTranding() async {
    NetworkData networkdata = NetworkData(
        'https://api.themoviedb.org/3/trending/all/week?api_key=$api');
    var myData = await networkdata.getTrand();
    return myData;
  }

  Future<dynamic> getMovie() async {
    NetworkData networkdata =
        NetworkData('https://api.themoviedb.org/3/discover/movie?api_key=$api');
    var myData = await networkdata.getTrand();
    return myData;
  }

  Future<dynamic> getTv() async {
    NetworkData networkdata =
        NetworkData('https://api.themoviedb.org/3/discover/tv?api_key=$api');
    var myData = await networkdata.getTrand();
    return myData;
  }

  //? detail

  Future<dynamic> getDetailMovie(String id) async {
    NetworkData networkdata =
        NetworkData('https://api.themoviedb.org/3/movie/$id?api_key=$api');
    var myData = await networkdata.getTrand();

    return myData;
  }

  Future<dynamic> getDetailTv(String id) async {
    //https://api.themoviedb.org/3/movie/{id}
    NetworkData networkdata =
        NetworkData('https://api.themoviedb.org/3/tv/$id?api_key=$api');
    var myData = await networkdata.getTrand();

    return myData;
  }
}
