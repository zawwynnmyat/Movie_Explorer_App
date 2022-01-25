import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/model/trendingtv.dart';
import 'package:movie_finder/screens/tv_detail.dart';
import 'package:movie_finder/widgets/movie_list_tile.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TrendingTVSeriesListVertical extends StatefulWidget {

  const TrendingTVSeriesListVertical({Key? key}) : super(key: key);

  @override
  State<TrendingTVSeriesListVertical> createState() => _TrendingTVSeriesListVerticalState();
}

class _TrendingTVSeriesListVerticalState extends State<TrendingTVSeriesListVertical> {

  String searchUrl = 'https://api.themoviedb.org/3/trending/tv/week?api_key=53b6f70df0427cdf36b1c1679950f19b';

  Future<TrendingTV> getSearchList() async {
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    TrendingTV trendingMovie = TrendingTV.fromJson(json);
    return trendingMovie;
  }

  var genres = {
    "10759" : "Action & Adventure",
    "16" : "Animation",
    "35" : "Comedy",
    "80" : "Crime",
    "99" : "Documentary",
    "18" : "Drama",
    "10751" : "Family",
    "10762" : "Kids",
    "9648" : "Mystery",
    "10763" : "News",
    "10764" : "Reality",
    "10765" : "Sci-Fi & Fantasy",
    "10766" : "Soap",
    "10767" : "Talk",
    "10768" : "War & Politics",
    "37" : "Western"
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TrendingTV>(
        future: getSearchList(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return TVDetailScreen(id: snapshot.data?.results[index].id ?? 0);
                            })
                        );
                      },
                      child: MovieListTile(
                          title: snapshot.data?.results[index].name ?? '',
                          vote_average: snapshot.data?.results[index].vote_average ?? 0,
                          poster_path: snapshot.data?.results[index].poster_path ?? '',
                          release_date: snapshot.data?.results[index].first_air_date ?? '',
                          count: index + 1
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 3,);
                  },
                  itemCount: snapshot.data?.results.length ?? 0
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/empty_box.png'),
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      'Couldn\'t load.',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alata(
                          fontSize: 18,
                          color: Color.fromRGBO(1, 1, 121, 1)
                      ),
                    ),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        color: Color.fromRGBO(1, 1, 121, 1),
                        onPressed: () {
                          setState(() {

                          });
                        },
                        child: Text(
                          'Retry',
                          style: GoogleFonts.alata(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        )
                    )
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Color.fromRGBO(1, 1, 121, 1),),
                  SizedBox(height: 10,),
                  Text(
                    'Loading... Stay Patient',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.alata(
                        fontSize: 18,
                        color: Color.fromRGBO(1, 1, 121, 1)
                    ),
                  ),
                ],
              ),
            );
          }
        }
    );
  }

}