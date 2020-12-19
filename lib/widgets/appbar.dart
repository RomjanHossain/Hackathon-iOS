import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:popularmovie/screens/profile/profile.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({this.isdownload, this.text});
  final bool isdownload;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isdownload
            ? Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      LineIcons.angle_left,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.only(left: 20),
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
        isdownload
            ? Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(text),
                ),
              )
            : Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                padding: EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(text),
                ),
              ),
        isdownload
            ? Container(
                margin: EdgeInsets.only(right: 20),
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
              )
            : Container(
                margin: EdgeInsets.only(right: 20, top: 10),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.black38,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfile(),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
