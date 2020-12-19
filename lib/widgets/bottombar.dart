import 'package:flutter/material.dart';

enum BottomData {
  Trending,
  Movies,
  Tv,
}

class BottomBar extends StatelessWidget {
  BottomBar({this.onBtnClicked, this.currentPage});
  final Function onBtnClicked;
  final BottomData currentPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomNavItem(
            type: BottomData.Trending,
            isActive: currentPage == BottomData.Trending,
            onClicked: onBtnClicked,
          ),
          CustomNavItem(
            type: BottomData.Movies,
            onClicked: onBtnClicked,
            isActive: currentPage == BottomData.Movies,
          ),
          CustomNavItem(
            type: BottomData.Tv,
            isActive: currentPage == BottomData.Tv,
            onClicked: onBtnClicked,
          ),
        ],
      ),
    );
  }
}

class CustomNavItem extends StatelessWidget {
  CustomNavItem({this.type, this.isActive, this.onClicked});
  final BottomData type;
  final bool isActive;
  final Function onClicked;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: getTooltip(),
      icon: Icon(
        getIcon(),
        color: isActive ? Colors.black : Colors.black26,
      ),
      onPressed: () => onClicked(type),
    );
  }

  // ignore: missing_return
  IconData getIcon() {
    switch (type) {
      case BottomData.Trending:
        return Icons.trending_up_sharp;
      case BottomData.Movies:
        return Icons.movie;
      case BottomData.Tv:
        return Icons.tv;
    }
  }

  // ignore: missing_return
  String getTooltip() {
    switch (type) {
      case BottomData.Trending:
        return 'Trending';
      case BottomData.Movies:
        return 'Movies';
      case BottomData.Tv:
        return 'Tv-series';
    }
  }
}
