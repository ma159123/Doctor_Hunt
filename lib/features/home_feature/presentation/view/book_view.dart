import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('book'),
        ),
      ),
    );
  }
}
