import 'package:dio/dio.dart';

import '../../constant/api_constant.dart';
import '../../data/vos/cast_and_crew_vo/crew_vo.dart';
import '../response/api/tmdb_api.dart';
import 'crew_data_agent.dart';


class CrewDataAgentImpl extends CrewDataAgent {
  late TheMovieDBAPI _api;

  CrewDataAgentImpl._() {
    _api = TheMovieDBAPI(Dio());
  }

  static final CrewDataAgentImpl _singleton = CrewDataAgentImpl._();

  factory CrewDataAgentImpl() => _singleton;

  @override
  Future<List<CrewVO>?> getCrew(int page) => _api
      .getCastAndCrew(kAPIToken, page) //Future<MovieResponse>
      .asStream()
      .map((event) => event.crew)
      .first;



}
