
import '../../data/vos/cast_and_crew_vo/crew_vo.dart';

abstract class CrewDataAgent{
  Future<List<CrewVO>?>getCrew(int movieID);
}