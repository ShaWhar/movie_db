
import '../../data/vos/cast_and_crew_vo/cast_vo.dart';

abstract class CastDataAgent{
  Future<List<CastVO>?>getCast(int movieID);
}