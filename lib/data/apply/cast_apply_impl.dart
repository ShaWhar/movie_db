
import 'package:movie_db_zoom/data/vos/cast_and_crew_vo/cast_vo.dart';
import '../../network/data_agent/cast_data_agent_impl.dart';
import '../../network/data_agent/cast_data_agent.dart';
import 'cast_apply.dart';

class CastApplyImpl extends CastApply{
  final CastDataAgent dataAgent=CastDataAgentImpl();
  CastApplyImpl._();

  static final CastApplyImpl _singleton=CastApplyImpl._();
  factory CastApplyImpl()=>_singleton;

  @override
  Future<List<CastVO>?> castView(int page) =>dataAgent.getCast(page).then((value) {
    var temp=value;
    temp=temp?.map((e) {
      e.isCastView=true;
      return e;
    }).toList();
    return value;
  });

}