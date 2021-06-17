
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/style/theme.dart' as Style;
import 'package:movie_app/widgets/now_playing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        centerTitle: true,
        leading: const Icon(EvaIcons.menu2Outline, color: Colors.white),
        title: const Text('IMDB App'),
        actions: const <Widget>[
          IconButton(onPressed: null, icon: Icon(EvaIcons.searchOutline, color: Colors.white),),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          NowPlayingMovies(),
        ],
      ),
    );
  }
}