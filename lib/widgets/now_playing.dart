import 'package:flutter/material.dart';
import 'package:movie_app/bloc/now_playing_movies_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:movie_app/style/theme.dart' as Style;

class NowPlayingMovies extends StatefulWidget {
  const NowPlayingMovies({ Key? key }) : super(key: key);

  @override
  _NowPlayingMoviesState createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  @override
  void initState() {
    super.initState();
    nowPlayingMoviesBloc.getNowPlayingMovies();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Movie>>(
      stream: nowPlayingMoviesBloc.subject,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot){
        if(snapshot.hasData){
          // if(snapshot.data!.error!=null && snapshot.data!.error.isNotEmpty){
          //   return _errorWidget(snapshot.data!.error);
          // }
          return _nowPlayingWidget(snapshot.data);
        }
        else if(snapshot.hasError){
          return _errorWidget(snapshot.error);
        }
        else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _errorWidget(error){
    return Text('$error');
  }

  Widget _buildLoadingWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget> [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          ),
        ]
      ),
    );
  }

  Widget _nowPlayingWidget(data){
    List <Movie> movies = data;

    if(movies.isEmpty){
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text('No movies'),
          ]
        ),
      );
    }

    return Container(
      height: 220.0,
      child: PageIndicatorContainer(
        length: movies.take(5).length,
        align: IndicatorAlign.bottom,
        indicatorColor: Style.Colors.titleColor,
        indicatorSelectorColor: Style.Colors.secondaryColor,
        padding: const EdgeInsets.all(5.0),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.take(5).length,
          itemBuilder: (context, index){
            print(movies[index]);
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 220.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage("https://image.tmdb.org/t/p/original/"+movies[index].backPoster), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}