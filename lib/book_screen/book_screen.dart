import 'package:first_flutter/book_screen/cubit/books_cubit.dart';
import 'package:first_flutter/book_screen/cubit/books_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => BooksBloc()..getBooks(),
      child: BlocConsumer<BooksBloc, BooksState>(
        listener: (ctx, state)
        {

        },
        builder: (ctx, state)
        {
          var model = BooksBloc.get(ctx).model;

          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'Books'
              ),
            ),
            body: state is BooksSuccessState ? ListView.separated(
              itemBuilder: (ctx, index) => buildItem(ctx, index, model),
              physics: BouncingScrollPhysics(),
              separatorBuilder: (ctx, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              itemCount: model.getItems().length,
            ) : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget buildItem(context, index, model) => Container(
    height: 150.0,
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage('${model.getThumbnail(index)}'),
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${model.getTitle(index)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${BooksBloc.get(context).model.getDate(index)}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}