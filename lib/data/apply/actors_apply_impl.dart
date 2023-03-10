

import '../../network/data_agent/actors_data_agent.dart';
import '../../network/data_agent/actors_data_agent_impl.dart';
import '../vos/actors_vo/actors_vo.dart';
import 'actors_apply.dart';

class ActorsApplyImpl extends ActorsApply{
  final ActorsDataAgent dataAgent=ActorsDataAgentImpl();
  ActorsApplyImpl._();

  static final ActorsApplyImpl _singleton=ActorsApplyImpl._();
  factory ActorsApplyImpl()=>_singleton;

  @override
  Future<List<ActorsVO>?> getActors(int page) =>dataAgent.getActors(page).then((value) {
    var temp=value;
    temp=temp?.map((e) {
      e.isActorsView=true;
      return e;
    }).toList();
    return value;
  });

}