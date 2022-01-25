import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/cast_detail_widgets/about_cast.dart';
import 'package:movie_finder/cast_detail_widgets/cast_movies.dart';
import 'package:movie_finder/cast_detail_widgets/cast_tv_shows.dart';
import 'package:movie_finder/model/cast_detail/cast_detail.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CastDetailScreen extends StatefulWidget {
  const CastDetailScreen({Key? key, required this.id, required this.castName}) : super(key: key);
  final int id;
  final String castName;

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen> {

  Future<CastDetail> getCastDetail(int id) async {

    String castAndCrewUrl = 'https://api.themoviedb.org/3/person/' + id.toString() + '?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';
    print(id);
    var response = await get(Uri.parse(castAndCrewUrl));
    var json = jsonDecode(response.body);
    CastDetail cast = CastDetail.fromJson(json);

    return cast;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 1, 121, 1),
          title: Text(widget.castName),
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(
                icon: Image(
                  image: AssetImage('assets/information.png'),
                  height: 30,
                  width: 30,
                ),
                child: Text('Detail'),
              ),
              Tab(
                icon: Image(
                  image: AssetImage('assets/clapperboard.png'),
                  height: 30,
                  width: 30,
                ),
                child: Text('Movies'),
              ),
              Tab(
                icon: Image(
                  image: AssetImage('assets/tv.png'),
                  height: 30,
                  width: 30,
                ),
                child: Text('TV Series'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
        FutureBuilder<CastDetail>(
        future: getCastDetail(widget.id),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasData){
                return AboutCast(
                  birthday: (snapshot.data?.birthday?.isEmpty ?? true) ? 'N/A' : snapshot.data?.birthday ?? 'N/A',
                  name: snapshot.data?.name ?? 'N/A',
                  biography: (snapshot.data?.biography?.isEmpty ?? true) ? 'N/A' : snapshot.data?.biography ?? 'N/A',
                  place_of_birth: (snapshot.data?.place_of_birth?.isEmpty ?? true) ? 'N/A' : snapshot.data?.place_of_birth ?? 'N/A',
                  imdb_id: (snapshot.data?.imdb_id?.isEmpty ?? true) ? 'N/A' :snapshot.data?.imdb_id ?? 'N/A',
                  profile_path: (snapshot.data?.profile_path?.isEmpty ?? true) ? 'N/A' : snapshot.data?.profile_path ?? 'N/A',
                  id: widget.id,
                  popularity: snapshot.data?.popularity ?? 0,
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
        ),
           CastMovies(id: widget.id),
           CastTVShows(id: widget.id)

      ],
        ),
      ),
    );
  }

}