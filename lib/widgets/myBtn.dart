import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  MyBtn({@required this.title, this.swapActive, this.toggleSwap});
  final Function toggleSwap;
  final bool swapActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: swapActive
                  ? Colors.blue.withOpacity(0.5)
                  : Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        height: 40,
        width: 150,
        child: MaterialButton(
          child: Text(title),
          onPressed: toggleSwap,
          padding: EdgeInsets.symmetric(horizontal: 25),
        ),
      ),
    );
  }
}
