import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/screens/explore_screen.dart';
import 'package:movie_finder/screens/movies_screen.dart';
import 'package:movie_finder/screens/search_movie_page.dart';
import 'package:movie_finder/screens/search_tv_page.dart';
import 'package:movie_finder/screens/top_rated_screen.dart';
import 'package:movie_finder/screens/tv_series_screen.dart';
import 'dart:convert';

import 'package:movie_finder/widgets/movie_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Search Url
//https://api.themoviedb.org/3/search/movie?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&query=Spider%20Man&page=1&include_adult=false
//Poster
//https://image.tmdb.org/t/p/original/gSZyYEK5AfZuOFFjnVPUCLvdOD6.jpg

//TrendingMovie Url - 1 Week
//'https://api.themoviedb.org/3/trending/movie/week?api_key=53b6f70df0427cdf36b1c1679950f19b'

//Popular People
//https://api.themoviedb.org/3/person/popular?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=1
  String apiKey = '53b6f70df0427cdf36b1c1679950f19b';
  String title = "a";

  String searchUrl = 'https://api.themoviedb.org/3/trending/tv/week?api_key=53b6f70df0427cdf36b1c1679950f19b';
  void getSearchList() async {
    try {
      var response = await get(Uri.parse(searchUrl));
      var json = jsonDecode(response.body);
      //Movie mv = Movie.fromJson(json);
      //TrendingMovie trendingMovie = TrendingMovie.fromJson(json);

    } catch (err) {
      print(err);
    }

    // print(movies);
    //print(json);
    //print(response.statusCode);
  }

  int _selectedIndex = 0;

  List<Widget> screens = [
    ExploreScreen(),
    MoviesScreen(),
    TVSeriesScreen(),
    TopRatedScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                Image(
                    width: 44,
                    height: 44,
                    image: AssetImage(
                      'assets/cinema.png',
                    )
                ),
                SizedBox(width: 10,),
                Text(
                  widget.title,
                  style: GoogleFonts.alata(),
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(1, 7, 121, 1),
          actions: <Widget>[
            (_selectedIndex == 1 || _selectedIndex == 2) ?
            IconButton(
                onPressed: () {
                 if (_selectedIndex == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return  SearchMoviePage();
                        })
                    );
                  } else if (_selectedIndex == 2) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return  SearchTVPage();
                        })
                    );
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return  SearchMoviePage();
                        })
                    );
                  }

                },
                icon: Icon(Icons.search, size: 35,)) : Text('')
          ],
        ),

        body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(1, 7, 121, 1),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
             label: 'Explore',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.movie,
              ),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.tv,
              ),
            label: 'TV Series',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
            label: 'Top Rated',
          ),

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}