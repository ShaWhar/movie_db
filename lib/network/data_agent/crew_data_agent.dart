
import '../../data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';

abstract class CrewDataAgent{
  Future<List<CastAndCrewVO>?>getCrew(int page);
}