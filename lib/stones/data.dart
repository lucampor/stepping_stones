import 'package:stepping_stones/stones/status.dart';

class SteppingStoneData {
  SteppingStoneData(
    this.task, {
    this.status = StoneStatus.ongoing,
    }
  );

  String task;
  StoneStatus status;

}
