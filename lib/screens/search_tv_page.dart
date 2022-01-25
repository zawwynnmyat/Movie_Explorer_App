import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/model/movie.dart';
import 'dart:convert';

import 'package:movie_finder/screens/tv_detail.dart';
import 'package:movie_finder/search_not_found_widget.dart';
import 'package:movie_finder/search_tv_alert_widget.dart';
import 'package:movie_finder/widgets/movie_card.dart';

import 'movie_detail.dart';

class SearchTVPage extends StatefulWidget {
  const SearchTVPage({Key? key}) : super(key: key);

  @override
  State<SearchTVPage> createState() => _SearchTVPageState();
}

class _SearchTVPageState extends State<SearchTVPage> {

  late FocusNode myFocusNode = FocusNode();

  var searchMovieController = TextEditingController();

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

  /* Future<List<MovieSingle>> appendResults(String query, int page) async {
    String searchUrl = 'https://api.themoviedb.org/3/search/movie?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&query=' + query + '&page=' + page.toString() + '&include_adult=false';
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    Movie movie = Movie.fromJson(json);

    return movie.results;
  }*/

  // int loadedItem = 0;

  Future<Movie> getSearchList(String query, int page) async {
    String searchUrl = 'https://api.themoviedb.org/3/search/tv?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=' +  page.toString() +'&query=' + query + '&include_adult=false';
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    Movie movie = Movie.fromJson(json);
    // movie.results.add(movie.results[0]);

    //if(movie.total_pages > 1) {
    //for(int i=2;i<=movie.total_pages;i++) {
    // List<MovieSingle> moviePages = await appendResults(query, i);
    //  for(int j=0;j<moviePages.length;j++) {
    // print(moviePages[j].title);
    //  movie.results.add(moviePages[j]);
    // }

    //  movie.results.addAll(moviePages);
    //  loadedItem += moviePages.length;
    //  print("Page ${i}");
    //}
    // }

    return movie;
  }

  String searchMovieName = "";
  int page_index = 1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.requestFocus();
  }

  bool isSubmitted = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myFocusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The search area here
            backgroundColor: Color.fromRGBO(1, 1, 121, 1),
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  focusNode: myFocusNode,
                  onSubmitted: (value) {
                    setState(() {
                      isSubmitted = true;
                    });

                  },
                  controller: searchMovieController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          searchMovieController.text = '';
                        },
                      ),
                      hintText: 'Search TV Shows',
                      border: InputBorder.none),
                ),
              ),
            )),
        body: (isSubmitted && (searchMovieController.text.length > 0 && searchMovieController.text != '#' && searchMovieController.text != '&')) ? FutureBuilder<Movie>(
            future: getSearchList(searchMovieController.text.replaceAll('#', '').replaceAll('&', ''), page_index),
            builder: (context, snapshot) {
              isSubmitted = false;
              if(snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasData) {
                  return (snapshot.data?.results.length==0) ?
                  SearchNotFoundWidget(searchTerm: searchMovieController.text)
                      :
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child:  Text(
                            (snapshot.data?.total_results.toString() ?? '0') + ' results!, Here is Top ${snapshot.data?.results.length} Results',
                            style: GoogleFonts.alata(
                                fontSize: 18,
                                color: Color.fromRGBO(1, 1, 121, 1)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: 10,),
                        Expanded(
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: (1 / 2.34)
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
                                    title: snapshot.data?.results[index].title ?? '',
                                    vote_average: snapshot.data?.results[index].vote_average ?? 0,
                                    poster_path: snapshot.data?.results[index].poster_path ?? '',
                                    mtype: (snapshot.data?.results[index].genre_ids.isEmpty ?? true) ? ''
                                        : (genresJsonUrl[snapshot.data?.results[index].genre_ids[0].toString()] ?? ''),
                                  ),
                                );
                              },
                              itemCount: snapshot.data?.results.length,
                            )
                        )

                      ],
                    ),
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
        )
            : SearchTvAlertWidget()
    );
  }
}