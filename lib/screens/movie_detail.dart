import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:movie_finder/model/movie_detail/movie_detail.dart';
import 'package:movie_finder/movie_detail_widgets/cast_widget.dart';
import 'package:movie_finder/movie_detail_widgets/movie_summary.dart';
import 'package:movie_finder/movie_detail_widgets/recommemded_view.dart';
import 'package:movie_finder/movie_detail_widgets/similar_view.dart';

class MovieDetailScreen extends StatefulWidget {

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();


}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  List<String> mvGenres = [];

  Future<MovieDetail> getMovieDetail(int id) async {
    String searchUrl = 'https://api.themoviedb.org/3/movie/' + id.toString() + '?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';
    String castAndCrewUrl = 'https://api.themoviedb.org/3/movie/' + id.toString() +'/credits?api_key=53b6f70df0427cdf36b1c1679950f19b&language=en-US';

    var response = await get(Uri.parse(searchUrl));
    var json = jsonDecode(response.body);
    MovieDetail movieDetail = MovieDetail.fromJson(json);
    for(int i=0;i<movieDetail.genres.length;i++) {
      mvGenres.add(movieDetail.genres[i].name);
    }
      return movieDetail;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieDetail>(
        future: getMovieDetail(widget.id),
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

                            title: Text(snapshot.data?.original_title ?? '',
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
                                  Tab(text: "Similar"),

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

                                  MovieSummary(
                                      movieTitle: snapshot.data?.original_title ?? '',
                                      genres: mvGenres.toString(),
                                      vote_average: snapshot.data?.vote_average ?? 0,
                                      release_date: snapshot.data?.release_date ?? '',
                                      overview: snapshot.data?.overview ?? '',
                                      runTime: snapshot.data?.runtime ?? 0,
                                    poster_path: snapshot.data?.poster_path ?? '',
                                  ),
                                  CastWidget(id: widget.id),
                                  RecommendedView(id: widget.id,),
                                  SimilarView(id: widget.id),

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