import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/data_model/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories/widgets/category_widget.dart';
import '../../../../../core/utils/text_styles.dart';

typedef OnCategoryClicked = void Function(CategoryDM);

class Category extends StatelessWidget {
  Category({super.key, required this.onCategoryClicked});

  OnCategoryClicked onCategoryClicked;
  List<CategoryDM> categoryList = CategoryDM.getCategories();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Pick your category \n of interest',
            style: TextStyles.picCategories,
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25.w,
                mainAxisSpacing: 20.h),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(categoryList[index]);
                },
                child: CategoryWidget(
                  categoryDM: categoryList[index],
                  index: index,
                )),
            itemCount: categoryList.length,
          ))
        ],
      ),
    );
  }
}
