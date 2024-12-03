import 'package:flutter/material.dart';
import 'package:news_app/data/api/model/sources_response/source.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/sources_widget/sources_tab_bar.dart';

import '../../../../../data/api/api_manager/api_manager.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(categoryDM.backendId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.status == 'error' || snapshot.hasError) {
            return Text(snapshot.data?.message ?? 'check internet connection');
          }
          List<Source> sources = snapshot.data?.sources ?? [];
          return SourcesTabBar(sources: sources);
        });
  }
}
