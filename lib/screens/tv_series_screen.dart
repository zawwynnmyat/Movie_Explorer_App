import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_finder/widgets/top_rated_tv_series_vertical_list_view.dart';
import 'package:movie_finder/widgets/trending_tv_series_list_vertical.dart';

class TVSeriesScreen extends StatefulWidget {
  const TVSeriesScreen({Key? key}) : super(key: key);


  @override
  State<TVSeriesScreen> createState() => _TVSeriesScreenState();
}

class _TVSeriesScreenState extends State<TVSeriesScreen> {

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
                  image: AssetImage('assets/trend.png'),
                  height: 30,
                  width: 30,
                ),
                child: Text('Trending'),
              ),
              Tab(
                icon: Image(
                  image: AssetImage('assets/top-rated.png'),
                  height: 30,
                  width: 30,
                ),
                child: Text('Top Rated'),
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
                        'Trending TV Series',
                        style: GoogleFonts.alata(
                            fontSize: 17,
                            color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TrendingTVSeriesListVertical(),
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