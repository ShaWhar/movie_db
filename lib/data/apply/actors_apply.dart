
import '../vos/actors_vo/actors_vo.dart';

abstract class ActorsApply{
  Future<List<ActorsVO>?>actorsView(int page);
}