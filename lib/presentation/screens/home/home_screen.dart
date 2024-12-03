import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/categoties.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings.dart';
import 'package:news_app/presentation/screens/search_screen/search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;
  String appBarTitle = 'News App';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = Category(onCategoryClicked: onCategoryClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(AssetsManager.scaffoldBg))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(appBarTitle),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: Icon(Icons.search))
          ],
        ),
        drawer: HomeDrawer(
          onItemClicked: onClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  void onClicked(menuItem item) {
    Navigator.pop(context);
    if (item == menuItem.categories) {
      selectedWidget = Category(
        onCategoryClicked: onCategoryClicked,
      );
    }
    if (item == menuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }

  onCategoryClicked(CategoryDM category) {
    selectedWidget = CategoryDetails(
      categoryDM: category,
    );
    appBarTitle = category.title;
    setState(() {});
  }
}

