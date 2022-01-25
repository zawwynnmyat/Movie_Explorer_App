import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieListTile extends StatefulWidget {

  // ignore: non_constant_identifier_names
  const MovieListTile({
    Key? key,
    required this.title,
    required this.vote_average,
    required this.poster_path,
    required this.release_date,
    required this.count
  }) : super(key: key);

  final String title;
  final num vote_average;
  final String? poster_path;
  final String release_date;
  final int count;
  @override
  State<MovieListTile> createState() => _MovieListTileState();
}

class _MovieListTileState extends State<MovieListTile> {
  @override
  Widget build(BuildContext context) {
     return Padding(
         padding: EdgeInsets.all(16.0),
       child: Container(
         height: 190,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(12),
           color: Colors.transparent,
         ),

         child: Stack(
           children: [
             Positioned(
               left: 0,
               bottom: 0,
               child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12),
                   color: Color.fromRGBO(32, 40, 68, 1),
                 ),
                 height: 130,
                 width: MediaQuery.of(context).size.width/1.09,
               ),
             ),
             Positioned(
               left: 20,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: CachedNetworkImage(
                     width: 110,
                     fit: BoxFit.cover,
                     imageUrl: "https://image.tmdb.org/t/p/original" + widget.poster_path!,
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
                         child: Icon(Icons.movie, color: Colors.black,),
                       ),
                     ),
                   ),
                 )
             ),
             //Crown & Ranking Text
             Positioned(
                 right: 30,
                 bottom: 130,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: Stack(
                     children: [
                       Image(
                         height: 45,
                         image: AssetImage(
                           'assets/rank.png',
                         ),
                       ),
                       Positioned(
                         bottom: 0,
                           right: 20,
                           child: Text(
                             (widget.count < 10) ? '0'+widget.count.toString() : widget.count.toString(),
                             style: GoogleFonts.alata(
                                 fontSize: 15,
                                 color: Color.fromRGBO(1, 1, 121, 1),
                                 fontWeight: FontWeight.bold
                             ),
                           )
                       )
                     ],
                   )
                 )
             ),

             Positioned(
               left: 150,
                 top: 65,
                 child: Text(
                     widget.title,
                   style: GoogleFonts.alata(
                       fontSize: 18,
                       color: Colors.white,
                       fontWeight: FontWeight.bold
                   ),
                 )
             ),

             Positioned(
                 left: 150,
                 top: 95,
                 child: Transform(
                   transform: new Matrix4.identity()..scale(0.8),
                   child: new Chip(

                     backgroundColor: Colors.amber,
                     label: Text(
                       widget.vote_average.toString(),
                       maxLines: 2,
                       style: GoogleFonts.alata(
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                         color: Color.fromRGBO(1, 1, 121, 1),
                     ),
                     ),
                     avatar: Icon(Icons.star, color: Color.fromRGBO(1, 1, 121, 1),),
                   ),
                 ),
             ),

             Positioned(
               left: 150,
               top: 135,
               child:  Text(
                 'Release : ' + widget.release_date,
                 style: GoogleFonts.alata(
                     fontSize: 13,
                     color: Colors.white,
                     fontWeight: FontWeight.bold
                 ),
               )
             ),


           ],
         ),
       ),
     );
  }

}