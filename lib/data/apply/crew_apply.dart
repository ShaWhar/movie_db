
import 'package:movie_db_zoom/data/vos/cast_and_crew_vo/cast_vo.dart';

import '../vos/cast_and_crew_vo/crew_vo.dart';

abstract class CrewApply{
  Future<List<CrewVO>?>crewView(int page);


}