import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/data/api/model/articles_response/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/text_styles.dart';

class ItemDetails extends StatefulWidget {
  ItemDetails({super.key, required this.article});

  Article article;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final url = Uri.parse(widget.article.url ?? '');
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image:
                DecorationImage(image: AssetImage(AssetsManager.scaffoldBg))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'News App!',
              style: TextStyles.appBar,
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: widget.article.urlToImage ?? '',
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
                    widget.article.source?.name ?? '',
                    style: GoogleFonts.poppins(
                        color: Color(0XFF79828B),
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    widget.article.title ?? '',
                    style: GoogleFonts.poppins(
                        color: ColorsManager.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    timeago.format(DateTime.parse(widget.article.publishedAt!)),
                    textAlign: TextAlign.end,
                    style: GoogleFonts.inter(
                        color: Color(0XFFA3A3A3),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    widget.article.content ?? '',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Color(0XFF42505C)),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () => {
                      launchUrl(url, mode: LaunchMode.externalApplication),
                      setState(() {})
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'view full article',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF42505C)),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  )
                ]),
          ),
        ));
  }
}
