import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/home_screen.dart';
import 'package:news_app/presentation/screens/home/tabs/item_details/item_details.dart';
import 'package:news_app/presentation/screens/splash/splash_screen.dart';

class RoutesManager {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String categoryDetails = '/details';
  static const String itemDetails = '/itemDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        {
          return MaterialPageRoute(builder: (context) => Splash());
        }
      case home:
        {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
      case itemDetails:
        {
          final Article article = settings.arguments as Article;
          return MaterialPageRoute(
            builder: (context) => ItemDetails(article: article),
          );
        }
    }
  }
}
