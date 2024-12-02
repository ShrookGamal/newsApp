import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data_model/category_DM.dart';

import '../../../../../../core/utils/text_styles.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.categoryDM, required this.index});

  CategoryDM categoryDM;

  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
            bottomRight: Radius.circular(index.isEven ? 18.r : 0),
            bottomLeft: Radius.circular(index.isEven ? 0 : 18.r),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            categoryDM.imagePath,
            width: 132.w,
            height: 116.h,
          ),
          Text(categoryDM.title, style: TextStyles.categoriesTitle)
        ],
      ),
    );
  }
}
