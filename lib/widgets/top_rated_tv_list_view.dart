import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/model/trtv.dart';
import 'package:movie_finder/screens/tv_detail.dart';
import 'package:movie_finder/widgets/movie_card.dart';
import 'dart:convert';

class TopRatedTVListView extends StatefulWidget {
  const TopRatedTVListView({Key? key}) : super(key: key);


  @override
  State<TopRatedTVListView> createState() => _TopRatedTVListViewState();
}

class _TopRatedTVListViewState extends State<TopRatedTVListView> {

  String searchUrl = 'https://api.themoviedb.org/3/tv/top_rated?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=1';
  Future<TopRatedTV> getSearchList() async {
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    TopRatedTV trMovie = TopRatedTV.fromJson(json);

    return trMovie;
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
    return FutureBuilder<TopRatedTV>(
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
                              return TVDetailScreen(id: snapshot.data?.results[index].id ?? 0);
                            })
                        );
                      },
                      child: MovieCard(
                        title: snapshot.data?.results[index].name ?? '',
                        vote_average: snapshot.data?.results[index].vote_average ?? 0,
                        poster_path: snapshot.data?.results[index].poster_path ?? '',
                        mtype: genres[snapshot.data?.results[index].genre_ids[0].toString()] ?? '',
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