import 'package:flutter/material.dart';
import 'package:popularmovie/model/getData.dart';
import 'package:popularmovie/services/addRemove.dart';
import 'package:popularmovie/widgets/appbar.dart';
import 'package:provider/provider.dart';

MovieModel _movieMod = MovieModel();

class FavTv extends StatefulWidget {
  @override
  _FavTvState createState() => _FavTvState();
}

class _FavTvState extends State<FavTv> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
                children: [
                  for (var item in Provider.of<Data>(context).tvFav)
                    FutureBuilder(
                        future: _movieMod.getDetailTv(item.toString()),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? Container(
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${snapshot.data["poster_path"]}',
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        '${snapshot.data["name"]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                        }),
                ],
              ),
            ),
            //! appbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                isdownload: true,
                text: 'Favourite Tv-Series',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavMovie extends StatefulWidget {
  @override
  _FavMovieState createState() => _FavMovieState();
}

class _FavMovieState extends State<FavMovie> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
                children: [
                  for (var item in Provider.of<Data>(context).movieFav)
                    FutureBuilder(
                        future: _movieMod.getDetailMovie(item.toString()),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? Container(
                                  margin: EdgeInsets.all(8),
                                  // width: 300,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/w500${snapshot.data["poster_path"]}',
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        '${snapshot.data["original_title"]}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                        }),
                ],
              ),
            ),
            //! appbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                isdownload: true,
                text: 'Favourite Movie',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
