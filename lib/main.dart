import 'package:flutter/material.dart';
import 'package:popularmovie/screens/Home/homep.dart';
import 'package:popularmovie/services/addRemove.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GrammenPhone Hackathon',
        theme: ThemeData(),
        home: MyHomePage(),
      ),
    );
  }
}
