
import 'package:movie_db_zoom/data/vos/cast_and_crew_vo/cast_vo.dart';

abstract class CastApply{
  Future<List<CastVO>?>castView(int page);


}