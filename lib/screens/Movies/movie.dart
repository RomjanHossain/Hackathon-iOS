import 'package:flutter/material.dart';
import 'package:popularmovie/model/getData.dart';
import 'package:popularmovie/screens/detail/detail.dart';

MovieModel _movieMod = MovieModel();

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Container(
      color: Colors.lightBlueAccent,
      child: Padding(
        padding: EdgeInsets.only(
          top: 50,
          bottom: 100,
        ),
        child: FutureBuilder(
            future: _movieMod.getMovie(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? GridView.count(
                      physics: BouncingScrollPhysics(),
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      children: List.generate(
                        20,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detail(
                                      iid:
                                          '${snapshot.data["results"][index]["id"]}',
                                      img:
                                          'https://image.tmdb.org/t/p/w500${snapshot.data["results"][index]["poster_path"]}',
                                      type: 'movie'),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),

                              // width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                children: [
                                  Hero(
                                    tag:
                                        '${snapshot.data["results"][index]["id"]}',
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${snapshot.data["results"][index]["poster_path"]}',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${snapshot.data["results"][index]["original_title"]}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}
