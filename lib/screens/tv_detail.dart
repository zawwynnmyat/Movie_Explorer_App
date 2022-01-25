import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:movie_finder/model/tv_detail/series_detail.dart';
import 'package:movie_finder/tv_detail_widgets/tv_casts_list_view.dart';
import 'package:movie_finder/tv_detail_widgets/tv_recommended_view.dart';
import 'package:movie_finder/tv_detail_widgets/tv_similar_list_view.dart';
import 'package:movie_finder/tv_detail_widgets/tv_summary.dart';

class TVDetailScreen extends StatefulWidget {

  const TVDetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _TVDetailScreenState createState() => _TVDetailScreenState();


}

class _TVDetailScreenState extends State<TVDetailScreen> {

  List<String> mvGenres = [];

  Future<SeriesDetail> getTvSeriesDetail(int id) async {
    String searchUrl = 'https://api.themoviedb.org/3/tv/' + id.toString() + '?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';

    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    SeriesDetail seriesDetail = SeriesDetail.fromJson(json);
    for(int i=0;i<seriesDetail.genres.length;i++) {
      mvGenres.add(seriesDetail.genres[i].name);
    }
    return seriesDetail;
  }

  void test(int id) async {
    String searchUrl = 'https://api.themoviedb.org/3/tv/' + id.toString() + '?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';

    try {
      var response = await get(Uri.parse(searchUrl));
      var json = jsonDecode(response.body);
      SeriesDetail seriesDetail = SeriesDetail.fromJson(json);
    } catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test(widget.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<SeriesDetail>(
          future: getTvSeriesDetail(widget.id),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasData) {
                return DefaultTabController(
                  length: 4,
                  child: NestedScrollView(
                      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                        return <Widget>[
                          SliverAppBar(
                            expandedHeight: 200.0,
                            floating: true,
                            pinned: true,
                            backgroundColor: Color.fromRGBO(1, 1, 121, 1),

                            title: Text(snapshot.data?.original_name ?? '',
                              style: GoogleFonts.alata(),
                              overflow: TextOverflow.fade,
                            ),

                            flexibleSpace: FlexibleSpaceBar(


                              background: Container(
                                height: 170.0,
                                foregroundDecoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent, Colors.transparent, Colors.transparent],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0, 0.8, 0.4, 1],
                                  ),
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: "https://image.tmdb.org/t/p/original" + (snapshot.data?.poster_path ?? ''),
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
                              ),
                            ),
                          ),
                          SliverPersistentHeader(
                            floating: false,
                            delegate: _SliverAppBarDelegate(
                              TabBar(
                                physics: BouncingScrollPhysics(),
                                isScrollable: true,
                                labelColor: Color.fromRGBO(1, 1, 121, 1),
                                indicatorColor: Color.fromRGBO(1, 1, 121, 1),
                                labelStyle: GoogleFonts.lato(),
                                unselectedLabelColor: Colors.black,
                                automaticIndicatorColorAdjustment: true,
                                tabs: [
                                  Tab(text: "Summary",),
                                  Tab(text: "Casts"),
                                  Tab(text: "Recommended",),
                                  Tab(text: "Similar TV Shows"),

                                ],
                              ),
                            ),
                            pinned: true,

                          ),
                        ];
                      },
                      body: Column(
                        children: [
                          Expanded(
                              child: TabBarView(
                                children: [

                                  TvSummary(
                                    movieTitle: snapshot.data?.original_name ?? '',
                                    genres: mvGenres.toString(),
                                    vote_average: snapshot.data?.vote_average ?? 0,
                                    season: snapshot.data?.number_of_seasons ?? 0,
                                    overview: snapshot.data?.overview ?? '',
                                    episodes:  snapshot.data?.number_of_episodes ?? 0,
                                    poster_path: snapshot.data?.poster_path ?? '',
                                  ),
                                  TvCastsListView(id: widget.id),
                                  TvRecommendedView(id: widget.id,),
                                  TvSimilarView(id: widget.id),
                                ],
                              )
                          )
                        ],
                      )
                  ),
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
                        'Couldn\'nt load',
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
          },
        )
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}