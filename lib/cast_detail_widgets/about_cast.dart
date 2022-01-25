import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:movie_finder/description_text_widget.dart';
import 'dart:convert';
import 'package:movie_finder/model/cast_detail/cast_images.dart';

class AboutCast extends StatefulWidget {

  const AboutCast({
    Key? key,
    required this.birthday,
    required this.name,
    required this.biography,
    required this.place_of_birth,
    required this.imdb_id,
    required this.profile_path,
    required this.id,
    required this.popularity
  }) : super(key: key);
  final String? birthday;
  final String name;
  final String biography;
  final String? place_of_birth;
  final String imdb_id;
  final String? profile_path;
  final int id;
  final num popularity;


  @override
  State<AboutCast> createState() => _AboutCastState();
}

class _AboutCastState extends State<AboutCast> {

  bool isError = false;

  Future<CastImages> getCastImages(int id) async {

    String castAndCrewUrl = 'https://api.themoviedb.org/3/person/' + id.toString() + '/images?api_key=53b6f70df0427cdf36b1c1679950f19b';
    print(id);
    var response = await get(Uri.parse(castAndCrewUrl));
    var json = jsonDecode(response.body);
    CastImages castImages = CastImages.fromJson(json);

    return castImages;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            children: [
              //Poster Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  width: 130,
                  fit: BoxFit.cover,
                  imageUrl: "https://image.tmdb.org/t/p/original" + widget.profile_path!,
                  placeholder: (context, url) => Container(
                    height: 170,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.green,),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 180,
                    width: 130,
                    color: Colors.blue.withOpacity(0.2),
                    child: Center(
                      child: Icon(Icons.person, color: Colors.black, ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name ,
                      style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Date of Birth',
                      style: GoogleFonts.alata(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(1, 1, 121, 1)
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.birthday.toString(),
                      style: GoogleFonts.alata(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'From',
                      style: GoogleFonts.alata(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(1, 1, 121, 1)
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      widget.place_of_birth.toString(),
                      style: GoogleFonts.alata(fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                    Transform(
                      transform: new Matrix4.identity()..scale(0.8),
                      child: new Chip(
                        backgroundColor: Color.fromRGBO(1, 1, 121, 1),
                        label: Text(widget.popularity.toString(), style: GoogleFonts.alata(
                            fontSize: 15,
                            color: Colors.white
                        ),
                        ),
                        avatar: Icon(Icons.star, color: Colors.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(
            'Biography',
            style: GoogleFonts.alata(fontSize: 20,fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 5,),
          DescriptionTextWidget(text: widget.biography.toString()),
          SizedBox(height: 10,),
          Text(
            'Photos',
            style: GoogleFonts.alata(fontSize: 20,fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10,),
          Container(
            height: 170,
            child: FutureBuilder<CastImages>(
                future: getCastImages(widget.id),
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

                              },
                              child:  ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  width: 130,
                                  fit: BoxFit.cover,
                                  imageUrl: "https://image.tmdb.org/t/p/original" +
                                      ((snapshot.data?.profiles.isEmpty ?? true) ?
                                      '' :
                                      (snapshot.data?.profiles[index].file_path ?? '')),
                                  placeholder: (context, url) => Container(
                                    height: 170,
                                    child: Center(
                                      child: CircularProgressIndicator(color: Colors.green,),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Container(
                                    height: 180,
                                    width: 130,
                                    color: Colors.blue.withOpacity(0.2),
                                    child: Center(
                                      child: Icon(Icons.person, color: Colors.black, ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 10,);
                          },
                          itemCount: (snapshot.data?.profiles.isEmpty ?? true) ? 0 : (snapshot.data?.profiles.length ?? 0)
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
          )


        ],
      ),
    );
  }
  
}