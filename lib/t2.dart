import 'package:first_flutter/bloc/bloc.dart';
import 'package:first_flutter/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class T2Screen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<T1Bloc,T1States>(
      listener: (context,state)
      {
        if(state is T1AdditionState) {
          print('addition');
        }
        if(state is T1SubState) {
          print('sub');
        }
      },
      builder: (context,state)
      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed:(){
                T1Bloc.get(context).addition();
              },
              child: Text('add'),
            ),
            Text(
              T1Bloc.get(context).number.toString(),
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            FlatButton(
              onPressed:(){
                T1Bloc.get(context).subtraction();
              },
              child: Text('sub'),
            ),
          ],
        );
      },
    );
  }
}