
import 'package:first_flutter/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class T1Bloc extends Cubit<T1States>
{
  T1Bloc() : super(T1InitialState());

  static T1Bloc get(BuildContext context)
  {
    return BlocProvider.of(context);
  }

  int number = 0;

  void addition() async
  {
    number++;
    emit(T1AdditionState());
  }

  void subtraction() async
  {
    number--;
    emit(T1SubState());
  }
}