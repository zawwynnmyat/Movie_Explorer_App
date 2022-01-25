import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/error_not_found_widget.dart';
import 'package:movie_finder/model/cast_detail/cast_tv_credit.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:movie_finder/screens/tv_detail.dart';
import 'package:movie_finder/widgets/movie_card.dart';

class CastTVShows extends StatefulWidget {

  const CastTVShows({Key? key,required this.id}) : super(key: key);
  final int id;

  @override
  State<CastTVShows> createState() => _CastTVShowsState();
}

class _CastTVShowsState extends State<CastTVShows> {

  Future<CastTvCredit> getCastTv(int id) async {

    String jsonUrl = 'https://api.themoviedb.org/3/person/' + id.toString() + '/tv_credits?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';
    var response = await get(Uri.parse(jsonUrl));
    var json = jsonDecode(response.body);
    CastTvCredit castTv = CastTvCredit.fromJson(json);

    return castTv;
  }

  /*void test(int id) async {
    try {
      String jsonUrl = 'https://api.themoviedb.org/3/person/' + id.toString() + '/tv_credits?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';
      var response = await get(Uri.parse(jsonUrl));
      var json = jsonDecode(response.body);
      CastTvCredit castTv = CastTvCredit.fromJson(json);
      print('good');
    } catch (err) {
      print('err');
      print(err);
    }
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //test(widget.id);
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
    return FutureBuilder<CastTvCredit>(
        future: getCastTv(widget.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              return (snapshot.data?.cast.length == 0) ?
             ErrorNotFoundWidget(errorType: 'TV Show') :

              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: (1 / 2.3)
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return TVDetailScreen(id: snapshot.data?.cast[index].id ?? 0,);
                          })
                      );
                    },
                    child: MovieCard(
                      title: snapshot.data?.cast[index].original_name ?? '',
                      vote_average: snapshot.data?.cast[index].vote_average ?? 0,
                      poster_path: snapshot.data?.cast[index].poster_path ?? '',
                      mtype: (snapshot.data?.cast[index].genre_ids.isEmpty ?? true) ? ''
                          : (genres[snapshot.data?.cast[index].genre_ids[0].toString()] ?? ''),
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
                      'Couldn\'t not load',
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