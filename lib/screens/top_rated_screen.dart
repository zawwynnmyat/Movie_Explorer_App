import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/widgets/top_rated_tv_series_vertical_list_view.dart';
import 'package:movie_finder/widgets/toprated_movies_vertical_list_view.dart';

class TopRatedScreen extends StatefulWidget {
  const TopRatedScreen({Key? key}) : super(key: key);


  @override
  State<TopRatedScreen> createState() => _TopRatedScreenState();
}

class _TopRatedScreenState extends State<TopRatedScreen> {

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
       length: 2,
       child: Scaffold(
         appBar: AppBar(
           backgroundColor: Color.fromRGBO(1, 1, 121, 1),
           bottom: const TabBar(
             indicatorColor: Colors.amber,
             tabs: [
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
           toolbarHeight: 0,
         ),
         body: TabBarView(
           children: [
             //Top Rated Movie
             Column(
               children: [
                 Padding(
                   padding: EdgeInsets.only(
                       left: 15,
                       top: 2,
                       bottom: 2
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Top Rated Movies',
                         style: GoogleFonts.alata(
                             fontSize: 17,
                             color: Colors.black
                         ),
                       ),
                     ],
                   ),
                 ),
                 Expanded(
                   child: TopRatedMoviesVerticalListView(),
                 ),
               ],
             ),

             //Top Rated TV Series
             Column(
               children: [
                 Padding(
                   padding: EdgeInsets.only(
                       left: 15,
                       top: 2,
                       bottom: 2
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Top Rated TV Series',
                         style: GoogleFonts.alata(
                             fontSize: 17,
                             color: Colors.black
                         ),
                       ),
                     ],
                   ),
                 ),
                 Expanded(
                   child: TopTVSeriesListView(),
                 ),
               ],
             ),
           ],
         ),
       ),
     );
  }

}