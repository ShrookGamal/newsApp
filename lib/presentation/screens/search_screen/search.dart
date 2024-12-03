import 'package:flutter/material.dart';
import 'package:news_app/config/theme/theme.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';

import '../home/tabs/category_details/widgets/article_list/article_item.dart';

class Search extends SearchDelegate {
  ThemeData appBarTheme(BuildContext context) {
    return AppTheme.light;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.search(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          List<Article> articles = snapshot.data?.articles ?? [];
          return Expanded(
              child: ListView.builder(
            itemBuilder: ((context, index) =>
                ArticleItem(article: articles[index])),
            itemCount: articles.length,
          ));
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.search(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          List<Article> articles = snapshot.data?.articles ?? [];
          return Expanded(
              child: ListView.builder(
            itemBuilder: ((context, index) =>
                ArticleItem(article: articles[index])),
            itemCount: articles.length,
          ));
        });
  }
}
