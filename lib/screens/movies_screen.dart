import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/widgets/now_playing_list_view.dart';
import 'package:movie_finder/widgets/popular_movies_list_view.dart';
import 'package:movie_finder/widgets/top_rated_movies_list_view.dart';
import 'package:movie_finder/widgets/trending_movies_list_view.dart';
import 'package:movie_finder/widgets/upcoming_movies_list_view.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);


  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [

        //Now Playing Movie Text
        Padding(
          padding: EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Now Playing',
                style: GoogleFonts.alata(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),

        //Now Playing Movies ListView
        Container(
          padding: EdgeInsets.only(
              left: 15
          ),
          height: 285,
          child: NowPlayingListView(),
        ),

        //Upcoming Movie Text
        Padding(
          padding: EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Movies',
                style: GoogleFonts.alata(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),

        //Upcoming Movies ListView
        Container(
          padding: EdgeInsets.only(
              left: 15
          ),
          height: 285,
          child: UpcomingMoviesListView(),
        ),

//Popular Movies Text
        Padding(
          padding: EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Movies',
                style: GoogleFonts.alata(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),

        //Popular Movies List View
        Container(
          padding: EdgeInsets.only(
              left: 15
          ),
          height: 285,
          child: PopularMoviesListView(),
        ),

        //Top Rated Movies Text
        Padding(
          padding: EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Rated Movies',
                style: GoogleFonts.alata(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),

        //Top Rated Movies List View
        Container(
          padding: EdgeInsets.only(
              left: 15
          ),
          height: 285,
          child: TopRatedMoviesListView(),
        ),

        //Trending Movies Text
        Padding(
          padding: EdgeInsets.only(
              left: 15,
              top: 5,
              bottom: 5
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.alata(
                    fontSize: 20,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),

        //Top Rated Movies List View
        Container(
          padding: EdgeInsets.only(
              left: 15
          ),
          height: 285,
          child: TrendingMoviesListView(),
        ),

      ],
    );
  }

}
