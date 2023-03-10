import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/apply/tmdb_apply.dart';
import 'details_page_header_item_view.dart';

class SliverAppBarItemView extends StatelessWidget {
  const SliverAppBarItemView({
    super.key,
    required this.tmdbApply,
   // required this.details,
  });
  final TMDBApply tmdbApply;

  get details => null;
  //final DetailsVO details;


  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
        backgroundColor: kPrimaryColor,
        leading: const ArrowBackIconView(),
        actions: const [
          SearchIconView()
        ],
        floating: true,
        pinned: true,
        expandedHeight: kExpandedHeight,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: DetailsPageHeaderItemView(tmdbApply: tmdbApply, details: details,
            //details: details,
          ),
        ));
  }
}

class SearchIconView extends StatelessWidget {
  const SearchIconView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: kSP8x),
      child: Icon(
        Icons.search,
        size: kSearchIconSize,
      ),
    );
  }
}

class ArrowBackIconView extends StatelessWidget {
  const ArrowBackIconView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Padding(
        padding: EdgeInsets.only(top: kSP3x, left: kSP10x),
        child: Chip(
          backgroundColor: kSecondaryColor,
          label: Text(''),
          padding: EdgeInsets.symmetric(vertical: 11, horizontal: 11),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all((Radius.circular(30))),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: kSP3x, left: kSP4x),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: kWhiteColor,
          ),
        ),
      ),
    ]);
  }
}