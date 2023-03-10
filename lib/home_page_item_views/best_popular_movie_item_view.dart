import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constant/colors.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/details_vo/details_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../pages/details_page.dart';
import '../widgets/easy_text_widget.dart';

class BestPopularMovieItemView extends StatefulWidget {
  final String title;
  final DetailsVO details;
  final GenresVO genres;


  const BestPopularMovieItemView({
    super.key, required this.title, required this.details, required this.genres,


  });

  @override
  State<BestPopularMovieItemView> createState() =>
      _BestPopularMovieItemViewState(title,details,genres);
}

class _BestPopularMovieItemViewState extends State<BestPopularMovieItemView> {
  final ScrollController scrollController = ScrollController();
  List<MovieVO> bestPopularMovies = [];
  final TMDBApply tmdbApply = TMDBApplyImpl();
  int page = 1;
  final String title;
  final DetailsVO details;
  final GenresVO genres;
  _BestPopularMovieItemViewState(this.title, this.details, this.genres);




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
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: EasyTextWidget(
                text: title,
              )),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: bestPopularMovies.length,
                  itemBuilder: (context, index) {
                    return BestPopularMoviesView(
                        movie: bestPopularMovies[index],
                      onTap: (imageURL) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  DetailsPage(
                              //imageURL: 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                              movieID: 1,
                              actors: [],
                              details: details,
                              genres: genres,
                              )
                        ));
                      }, imageURL: '',);
                  }))
        ],
      ),
    );
  }
}

class BestPopularMoviesView extends StatelessWidget {

  const BestPopularMoviesView({Key? key,
    required this.movie,
    required this.onTap,
    required this.imageURL})
      : super(key: key);
  final MovieVO movie;
  final Function(String) onTap;
  final String imageURL;

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
              child: GestureDetector(
                onTap: ()=> onTap(imageURL),
                child: BestPopularMoviesImageView(
                  imageURL: (movie.backdropPath != null)
                      ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
                      : 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                ),
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