import 'package:flutter/material.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:news_app/data/api/api_manager/api_manager.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/article_list/article_item.dart';

import '../../../../../../../data/api/model/sources_response/source.dart';

class ArticleList extends StatelessWidget {
  ArticleList({super.key, required this.source});
  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.status == 'error' || snapshot.hasError) {
            return Text(
                snapshot.data?.message ?? 'check your internet connection');
          }
          List<Article> articles = snapshot.data?.articles ?? [];
          return Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManager.itemDetails,
                      arguments: articles[index]);
                },
                child: ArticleItem(article: articles[index])),
            itemCount: articles.length,
          ));
        });
  }
}
