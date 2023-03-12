import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';
import '../data/vos/details_vo/details_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../widgets/easy_text_widget.dart';

class AboutFilmItemView extends StatelessWidget {
  const AboutFilmItemView({
    Key? key, required this.details, required this.genres,
  }) : super(key: key);
  final DetailsVO details;
  final GenresVO genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 340,
      color: kSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EasyTextWidget(
              text: kAboutFilm,
            ),
            Row(
              children:  [
                const SizedBox(
                    width: 120, child: EasyTextWidget(text: kOriginalTitle)),
                EasyTextWidget(text: details.backdropPath)
              ],
            ),
            Row(
              children:  [
                const SizedBox(width: 120, child: EasyTextWidget(text: kType)),
                EasyTextWidget(text: genres.name)
              ],
            ),
            Row(
              children:  [
                const SizedBox(width: 120, child: EasyTextWidget(text: kProduction)),
                EasyTextWidget(text: details.productionCountries.toString())
              ],
            ),
            Row(
              children:  [
                const SizedBox(width: 120, child: EasyTextWidget(text: kPremiere)),
                EasyTextWidget(text: details.releaseDate)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 120, child: EasyTextWidget(text: kDescription)),
                EasyTextWidget(
                    text: details.overview
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}