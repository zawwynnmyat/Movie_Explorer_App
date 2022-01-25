import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/model/actor/actor.dart';
import 'package:movie_finder/screens/cast_detail_screen.dart';
import 'package:movie_finder/widgets/profile_circle_avater.dart';
import 'dart:convert';

class PeopleListView extends StatefulWidget {
  const PeopleListView({Key? key}) : super(key: key);


  @override
  State<PeopleListView> createState() => _PeopleListViewState();
}

class _PeopleListViewState extends State<PeopleListView> {

  String searchUrl = 'https://api.themoviedb.org/3/person/popular?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US&page=1';

  Future<Actor> getSearchList() async {
    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    Actor actor = Actor.fromJson(json);

    return actor;
  }

  /*void  getSearchListDebug() async {

    try {
      var response = await get(Uri.parse(searchUrl));
      var json = jsonDecode(response.body);
      Actor actor = Actor.fromJson(json);
      print("OK");
    } catch (err) {
      print(err);

    }
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getSearchListDebug();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Actor>(
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
                              return CastDetailScreen(
                                id: snapshot.data?.results[index].id ?? 0,
                                castName: snapshot.data?.results[index].name ?? 'N/A',
                              );
                            })
                        );
                      },
                      child: ProfileCircleAvater(
                          profile_path: snapshot.data?.results[index].profile_path ?? '',
                          name: snapshot.data?.results[index].name ?? ''
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