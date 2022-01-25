import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/model/trtv.dart';
import 'package:movie_finder/screens/tv_detail.dart';
import 'package:movie_finder/widgets/movie_list_tile.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TopTVSeriesListView extends StatefulWidget {
  
  const TopTVSeriesListView({Key? key}) : super(key: key);

  @override
  State<TopTVSeriesListView> createState() => _TopTVSeriesListViewState();
}

class _TopTVSeriesListViewState extends State<TopTVSeriesListView> {

  String searchUrl = 'https://api.themoviedb.org/3/tv/top_rated?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=1';

  Future<TopRatedTV> getSearchList() async {
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    TopRatedTV trTV = TopRatedTV.fromJson(json);

    return trTV;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedTV>(
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