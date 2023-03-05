import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constant/colors.dart';
import '../constant/strings.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../widgets/easy_text_widget.dart';

class BestPopularMovieItemView extends StatefulWidget {
  const BestPopularMovieItemView({
    super.key,
  });

  @override
  State<BestPopularMovieItemView> createState() =>
      _BestPopularMovieItemViewState();
}

class _BestPopularMovieItemViewState extends State<BestPopularMovieItemView> {
  final ScrollController scrollController = ScrollController();
  List<MovieVO> bestPopularMovies = [];
  final TMDBApply tmdbApply = TMDBApplyImpl();
  int page = 1;

  @override
  void initState() {
    tmdbApply.getNowPlayingMovie(page).then((value) {
      setState(() {
        bestPopularMovies = value ?? [];
      });
    });
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          page++;
          tmdbApply.getNowPlayingMovie(page).then((value) {
            final temp = value ?? [];
            if (temp.isNotEmpty) {
              temp.forEach((movie) {
                bestPopularMovies.add(movie);
              });
              setState(() {});
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: kPrimaryColor,
      child: bestPopularMovies.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: EasyTextWidget(
                text: kBestPopularMoviesTitle,
              )),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: bestPopularMovies.length,
                  itemBuilder: (context, index) {
                    return BestPopularMoviesView(
                        movie: bestPopularMovies[index]);
                  }))
        ],
      ),
    );
  }
}

class BestPopularMoviesView extends StatelessWidget {
  const BestPopularMoviesView({Key? key, required this.movie})
      : super(key: key);
  final MovieVO movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 6,
              child: BestPopularMoviesImageView(
                imageURL: (movie.backdropPath != null)
                    ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
                    : 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
              )),
          const SizedBox(
            height: 5,
          ),
          BestPopularMovieTitleView(movieName: movie.originalTitle ?? ''),
          const SizedBox(
            height: 5,
          ),
          BestPopularMoviesRateAndRatingStarView(
              rate: movie.voteAverage?.toDouble() ?? 0.0)
        ],
      ),
    );
  }
}

class BestPopularMoviesRateAndRatingStarView extends StatelessWidget {
  const BestPopularMoviesRateAndRatingStarView({Key? key, required this.rate})
      : super(key: key);
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rate.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white),
        ),
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
        )
      ],
    );
  }
}

class BestPopularMovieTitleView extends StatelessWidget {
  const BestPopularMovieTitleView({
    super.key,
    required this.movieName,
  });

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieName,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    );
  }
}

class BestPopularMoviesImageView extends StatelessWidget {
  const BestPopularMoviesImageView({
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