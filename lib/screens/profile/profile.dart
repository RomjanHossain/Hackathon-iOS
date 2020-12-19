import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:popularmovie/screens/favourite/fav.dart';
import 'package:popularmovie/services/addRemove.dart';
import 'package:popularmovie/widgets/appbar.dart';
import 'package:provider/provider.dart';

class ProfilePageRoute extends CupertinoPageRoute {
  ProfilePageRoute() : super(builder: (BuildContext context) => UserProfile());
  @override
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return RotationTransition(
      turns: animation,
      child: ScaleTransition(
        scale: animation,
        child: FadeTransition(
          opacity: animation,
          child: UserProfile(),
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage(
                        'assets/emo2.jpg',
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavMovie()));
                          },
                          leading: Icon(Icons.movie),
                          title: Text('fav movie'),
                          trailing: Text(Provider.of<Data>(context)
                              .movieFav
                              .length
                              .toString()),
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavTv()));
                          },
                          leading: Icon(Icons.tv),
                          title: Text('fav tv'),
                          trailing: Text(Provider.of<Data>(context)
                              .tvFav
                              .length
                              .toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                isdownload: true,
                text: 'Profile',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*


*/
