import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTvAlertWidget extends StatefulWidget {

  const SearchTvAlertWidget({Key? key}) : super(key: key);

  @override
  State<SearchTvAlertWidget> createState() => _SearchTvAlertWidgetState();
}

class _SearchTvAlertWidgetState extends State<SearchTvAlertWidget> {

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
                image: AssetImage('assets/tv.png'),
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20,),
              Text(
                'Type and Search TV Shows',
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