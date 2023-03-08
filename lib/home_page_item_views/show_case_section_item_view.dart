import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../constant/strings.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../pages/details_page.dart';
import '../widgets/easy_text_widget.dart';
import 'banner_section_item_view.dart';

class ShowCaseItemView extends StatelessWidget {
  const ShowCaseItemView(
      {Key? key,
        required this.movies,
        required this.pageController,
      })
      : super(key: key);
  final List<MovieVO> movies;
  final PageController pageController;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kShowCaseHeight,
      color: kSecondaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kTitleSizedBoxHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                EasyTextWidget(
                  text: kShowCaseTitle,
                ),
                SizedBox(
                  width: kSizedBoxWidth,
                ),
                EasyTextWidget(
                  text: kMoreShowCases,
                  color: kWhiteColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal  ,
                //controller: pageController,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  var image = movies[index].backdropPath;
                  return ShowCaseView(imageURL: (image != null)
                      ? 'https://image.tmdb.org/t/p/w500$image'
                      : 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                      movieName: movies[index].originalTitle ?? '',
                    releaseDate: movies[index].releaseDate ?? '',
                    onTap: (imageURL) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailsPage(imageURL:
                          'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',)
                      ));
                    },


                  );
                }),
          )
        ],
      ),
    );
  }
}

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({super.key,
    required this.imageURL,
    required this.movieName,
    required this.releaseDate, required  this.onTap,
  });

  final String imageURL;
  final String movieName;
  final String releaseDate;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        height: kShowCaseViewHeight,
        width: kShowCaseViewWidth,
        //color: kWhiteColor,
        child: GestureDetector(
          onTap: ()=> onTap(imageURL),
          child: Stack(children: [
            Positioned.fill(child: ShowCaseImageView(imageURL: imageURL)),
            const Center(child: PlayButtonView()),

            ShowCaseTitleView(
                movieName: movieName,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              releaseDate: releaseDate,),
          ]),
        ));
  }}

class ShowCaseSectionItemView extends StatefulWidget {
  const ShowCaseSectionItemView({
    super.key,
    required this.tmdbApply,
    required PageController controller,
  }) : _controller = controller;

  final TMDBApply tmdbApply;
  final PageController _controller;

  @override
  State<ShowCaseSectionItemView> createState() => _ShowCaseSectionItemViewState();
}

class _ShowCaseSectionItemViewState extends State<ShowCaseSectionItemView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
        future: widget.tmdbApply.getNowPlayingMovie(1),
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
          final List<MovieVO>? showCaseMovieList =
          snapShot.data?.take(5).toList();
          return ShowCaseItemView(
            pageController: widget._controller,
            movies: showCaseMovieList ?? [],
          );
        });
  }
}

class ShowCaseTitleView extends StatelessWidget {
  const ShowCaseTitleView(
      {super.key,
        required this.movieName,
        required this.fontWeight,
        required this.fontSize,
      required this.releaseDate });

  final String movieName;
  final FontWeight fontWeight;
  final double fontSize;
  final String releaseDate;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP10x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            movieName,
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
          EasyTextWidget(text: releaseDate)
        ],
      ),
    );
  }
}

class ShowCaseImageView extends StatelessWidget {
  const ShowCaseImageView({
    super.key,
    required this.imageURL,
  });

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageURL,
      placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error)),
    );
  }
}