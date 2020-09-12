
class PostsModel {
  bool status;
  int count;
  int count_total;
  int pages;
  List<PostsDetailsModels> posts;
}

class PostsDetailsModels {
  int id;
  String title;
  String content;
  String date;
}

class PostsModel2 {
  Map response;

  int getCount() => response['count'];
  int getPages() => response['pages'];

  List getPosts() => response['posts'];

  String getTitle() => getPosts()[0]['title'];
}