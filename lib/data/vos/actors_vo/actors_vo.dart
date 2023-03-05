import 'package:json_annotation/json_annotation.dart';

part 'actors_vo.g.dart';
@JsonSerializable()
class ActorsVO {
  @JsonKey(name: 'adult')
  bool? adult;
  @JsonKey(name: 'backdropPath')
  String? backdropPath;
  @JsonKey(name: 'genreIds')
  List<int>? genreIds;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'originalLanguage')
  String? originalLanguage;
  @JsonKey(name: 'originalTitle')
  String? originalTitle;
  @JsonKey(name: 'overView')
  String? overview;
  @JsonKey(name: 'popularity')
  double? popularity;
  @JsonKey(name: 'posterPath')
  String? posterPath;
  @JsonKey(name: 'releaseDate')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'video')
  bool? video;
  @JsonKey(name: 'voteAverage')
  double? voteAverage;
  @JsonKey(name: 'voteCount')
  int? voteCount;
  bool? isActorsView;

  ActorsVO(
      this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
      {
        this.isActorsView = false,
      }


      );


  factory ActorsVO.fromJson(Map<String, dynamic> json) =>
      _$ActorsVOFromJson(json);


  }

