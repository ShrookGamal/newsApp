import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/colors_manager.dart';

import '../../../../core/utils/text_styles.dart';

typedef OnItemClicked = void Function(menuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onItemClicked});

  OnItemClicked onItemClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              height: 110.h,
              width: double.infinity,
              color: ColorsManager.green,
              child: Text(
                'News App!',
                style: TextStyles.drawerTitle,
              )),
          Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    onItemClicked(menuItem.categories);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Categories',
                        style: TextStyles.drawerItem,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    onItemClicked(menuItem.settings);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 33.sp,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Settings',
                        style: TextStyles.drawerItem,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum menuItem { categories, settings }
