import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_db_zoom/constant/strings.dart';
import 'package:movie_db_zoom/data/apply/tmdb_apply.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/vos/details_vo/details_vo.dart';
import '../widgets/easy_text_widget.dart';
import '../widgets/title_widget.dart';

class DetailsPageHeaderItemView extends StatelessWidget {
  const DetailsPageHeaderItemView({
    super.key,
    required this.tmdbApply,
    required this.details,
  });
  final TMDBApply tmdbApply;
  final DetailsVO details;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DetailsVO>?>(
        future: tmdbApply.getMovieDetail(1),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapShot.hasError) {
            return const Center(
              child: Text("Fetching Error Occur"),
            );
          }
          final List<DetailsVO> headerImage =
          snapShot.data?.first as List<DetailsVO>;
          return HeaderImageItemView(headerImageURL:  headerImage.first.backdropPath ?? '',
              movies: headerImage ?? [],
            rate: details.voteAverage?.toDouble() ?? 0.0,
            releaseDate: details.releaseDate ?? '',
            movieName: details.originalTitle ?? '',
          );
        });
  }
}

class HeaderImageItemView extends StatelessWidget {
  const HeaderImageItemView({
    super.key,
    required this.headerImageURL,
    required this.movies,
    required this.rate,
    required this.releaseDate,
    required this.movieName,
  });

  final String headerImageURL;
  final List<DetailsVO> movies;
  final double rate;
  final String releaseDate;
  final String movieName;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kDetailsPageHeaderContainerHeight,
      color: kSecondaryColor,
      child: Stack(
        children: [
          const LinearGradientWidget(),
          DetailsHeaderImage(imageURL: headerImageURL),
          Padding(
            padding: const EdgeInsets.only(top: kSP120x, left: kSP10x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                DateAndRatingView(rate: rate,
                  releaseDate: releaseDate,
                  text: rate.toString()),
                const SizedBox(
                  width: 5,
                ),
                TitleWidget(title: movieName),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class LinearGradientWidget extends StatelessWidget {
  const LinearGradientWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kTransparentColor,
              kPrimaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
    );
  }
}

class DateAndRatingView extends StatelessWidget {
  const DateAndRatingView({
    Key? key,
    required this.releaseDate,
    required this.text,
    required this.rate,
  }) : super(key: key);
  final String releaseDate;
  final String text;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Chip(
          elevation: 2,
          backgroundColor: kPlayButtonColor,
          label:  EasyTextWidget( text: releaseDate),
          labelStyle: const TextStyle(fontSize: kFontSize14, color: kWhiteColor),
        ),
        const SizedBox(width: kDateAndRatingViewSizedBoxWidth),
        StarRatingWidget(rate: rate),
         EasyTextWidget(
          fontSize: kFontSize28,
          fontWeight: FontWeight.bold,
          color: kWhiteColor,
          text: text,
        ),
      ],
    );
  }
}

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({Key? key, required this.rate})
      : super(key: key);
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingBar.builder(
              itemSize: 15,
              initialRating: rate,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
        const EasyTextWidget(text: kVoting)
      ],
    );


  }
}



class DetailsHeaderImage extends StatelessWidget {
  const DetailsHeaderImage({
    super.key,
    required this.imageURL,

  });
  final String imageURL;



  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      imageUrl: imageURL,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: kGreyColor,
        ),
      ),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error)),
    );
  }
}