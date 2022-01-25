import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/model/trmovie.dart';
import 'package:movie_finder/screens/movie_detail.dart';
import 'package:movie_finder/widgets/movie_card.dart';
import 'dart:convert';

class TopRatedMoviesListView extends StatefulWidget {
  const TopRatedMoviesListView({Key? key}) : super(key: key);


  @override
  State<TopRatedMoviesListView> createState() => _TopRatedMoviesListViewState();
}

class _TopRatedMoviesListViewState extends State<TopRatedMoviesListView> {

  String searchUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=1';

  Future<TRMovie> getSearchList() async {
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    TRMovie trMovie = TRMovie.fromJson(json);

    return trMovie;
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
    return FutureBuilder<TRMovie>(
        future: getSearchList(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              return ListView.separated(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return MovieDetailScreen(id: snapshot.data?.results[index].id ?? 0,);
                            })
                        );
                      },
                      child: MovieCard(
                        title: snapshot.data?.results[index].title ?? '',
                        vote_average: snapshot.data?.results[index].vote_average ?? 0,
                        poster_path: snapshot.data?.results[index].poster_path ?? '',
                        mtype: (snapshot.data?.results[index].genre_ids.isEmpty ?? true) ? ''
                            : (genresJsonUrl[snapshot.data?.results[index].genre_ids[0].toString()] ?? ''),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 1,);
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