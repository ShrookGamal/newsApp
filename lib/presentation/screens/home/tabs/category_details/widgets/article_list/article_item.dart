import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import '../../../../../../../data/api/model/articles_response/article.dart';

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.source?.name ?? '',
              style: GoogleFonts.poppins(
                  color: Color(0XFF79828B),
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.title ?? '',
              style: GoogleFonts.poppins(
                  color: ColorsManager.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              article.publishedAt ?? '',
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                  color: Color(0XFFA3A3A3),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            )
          ]),
    );
  }
}
