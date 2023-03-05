
import 'package:movie_db_zoom/data/vos/cast_and_crew_vo/cast_and_crew_vo.dart';
import '../../network/data_agent/crew_data_agent.dart';
import '../../network/data_agent/crew_data_agent_impl.dart';
import 'crew_apply.dart';

class CrewApplyImpl extends CrewApply{
  final CrewDataAgent dataAgent=CrewDataAgentImpl();
  CrewApplyImpl._();

  static final CrewApplyImpl _singleton=CrewApplyImpl._();
  factory CrewApplyImpl()=>_singleton;

  @override
  Future<List<CastAndCrewVO>?> crewView(int page) =>
      dataAgent.getCrew(page).then((value) {
    var temp=value;
    temp=temp?.map((e) {
      e.isCrewView=true;
      return e;
    }).toList();
    return value;
  });

}