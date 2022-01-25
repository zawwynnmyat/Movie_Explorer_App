import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/error_not_found_widget.dart';
import 'package:movie_finder/model/cast_detail/cast_movie_credit.dart';
import 'package:http/http.dart';
import 'package:movie_finder/screens/movie_detail.dart';
import 'dart:convert';

import 'package:movie_finder/widgets/movie_card.dart';

class CastMovies extends StatefulWidget {

  const CastMovies({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<CastMovies> createState() => _CastMoviesState();
}

class _CastMoviesState extends State<CastMovies> {

  Future<CastMovieCredit> getCastMovies(int id) async {
    String jsonUrl = 'https://api.themoviedb.org/3/person/' + widget.id.toString() + '/movie_credits?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';
    var response = await get(Uri.parse(jsonUrl));
    var json = jsonDecode(response.body);
    CastMovieCredit castMovie = CastMovieCredit.fromJson(json);

    return castMovie;
  }


  var genresJsonUrl = {
    "28" : "Action",
    "12" : "Adventure",
    "16" : "Animation",
    "35" : "Comedy",
    "80" : "Crime",
    "99" : "Documentary",
    "18" : "Drama",
    "10751" : "Family",
    "14" : "Fantasy",
    "36" : "History",
    "27" : "Horror",
    "10402" : "Music",
    "9648" : "Mystery",
    "10749" : "Romance",
    "878" : "Science Fiction",
    "10770" : "TV Movie",
    "53" : "Thriller",
    "10752" : "War",
    "37" : "Western",
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CastMovieCredit>(
        future: getCastMovies(widget.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              return (snapshot.data?.cast.length == 0) ?
              ErrorNotFoundWidget(errorType: 'Movie')
                  :GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (1 / 2.3)
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return MovieDetailScreen(id: snapshot.data?.cast[index].id ?? 0,);
                          })
                      );
                    },
                    child: MovieCard(
                      title: snapshot.data?.cast[index].original_title ?? '',
                      vote_average: snapshot.data?.cast[index].vote_average ?? 0,
                      poster_path: snapshot.data?.cast[index].poster_path ?? '',
                      mtype: (snapshot.data?.cast[index].genre_ids.isEmpty ?? true) ? ''
                          : (genresJsonUrl[snapshot.data?.cast[index].genre_ids[0].toString()] ?? ''),
                      //genresJsonUrl[snapshot.data?.cast[index].genre_ids[0].toString()] ?? ''
                      //Correct: (snapshot.data?.cast[index].genre_ids.isEmpty ?? true) ? '' : '',
                    ),
                  );
                },
                itemCount: snapshot.data?.cast.length,
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
                      'Couldn\'t load',
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