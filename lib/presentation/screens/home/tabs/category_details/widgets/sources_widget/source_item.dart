import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';

import '../../../../../../../data/api/model/sources_response/source.dart';

class SourceItem extends StatelessWidget {
  SourceItem({super.key, required this.source, required this.isSelected});

  bool isSelected;
  Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 15),
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: ColorsManager.green)),
      child: Text(
        source.name ?? '',
        style: GoogleFonts.exo(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: isSelected ? Colors.white : ColorsManager.green),
      ),
    );
  }
}
