import 'package:flutter/material.dart';
import 'package:popularmovie/screens/Home/trend.dart';
import 'package:popularmovie/screens/Movies/movie.dart';
import 'package:popularmovie/screens/TV/tv.dart';
import 'package:popularmovie/widgets/appbar.dart';
import 'package:popularmovie/widgets/bottombar.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'homo';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BottomData _currentPage = BottomData.Trending;
  PageController _controller = PageController();
  String _appBarText = 'Images';

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Tranding(),
                Movies(),
                TvSeries(),
              ],
            ),

            //! appbar

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(
                isdownload: false,
                text: _appBarText,
              ),
            ),
            Positioned(
              child: BottomBar(
                currentPage: _currentPage,
                onBtnClicked: (BottomData tab) {
                  setState(
                    () {
                      if (tab == BottomData.Trending) {
                        _appBarText = 'Trending';
                      } else if (tab == BottomData.Tv) {
                        _appBarText = 'Tv-Series';
                      } else {
                        _appBarText = 'Movies';
                      }
                      _currentPage = tab;
                      _controller.animateToPage(
                        tab.index,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.decelerate,
                      );
                    },
                  );
                },
              ),
              bottom: 0,
              left: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
