import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends NumberTrivia {

  NumberTriviaModel({@required String text, @required int number}): 
    assert(text != null),
    assert(number != null),
    super(text:text, number:number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
        text: json['text'], number: (json['number'] as num).toInt());
  }

   Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}

/*

 */