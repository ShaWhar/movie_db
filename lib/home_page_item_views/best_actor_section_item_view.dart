import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_zoom/constant/api_constant.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../constant/strings.dart';
import '../data/apply/actors_apply.dart';
import '../data/vos/actors_vo/actors_vo.dart';
import '../widgets/easy_text_widget.dart';

class BestActorsItemView extends StatelessWidget {
  BestActorsItemView(
      {super.key,
        required this.actors,
        required  this.pageController,
      });
   List<ActorsVO>? actors;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    print('actors: $actors?.length');
    return Container(
      width: double.infinity,
      height: kBestActorHeight,
      color: kPrimaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kBestActorTitleSizedBoxHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                EasyTextWidget(
                  text: kBestActorsTitle,
                ),
                SizedBox(
                  width: kActorsSizedBoxWidth,
                ),
                EasyTextWidget(
                  text: kMoreActors,
                  color: kWhiteColor,
                ),],),),
          Expanded(
            flex: 2,
            child: ListView.builder(
              //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: actors?.length,
                itemBuilder: (context, index) {
                  var image = actors?[index].profilePath;
                  print(actors?[index].profilePath);

                  return ActorView(imageURL: (image != null) ?
                  'https://image.tmdb.org/t/p/w500$image'
                      : 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                    actorName: actors?[index].name ?? '',);

                }),
          )
        ],
      ),
    );
  }
}

class ActorView extends StatelessWidget {
  const ActorView({super.key,
    required this.imageURL,
    required this.actorName,});
  final String imageURL;
  final String actorName;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        height: kActorViewHeight,
        width: kActorViewWidth,
        color: kGreyColor,
        child: Stack(children: [
          Positioned.fill(
            child: ActorImageView(
              //key: Key(imageURL),
              imageURL: imageURL,
            ),
          ),
          const Positioned(
            top: kSP5x,
            right: kSP5x,
            child: Icon(
              Icons.favorite_border_outlined,
              color: kWhiteColor,
            ),
          ),
          ActorTitleView(
            actorsName: actorName,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ]));
  }
}

class BestActorSectionItemView extends StatefulWidget {
  const   BestActorSectionItemView({super.key,
    required this.actorsApply,
    required PageController controller,
  }) : _controller = controller;
  final ActorsApply actorsApply;
  final PageController _controller;

  @override
  State<BestActorSectionItemView> createState() => _BestActorSectionItemViewState();
}

class _BestActorSectionItemViewState extends State<BestActorSectionItemView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActorsVO>?>(
        future: widget.actorsApply.getActors(1),
            //.then((actorsList) => <CastAndCrewVO> []),
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
          final List<ActorsVO>? actorViewList =
          snapShot.data?.take(5).toList();
          return BestActorsItemView(
            pageController: widget._controller,
            actors: actorViewList ?? [],
          );


        });
  }
}

class ActorTitleView extends StatelessWidget {
  const ActorTitleView(
      {super.key,
        required this.actorsName,
        required this.fontWeight,
        required this.fontSize,});

  final String actorsName;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSP10x,vertical: kSP10x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            actorsName,
            style: TextStyle(
              color: kWhiteColor,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
          const EasyTextWidget(text: kLikeMovies)
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  const ActorImageView({super.key,
    required this.imageURL,});
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