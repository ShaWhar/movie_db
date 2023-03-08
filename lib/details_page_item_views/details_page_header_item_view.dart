import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/dimes.dart';

class DetailsPageHeaderItemView extends StatelessWidget {
  const DetailsPageHeaderItemView({
    Key? key,
    required this.imageURL,
  }) : super(key: key);
  final String  imageURL;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kDetailsPageHeaderContainerHeight,
      color: kGreyColor,
      child: Stack(
        children: [

          const DetailsHeaderImage(imageURL: '',
          ),
          Padding(
            padding: const EdgeInsets.only(top: kSP120x, left: kSP10x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //DateAndRatingView(),
                SizedBox(
                  width: 5,
                ),
                //TitleWidget(title: kDetailsPageTitle),
              ],
            ),
          ),
          //const LinearGradientWidget()
        ],
      ),
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