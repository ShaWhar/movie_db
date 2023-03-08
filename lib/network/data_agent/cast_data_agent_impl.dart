import 'package:dio/dio.dart';
import '../../constant/api_constant.dart';
import '../../data/vos/cast_and_crew_vo/cast_vo.dart';
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
  Future<List<CastVO>?> getCast(int movieID) => _api
      .getCastAndCrew(kAPIToken, movieID) //Future<MovieResponse>
      .asStream()
      .map((event) => event.cast)
      .first;



  }
