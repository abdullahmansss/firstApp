import 'dart:convert';

import 'package:first_flutter/book_screen/cubit/books_states.dart';
import 'package:first_flutter/models/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class BooksBloc extends Cubit<BooksState>
{
  BooksBloc() : super(BooksInitialState());

  static BooksBloc get(BuildContext context)
  {
    return BlocProvider.of(context);
  }

  BooksModel model;

  getBooks() async
  {
    var url = 'https://www.googleapis.com/books/v1/volumes?q=cars';
    var response = await http.get(url);

    Map res = json.decode(response.body);
    model = BooksModel.get(res);

    print('-------> ${res['items'][0].toString()}');

    emit(BooksSuccessState());
  }
}