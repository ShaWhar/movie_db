
import 'package:movie_db_zoom/data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';

abstract class CrewApply{
  Future<List<CastAndCrewVO>?>crewView(int page);


}