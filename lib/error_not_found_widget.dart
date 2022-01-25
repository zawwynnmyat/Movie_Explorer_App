import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorNotFoundWidget extends StatefulWidget {

  const ErrorNotFoundWidget({Key? key,required this.errorType}) : super(key: key);
  final String errorType;

  @override
  State<ErrorNotFoundWidget> createState() => _ErrorNotFoundWidgetState();
}

class _ErrorNotFoundWidgetState extends State<ErrorNotFoundWidget> {
  
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
                width: 90,
                height: 90,
              ),
              SizedBox(height: 20,),
              Text(
                'There is no ' + widget.errorType + ' at the moment.',
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