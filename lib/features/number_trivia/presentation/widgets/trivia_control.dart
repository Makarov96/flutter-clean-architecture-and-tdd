import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/presentation/bloc/bloc/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaControl extends StatefulWidget {
  const TriviaControl({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlState createState() => _TriviaControlState();
}

class _TriviaControlState extends State<TriviaControl> {
  String inputStr;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //TextField
      TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        onChanged: (value) => inputStr = value,
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Input a number'),
        onSubmitted: (_) {
          dispachtConcrete();
        },
      ),
      SizedBox(height: 10.0),
      Row(
        children: [
          Expanded(
            child: RaisedButton(
              onPressed: dispachtConcrete,
              child: Text('Search'),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: RaisedButton(
              onPressed: dispachtRandom,
              child: Text('Get random trivia'),
            ),
          )
        ],
      )
    ]);
  }

  void dispachtConcrete() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputStr));
  }

  void dispachtRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  }
}
