import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/widgets/people_list_view.dart';
import 'package:movie_finder/widgets/top_rated_movies_list_view.dart';
import 'package:movie_finder/widgets/top_rated_tv_list_view.dart';
import 'package:movie_finder/widgets/trending_movies_list_view.dart';
import 'package:movie_finder/widgets/trending_tv_series_list_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);


  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
     return ListView(
       scrollDirection: Axis.vertical,
       physics: BouncingScrollPhysics(),
       children: [
         //Trending Movie Text
         Padding(
             padding: EdgeInsets.only(
              left: 15,
             top: 5,
             bottom: 5
             ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                   'Trending Movies',
                 style: GoogleFonts.alata(
                     fontSize: 20,
                     color: Colors.black
                 ),
               ),
             ],
           ),
         ),

         //Trending Movies ListView
         Container(
           padding: EdgeInsets.only(
             left: 15
           ),
           height: 285,
           child: TrendingMoviesListView(),
         ),

         //Popular People Text
         Padding(
           padding: EdgeInsets.only(
               left: 15,
               top: 5,
               bottom: 5
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Trending Actors',
                 style: GoogleFonts.alata(
                     fontSize: 20,
                     color: Colors.black
                 ),
               ),

             ],
           ),
         ),

         //Popular People ListView
         Container(
           padding: EdgeInsets.only(
               left: 15
           ),
           height: 140,
           child: PeopleListView(),
         ),

         //Trending TV Series Text
         Padding(
           padding: EdgeInsets.only(
               left: 15,
               top: 5,
               bottom: 5
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Trending TV Series',
                 style: GoogleFonts.alata(
                     fontSize: 20,
                     color: Colors.black
                 ),
               ),
             ],
           ),
         ),

         //Trending TV Series List View
         Container(
           padding: EdgeInsets.only(
               left: 15
           ),
           height: 285,
           child: TrendingTVSeriesListView(),
         ),

         //Top Rated Movies Text
         Padding(
           padding: EdgeInsets.only(
               left: 15,
               top: 5,
               bottom: 5
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Top Rated Movies',
                 style: GoogleFonts.alata(
                     fontSize: 20,
                     color: Colors.black
                 ),
               ),
             ],
           ),
         ),

         //Top Rated Movies List View
         Container(
           padding: EdgeInsets.only(
               left: 15
           ),
           height: 285,
           child: TopRatedMoviesListView(),
         ),

         //Top Rated TV Series Text
         Padding(
           padding: EdgeInsets.only(
               left: 15,
               top: 5,
               bottom: 5
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Top Rated TV Series',
                 style: GoogleFonts.alata(
                     fontSize: 20,
                     color: Colors.black
                 ),
               ),
             ],
           ),
         ),

         //Top Rated Movies List View
         Container(
           padding: EdgeInsets.only(
               left: 15
           ),
           height: 285,
           child: TopRatedTVListView(),
         ),

       ],
     );
  }

}
