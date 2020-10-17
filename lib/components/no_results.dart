import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Something exciting is about to come!'),
          SizedBox(height: 10),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}