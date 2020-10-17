import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RateLimitReached extends StatefulWidget {
  RateLimitReached({@required this.riveArtboard});
  final Artboard riveArtboard;

  @override
  _RateLimitReachedState createState() => _RateLimitReachedState();
}

class _RateLimitReachedState extends State<RateLimitReached> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Hey!!! \nRate Limit Exceeded. Try in a while.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFFF75280),
                fontWeight: FontWeight.w700,
                fontSize: 20
            ),
          ),
        ),
        Container(
          width: 250,
          height: 250,
          child: Rive(artboard: widget.riveArtboard),),
      ],
    );
  }
}
