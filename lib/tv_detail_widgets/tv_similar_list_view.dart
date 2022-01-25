import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/error_not_found_widget.dart';
import 'package:movie_finder/screens/tv_detail.dart';
import 'package:movie_finder/widgets/movie_card.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:movie_finder/model/tv_detail/similar_tv_shows.dart';

class TvSimilarView extends StatefulWidget {
  const TvSimilarView({Key? key, required this.id}) : super(key: key);

  final int id;
  @override
  State<TvSimilarView> createState() => _TvSimilarViewState();
}

class _TvSimilarViewState extends State<TvSimilarView> {

  Future<SimilarTvShows> getSimilarMovies(int id) async {
    String jsonUrl = 'https://api.themoviedb.org/3/tv/' + id.toString() + '/similar?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=1';

    var response = await get(Uri.parse(jsonUrl));
    var json = jsonDecode(response.body);
    SimilarTvShows tv = SimilarTvShows.fromJson(json);
   // print(id);
    return tv;
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
    return FutureBuilder<SimilarTvShows>(
        future: getSimilarMovies(widget.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              if(snapshot.data?.results.length == 0) {
                return ErrorNotFoundWidget(errorType: '\'Similar TV Show\'');
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: (1 / 2.3)
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return TVDetailScreen(id: snapshot.data?.results[index].id ?? 0,);
                            })
                        );
                      },
                      child: MovieCard(
                        title: snapshot.data?.results[index].original_name ?? '',
                        vote_average: snapshot.data?.results[index].vote_average ?? 0,
                        poster_path: snapshot.data?.results[index].poster_path ?? '',
                        mtype: genres[snapshot.data?.results[index].genre_ids[0].toString()] ?? '',
                      ),
                    );
                  },
                  itemCount: snapshot.data?.results.length,
                );
              }
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
                      'Couldn\'t Load',
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