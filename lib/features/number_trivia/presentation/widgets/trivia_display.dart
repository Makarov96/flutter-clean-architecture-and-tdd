import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter/material.dart';

class TriviaeDisplay extends StatelessWidget {
  final NumberTrivia numberTrivia;
  TriviaeDisplay({Key key, @required this.numberTrivia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Text(
              numberTrivia.number.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Text(
                    numberTrivia.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
