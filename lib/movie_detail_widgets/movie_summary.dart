import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/description_text_widget.dart';

class MovieSummary extends StatefulWidget {

  const MovieSummary({Key? key,
    required this.movieTitle,
    required this.genres,
    required this.vote_average,
    required this.release_date,
    required this.overview,
    required this.runTime,
  required this.poster_path}) : super(key: key);

  final String movieTitle;
  final String genres;
  final num vote_average;
  final String release_date;
  final String? overview;
  final int? runTime;
  final String? poster_path;


  @override
  State<MovieSummary> createState() => _MovieSummaryState();
}

class _MovieSummaryState extends State<MovieSummary> {

  @override
  Widget build(BuildContext context) {
     return Padding(
         padding: EdgeInsets.only(left: 16, right: 16),
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
                   imageUrl: "https://image.tmdb.org/t/p/original" + widget.poster_path.toString(),
                   placeholder: (context, url) => Container(
                     height: 170,
                     child: Center(
                       child: CircularProgressIndicator(color: Colors.green,),
                     ),
                   ),
                   errorWidget: (context, url, error) => Container(
                     height: 180,
                     width: 130,
                     child: Center(
                       child: Icon(Icons.movie, color: Colors.transparent,),
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
                       widget.movieTitle ,
                       style: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.bold),
                       textAlign: TextAlign.left,
                     ),
                     Text(
                       widget.genres.toString().replaceAll('[', '').replaceAll(']', ''),
                       style: GoogleFonts.alata(fontSize: 15),
                       textAlign: TextAlign.left,
                     ),
                     Transform(
                       transform: new Matrix4.identity()..scale(0.7),
                       child: new Chip(
                         backgroundColor: Color.fromRGBO(1, 1, 121, 1),
                         label: Text(widget.vote_average.toString(), style: GoogleFonts.alata(
                             fontSize: 15,
                             color: Colors.white
                         ),
                         ),
                         avatar: Icon(Icons.star, color: Colors.white,),
                       ),
                     ),
                     Text(
                       '🗒 ' + widget.release_date,
                       style: GoogleFonts.alata(fontSize: 15),
                       textAlign: TextAlign.left,
                       overflow: TextOverflow.ellipsis,
                     ),
                     Text(
                       '⏰ ' + widget.runTime.toString() + ' min',
                       style: GoogleFonts.alata(fontSize: 15),
                       textAlign: TextAlign.left,
                     ),
                   ],
                 ),
               ),
             ],
           ),
           SizedBox(height: 10,),
           DescriptionTextWidget(text: widget.overview.toString())

         ],
       ),
     );
  }

}