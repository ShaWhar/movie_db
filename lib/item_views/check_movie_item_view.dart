import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../constant/strings.dart';
import '../widgets/easy_text_widget.dart';

class CheckMovieItemView extends StatelessWidget {
  const CheckMovieItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kCheckMovieHeight,
      color: kPrimaryColor,
      child: Center(
        child: Container(
          color: kSecondaryColor,
          width: kCheckMovieTextViewWidth,
          height: kCheckMovieTextViewHeight,
          child: const CheckMovieTextView(),
        ),
      ),
    );
  }
}

class CheckMovieTextView extends StatelessWidget {
  const CheckMovieTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: kSP30x, left: kSP30x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              EasyTextWidget(
                text: kMovieShowTimeText,
                color: kWhiteColor,
                fontSize: kFontSize16,
              ),
              Padding(
                padding: EdgeInsets.only(top: kSP35x),
                child:
                EasyTextWidget(text: kSeeMoreText, color: kPlayButtonColor),
              ),
              //UnderlineTextWidget(text: kSeeMoreText)
            ],
          ),
        ),
        const SizedBox(
            width: kPlaceIconWidth,
            child: Padding(
              padding: EdgeInsets.only(left: kSP100x),
              child: Icon(
                Icons.place,
                size: kPlaceIconSize,
                color: kWhiteColor,
              ),
            ))
      ],
    );
  }
}