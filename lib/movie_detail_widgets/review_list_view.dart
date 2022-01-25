import 'package:flutter/material.dart';
import 'package:movie_finder/movie_detail_widgets/review_list_tile.dart';
class ReviewListView extends StatefulWidget {
  const ReviewListView({Key? key}) : super(key: key);


  @override
  State<ReviewListView> createState() => _ReviewListViewState();
}

class _ReviewListViewState extends State<ReviewListView> {

  @override
  Widget build(BuildContext context) {
     return ListView.builder(
         itemBuilder: (context, index) {
           return ReviewListTile();
         },
       itemCount: 10,
     );
  }

}