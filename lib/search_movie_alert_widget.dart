import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchMovieAlertWidget extends StatefulWidget {

  const SearchMovieAlertWidget({Key? key}) : super(key: key);

  @override
  State<SearchMovieAlertWidget> createState() => _SearchMovieAlertWidgetState();
}

class _SearchMovieAlertWidgetState extends State<SearchMovieAlertWidget> {

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/clapperboard.png'),
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20,),
              Text(
                'Type and Search Movies',
                style: GoogleFonts.alata(
                    fontSize: 20,
                    color: Color.fromRGBO(1, 1, 121, 1)
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
    );
  }

}