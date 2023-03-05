import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_zoom/data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../constant/strings.dart';
import '../data/apply/cast_apply.dart';
import '../widgets/easy_text_widget.dart';

class BestActorsItemView extends StatelessWidget {
  const BestActorsItemView(
      {Key? key,
        required this.cast,
        required  this.pageController,
      })
      : super(key: key);
  final List<CastAndCrewVO> cast;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              //shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cast.length,
                itemBuilder: (context, index) {
                  var image = cast[index].profilePath;
                  return ActorView(imageURL: (image != null)
                      ?  'https://image.tmdb.org/t/p/w500$image'
                      : 'https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg',
                    actorName: cast[index].name ?? '',);
                }),
          )
        ],
      ),
    );
  }
}

class ActorView extends StatelessWidget {
  const ActorView({
    Key? key,
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
          ActorImageView(
            key: Key(imageURL),
            imageURL: imageURL,
          ),
          const Center(
            child: Icon(
              Icons.favorite_border_outlined,
              color: kWhiteColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ActorTitleView(
              actorName: actorName,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ]));
  }
}

class BestActorSectionItemView extends StatefulWidget {
  const   BestActorSectionItemView({super.key,
    required this.castView,
    required PageController controller,
  }) : _controller = controller;
  final CastApply castView;
  final PageController _controller;

  @override
  State<BestActorSectionItemView> createState() => _BestActorSectionItemViewState();
}

class _BestActorSectionItemViewState extends State<BestActorSectionItemView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CastAndCrewVO>?>(
        future: widget.castView.castView(1),
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
          final List<CastAndCrewVO>? actorViewList =
          snapShot.data?.take(5).cast<CastAndCrewVO>().toList();
          return BestActorsItemView(
            pageController: widget._controller,
            cast: actorViewList ?? [],
          );

        });
  }
}

class ActorTitleView extends StatelessWidget {
  const ActorTitleView(
      {super.key,
        required this.actorName,
        required this.fontWeight,
        required this.fontSize,});

  final String actorName;
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
            actorName,
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
  const ActorImageView({
    Key? key,
    required this.imageURL,});
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageURL,
        placeholder: (context, url) =>
        const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
        const Center(child: Icon(Icons.error)),
      ),
    );
  }
}