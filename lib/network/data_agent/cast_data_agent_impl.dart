import 'package:dio/dio.dart';
import '../../constant/api_constant.dart';
import '../../data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';
import '../response/api/tmdb_api.dart';
import 'cast_data_agent.dart';


class CastDataAgentImpl extends CastDataAgent {
  late TheMovieDBAPI _api;

  CastDataAgentImpl._() {
    _api = TheMovieDBAPI(Dio());
  }

  static final CastDataAgentImpl _singleton = CastDataAgentImpl._();

  factory CastDataAgentImpl() => _singleton;

  @override
  Future<List<CastAndCrewVO>?> getCast(int page) => _api
      .getCastAndCrew(kAPIToken, page) //Future<MovieResponse>
      .asStream()
      .map((event) => event.cast)
      .first;



  }
