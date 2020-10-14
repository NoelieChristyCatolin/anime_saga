import 'package:flutter/material.dart';

class RateLimitError extends StatelessWidget {
  const RateLimitError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Rate Limit Exceeded. Try in a while."),
    );
  }
}