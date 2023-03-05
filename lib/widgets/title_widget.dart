import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimes.dart';
import 'easy_text_widget.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSP5x),
          child: EasyTextWidget(
              text: title,
              fontSize: kFontSize20,
              color: kWhiteColor,
              fontWeight: kFontWeight600),
        ));
  }
}
