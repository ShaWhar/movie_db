import 'package:dio/dio.dart';
import 'package:movie_db_zoom/constant/api_constant.dart';
import 'package:movie_db_zoom/data/vos/actors_vo/actors_vo.dart';
import 'package:movie_db_zoom/network/response/api/tmdb_api.dart';

import 'actors_data_agent.dart';


class ActorsDataAgentImpl extends ActorsDataAgent {
  late TheMovieDBAPI _api;

  ActorsDataAgentImpl._() {
    _api = TheMovieDBAPI(Dio());
  }

  static final ActorsDataAgentImpl _singleton = ActorsDataAgentImpl._();

  factory ActorsDataAgentImpl() => _singleton;

  @override
  Future<List<ActorsVO>?> getActors(int page) => _api
      .getActors(kAPIToken, page)
      .asStream()
      .map((event) => event.results)
      .first;
}