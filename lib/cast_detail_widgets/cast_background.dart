import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CastBackground extends StatefulWidget {
  const CastBackground({Key? key, required this.profile_path, required this.name}) : super(key: key);
  final String? profile_path;
  final String name;

  @override
  State<CastBackground> createState() => _CastBackgroundState();
}

class _CastBackgroundState extends State<CastBackground> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(1, 1, 121, 1),
      child: CircleAvatar(

        backgroundColor: Colors.amber,
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/original' + widget.profile_path!,
          imageBuilder: (context, imageProvider) => Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}