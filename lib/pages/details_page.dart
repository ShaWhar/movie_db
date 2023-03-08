import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../data/apply/actors_apply.dart';
import '../data/apply/actors_apply_impl.dart';
import '../data/apply/cast_apply.dart';
import '../data/apply/cast_apply_impl.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/movie_vo/movie_vo.dart';
import '../details_page_item_views/sliver_app_bar_item_view.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required imageURL,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<MovieVO> bestPopularMovies = [];
  final PageController _controller = PageController();
  final TMDBApply tmdbApply = TMDBApplyImpl();
  final CastApply castView = CastApplyImpl();
  final ActorsApply actorsView = ActorsApplyImpl();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        const SliverAppBarItemView()
            ],
                body: Container(
                  width: double.infinity,
                  height: 250,
                  color: kWhiteColor,
                ),
    ));
  }
}


