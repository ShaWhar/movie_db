import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../pages/details_page.dart';

class BannerSectionItemView extends StatelessWidget {
  const BannerSectionItemView({
    super.key,
    required this.tmdbApply,
    required PageController controller,
  }) : _controller = controller;

  final TMDBApply tmdbApply;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieVO>?>(
        future: tmdbApply.getNowPlayingMovie(1),
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
          final List<MovieVO>? bannerMovieList =
          snapShot.data?.take(5).toList();
          return BannerMovieItemView(
            onDottedClick: (index) {
              _controller.animateToPage(index,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            pageController: _controller,
            movies: bannerMovieList ?? [],
          );
        });
  }
}

class BannerMovieItemView extends StatelessWidget {
  const BannerMovieItemView(
      {Key? key,
        required this.movies,
        required this.pageController,
        required this.onDottedClick,
        //required this.movieID
      })
      : super(key: key);
  final List<MovieVO> movies;
  final PageController pageController;
  final Function(int) onDottedClick;
  //final int movieID;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMovieBannerHeight,
      color: kPrimaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
                controller: pageController,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  var image = movies[index].backdropPath;
                  return BannerImageView(
                      movieName: movies[index].originalTitle ?? '',
                      imageURL: (image != null)
                          ? 'https://image.tmdb.org/t/p/w500$image'
                          : 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                    onTap: (imageURL) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const DetailsPage(
                            //imageURL: 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                            movieID: 1,)
                      ));
                    },
                  );

                }),
          ),
          const SizedBox(
            height: kMovieBannerSizedBoxHeight,
          ),
          Center(
            child: SmoothPageIndicatorView(
                onDottedClick: onDottedClick,
                pageController: pageController,
                movies: movies),
          ),
        ],
      ),
    );
  }
}

class SmoothPageIndicatorView extends StatelessWidget {
  const SmoothPageIndicatorView({
    super.key,
    required this.onDottedClick,
    required this.pageController,
    required this.movies,
  });

  final Function(int p1) onDottedClick;
  final PageController pageController;
  final List<MovieVO> movies;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      onDotClicked: (index) => onDottedClick(index),
      controller: pageController,
      count: movies.length,
      axisDirection: Axis.horizontal,
      effect: const SlideEffect(
          dotHeight: 8,
          dotWidth: 8,
          spacing: 6.0,
          radius: 20,
          dotColor: kGreyColor,
          activeDotColor: kYellowColor),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView(
      {Key? key,
        required this.imageURL,
        required this.movieName,
        required this.onTap})
      : super(key: key);
  final String imageURL;
  final String movieName;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///Movie Image View
        MovieImageView(imageURL: imageURL,),

        ///Gradient View
        const GradientView(),

        ///Play Button View
        GestureDetector(
            onTap: ()=> onTap(imageURL),
            child: const Center(child: PlayButtonView())),

        /// Movie Title View
        MovieTitleView(
          movieName: movieName,
          fontWeight: kFontWeight600,
          fontSize: kFontSize23,
        ),
      ],
    );
  }
}

class MovieImageView extends StatelessWidget {
  const MovieImageView({
    super.key,
    required this.imageURL,
  });

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      imageUrl: imageURL,
      placeholder: (context, url) =>
      const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
      const Center(child: Icon(Icons.error)),
    );
  }
}

class GradientView extends StatelessWidget {
  const GradientView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [kTransparentColor, kPrimaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.play_circle,
      size: kPlayButtonSize,
      color: kPlayButtonColor,
    );
  }
}

class MovieTitleView extends StatelessWidget {
  const MovieTitleView(
      {super.key,
        required this.movieName,
        required this.fontWeight,
        required this.fontSize,});

  final String movieName;
  final FontWeight fontWeight;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x, vertical: kSP10x),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          movieName,
          style: TextStyle(
            color: kWhiteColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}