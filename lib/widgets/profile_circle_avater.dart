import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCircleAvater extends StatelessWidget {

  const ProfileCircleAvater({Key? key, required this.profile_path, required this.name}) : super(key: key);

  final String profile_path;
  final String name;

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: EdgeInsets.only(right: 15),
         child: Container(
           width: 80,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CachedNetworkImage(
                 imageUrl: 'https://image.tmdb.org/t/p/original' + profile_path,
                 imageBuilder: (context, imageProvider) => Container(
                   width: 80.0,
                   height: 80.0,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     image: DecorationImage(
                         image: imageProvider, fit: BoxFit.cover),
                   ),
                 ),
                 placeholder: (context, url) => CircularProgressIndicator(),
                 errorWidget: (context, url, error) => Icon(Icons.error),
               ),
               Container(
                 width: 60,
                 child: Text(
                   name,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   textAlign: TextAlign.center,
                   style: GoogleFonts.alata(
                     fontSize: 15,
                   ),
                 ),
               )


             ],
           ),
         )
     );
  }

}