
import '../../data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';

abstract class CastDataAgent{
  Future<List<CastAndCrewVO>?>getCast(int page);
}