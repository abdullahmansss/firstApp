class BooksModel
{
  final Map response;

  BooksModel({this.response});

  static BooksModel get(response)
  {
    return BooksModel(
      response: response,
    );
  }

  List getItems() => response['items'];

  String getTitle(index) => response['items'][index]['volumeInfo']['title'];

  String getDate(index) => response['items'][index]['volumeInfo']['publishedDate'];

  String getThumbnail(index) => response['items'][index]['volumeInfo']['imageLinks']['thumbnail'];
}