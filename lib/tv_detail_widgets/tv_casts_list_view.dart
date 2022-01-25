import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/model/tv_detail/tv_credit.dart';
import 'dart:convert';

import 'package:movie_finder/movie_detail_widgets/cast_list_tile.dart';
import 'package:movie_finder/screens/cast_detail_screen.dart';

class TvCastsListView extends StatefulWidget {
  const TvCastsListView({Key? key,required this.id}) : super(key: key);

  final int id;

  @override
  State<TvCastsListView> createState() => _TvCastsListViewState();
}

class _TvCastsListViewState extends State<TvCastsListView> {

  Future<TvCredit> getCastAndCrew(int id) async {

    String castAndCrewUrl = 'https://api.themoviedb.org/3/tv/' + id.toString() +'/credits?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';

    var response = await get(Uri.parse(castAndCrewUrl));
    var json = jsonDecode(response.body);
    TvCredit tvCredit = TvCredit.fromJson(json);

    return tvCredit;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TvCredit>(
        future: getCastAndCrew(widget.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return CastDetailScreen(
                              id: snapshot.data?.cast[index].id ?? 0,
                              castName: snapshot.data?.cast[index].name ?? 'N/A',
                            );
                          })
                      );
                    },
                    child: CastListTile(
                      profile_photo_path: snapshot.data?.cast[index].profile_path ?? '',
                      name: snapshot.data?.cast[index].name ?? " ",
                      character_name: snapshot.data?.cast[index].character ?? " ",
                      popularity: snapshot.data?.cast[index].popularity ?? 0,
                      count: index+1,
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
                      image: AssetImage(
                        'assets/empty_box.png',
                      ),
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