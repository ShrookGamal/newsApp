import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constant_manager.dart';

import '../core/utils/strings_manager.dart';

class CategoryDM {
  String backendId;
  String title;

  Color bgColor;
  String imagePath;

  CategoryDM(
      {required this.title,
      required this.bgColor,
      required this.imagePath,
      required this.backendId});

  static List<CategoryDM> getCategories() => [
        CategoryDM(
            title: StringsManger.sport,
            bgColor: ColorsManager.red,
            imagePath: AssetsManager.sportsLogo,
            backendId: ConstantManger.sportsBackendId),
        CategoryDM(
            title: StringsManger.general,
            bgColor: ColorsManager.blue,
            imagePath: AssetsManager.generalLogo,
            backendId: ConstantManger.generalBackendId),
        CategoryDM(
            title: StringsManger.health,
            bgColor: ColorsManager.pink,
            imagePath: AssetsManager.healthLogo,
            backendId: ConstantManger.healthBackendId),
        CategoryDM(
            title: StringsManger.business,
            bgColor: ColorsManager.brown,
            imagePath: AssetsManager.businessLogo,
            backendId: ConstantManger.businessBackendId),
        CategoryDM(
            title: StringsManger.entertainment,
            bgColor: ColorsManager.blueAccent,
            imagePath: AssetsManager.entertainmentLogo,
            backendId: ConstantManger.entertainmentBackendId),
        CategoryDM(
            title: StringsManger.science,
            bgColor: ColorsManager.yellow,
            imagePath: AssetsManager.scienceLogo,
            backendId: ConstantManger.scienceBackendId),
        CategoryDM(
            title: StringsManger.tech,
            bgColor: Colors.grey.withOpacity(0.5),
            imagePath: AssetsManager.technologyLogo,
            backendId: ConstantManger.technologyBackendId),
      ];
}
