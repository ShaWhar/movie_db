// import 'package:flutter/material.dart';
//
// import '../constant/colors.dart';
// import '../constant/dimes.dart';
// import '../constant/strings.dart';
// import '../data/vos/details_vo/details_vo.dart';
// import '../data/vos/genres_vo/genres_vo.dart';
// import '../widgets/easy_text_widget.dart';
//
// class MovieGenreAndStorylineItemView extends StatelessWidget {
//
//
//   const MovieGenreAndStorylineItemView({
//     Key? key, required this.details, required this.genres, required this.index,
//   }) : super(key: key);
//   final DetailsVO details;
//   final GenresVO genres;
//   final int index;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: kMovieGenreAndStorylineContainerHeight,
//       color: kSecondaryColor,
//       child: Padding(
//         padding: const EdgeInsets.only(left: kSP10x),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           mainAxisSize: MainAxisSize.min,
//           children:  [
//              MovieGenreView(duration: ,
//                genre1: ,
//                genre2: '',
//                genre3: '',),
//             const EasyTextWidget(text: kStoryLineTitle),
//             EasyTextWidget(
//               text: details.overview,
//               color: kWhiteColor,
//             ),
//             const MovieButtonView()
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MovieGenreView extends StatelessWidget {
//   const MovieGenreView({
//     Key? key, required this.duration,
//     required this.genre1,
//     required this.genre2,
//     required this.genre3,
//   }) : super(key: key);
//   final String duration;
//   final String genre1;
//   final String genre2;
//   final String genre3;
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(alignment: WrapAlignment.start, spacing: kSP5x, children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.only(top: kSP10x),
//         child: SizedBox(
//           width: kMovieGenreWidth,
//           height: kMovieGenreHeight,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children:  [
//               const Icon(
//                 Icons.access_time_sharp,
//                 color: kPlayButtonColor,
//               ),
//               EasyTextWidget(
//                 text: duration,
//                 color: kWhiteColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//        Chip(
//         elevation: 2,
//         backgroundColor: kGreyColor,
//         label: Text(genre1),
//         labelStyle: const TextStyle(fontSize: kFontSize14, color: kWhiteColor),
//       ),
//        Chip(
//         elevation: 2,
//         backgroundColor: kGreyColor,
//         label: Text(genre2),
//         labelStyle: const TextStyle(fontSize: kFontSize14, color: kWhiteColor),
//       ),
//        Chip(
//         elevation: 2,
//         backgroundColor: kGreyColor,
//         label: Text(genre3),
//         labelStyle: const TextStyle(fontSize: kFontSize14, color: kWhiteColor),
//       ),
//       const Icon(
//         Icons.favorite_border_outlined,
//         color: kWhiteColor,
//       )
//     ]);
//   }
// }
//
// class MovieButtonView extends StatelessWidget {
//   const MovieButtonView({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         MaterialButton(
//           onPressed: () {},
//           textColor: kWhiteColor,
//           color: kPlayButtonColor,
//           minWidth: kMovieButtonMInWidth,
//           height: kMovieButtonHeight,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//           splashColor: kGreyColor,
//           child: Row(
//             children: const [
//               Icon(
//                 Icons.play_circle_outline,
//                 color: kWhiteColor,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(kPlayButton),
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 5,
//         ),
//         OutlinedButton.icon(
//           label: const EasyTextWidget(
//             text: kRateButton,
//             color: kWhiteColor,
//           ),
//           icon: const Icon(
//             Icons.star,
//             color: kPlayButtonColor,
//           ),
//           onPressed: () {},
//           style: ButtonStyle(
//               shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30)))),
//         ),
//       ],
//     );
//   }
// }