import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/presentation/bloc/bloc/number_trivia_bloc.dart';
import 'package:CLEAN_ARCHITECTURE_TDD_COURSE/features/number_trivia/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number trivia'),
      ),
      body: SingleChildScrollView(child: buildBlody(context)),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBlody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              //top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empy) {
                    return MessageDisplay(
                      message: 'Start searching',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaeDisplay(numberTrivia: state.trivia);
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                },
              ),

              SizedBox(height: 20.0),
              //Bottom half
              TriviaControl()
            ],
          ),
        ),
      ),
    );
  }
}
