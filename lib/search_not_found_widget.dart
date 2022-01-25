import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchNotFoundWidget extends StatefulWidget {

  const SearchNotFoundWidget({Key? key, required this.searchTerm}) : super(key: key);
  final String searchTerm;

  @override
  State<SearchNotFoundWidget> createState() => _SearchNotFoundWidgetState();
}

class _SearchNotFoundWidgetState extends State<SearchNotFoundWidget> {

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
                image: AssetImage('assets/empty_box.png'),
                width: 70,
                height: 70,
              ),
              SizedBox(height: 20,),
              Text(
                'Not Found \"' + widget.searchTerm +  '\"',
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