import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/stones/status.dart';

class SteppingStoneData {
  SteppingStoneData(
    this.task, {
    this.status = StoneStatus.ongoing,
    this.relatedJournal
    }
  );

  String task;
  StoneStatus status;
  List<JournalEntryData>? relatedJournal;
}
