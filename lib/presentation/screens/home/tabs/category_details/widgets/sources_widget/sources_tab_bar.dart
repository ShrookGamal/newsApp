import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/article_list/article_list.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/widgets/sources_widget/source_item.dart';

import '../../../../../../../data/api/model/sources_response/source.dart';

class SourcesTabBar extends StatefulWidget {
  SourcesTabBar({super.key, required this.sources});

  List<Source> sources;

  @override
  State<SourcesTabBar> createState() => _SourcesTabBarState();
}

class _SourcesTabBarState extends State<SourcesTabBar> {
  int clickedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              clickedIndex = index;
              setState(() {});
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.sources
                .map(
                  (source) => SourceItem(
                      source: source,
                      isSelected:
                          widget.sources.indexOf(source) == clickedIndex),
                )
                .toList(),
          ),
        ),
        ArticleList(
          source: widget.sources[clickedIndex],
        ),
      ],
    );
  }
}
