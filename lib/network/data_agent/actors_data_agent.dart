

import 'package:movie_db_zoom/data/vos/actors_vo/actors_vo.dart';

abstract class ActorsDataAgent{
  Future<List<ActorsVO>?>getActors(int page);
}