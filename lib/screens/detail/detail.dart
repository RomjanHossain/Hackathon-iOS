import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:popularmovie/model/getData.dart';
import 'package:popularmovie/services/addRemove.dart';
import 'package:popularmovie/widgets/appbar.dart';
import 'package:popularmovie/widgets/myBtn.dart';
import 'package:provider/provider.dart';

MovieModel _movieMod = MovieModel();

class Detail extends StatefulWidget {
  final String iid;
  final String img;
  final String type;

  Detail({this.iid, this.img, this.type});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool _checkIsFav(BuildContext context) {
    return Provider.of<Data>(context, listen: false)
            .movieFav
            .contains(widget.iid) ||
        (Provider.of<Data>(context, listen: false).tvFav.contains(widget.iid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.lightBlue,
              child: FutureBuilder(
                  future: (widget.type.toString() == 'movie')
                      ? _movieMod.getDetailMovie(widget.iid)
                      : _movieMod.getDetailTv(widget.iid),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 60, bottom: 10),
                                child: (widget.type.toString() == 'movie')
                                    ? Text(
                                        snapshot.data['original_title'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      )
                                    : Text(
                                        snapshot.data['name'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: Hero(
                                  tag: widget.iid,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Image.network(
                                      widget.img,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                      height: 400,
                                      // width: 250,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data['original_language']),
                                      subtitle: Text('Language'),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: (widget.type.toString() == 'movie')
                                          ? Text(snapshot.data['release_date'])
                                          : Text(
                                              snapshot.data['first_air_date']),
                                      subtitle: Text('Release Date'),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(snapshot.data['vote_average']
                                          .toString()),
                                      subtitle: Text('vote'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: 60,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    children: [
                                      for (var i in snapshot.data['genres'])
                                        MyBtn(
                                          title: i['name'].toString(),
                                          swapActive: true,
                                        ),
                                    ],
                                  )),
                              Container(
                                padding: EdgeInsets.all(30),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        snapshot.data['overview'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 70,
                                  ),
                                  child: _checkIsFav(context)
                                      ? FlatButton.icon(
                                          color: Colors.white60,
                                          onPressed: () {
                                            (widget.type.toString() == 'movie')
                                                ? Provider.of<Data>(context,
                                                        listen: false)
                                                    .movieFav
                                                    .remove(widget.iid)
                                                : Provider.of<Data>(context,
                                                        listen: false)
                                                    .tvFav
                                                    .remove(widget.iid);
                                            setState(() {
                                              _checkIsFav(context);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                          ),
                                          label: Text('Remove from favourite'),
                                        )
                                      : FlatButton.icon(
                                          color: Colors.white60,
                                          onPressed: () {
                                            (widget.type.toString() == 'movie')
                                                ? Provider.of<Data>(context,
                                                        listen: false)
                                                    .movieFav
                                                    .add(widget.iid)
                                                : Provider.of<Data>(context,
                                                        listen: false)
                                                    .tvFav
                                                    .add(widget.iid);
                                            setState(() {
                                              _checkIsFav(context);
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                          label: Text('Add to Favourite'),
                                        )),
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                            ),
                          );
                  }),
            ),
            //! appbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                isdownload: true,
                text: 'Details',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
