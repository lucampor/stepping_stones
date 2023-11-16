import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/stones/data.dart';

class ObjectiveData {
  ObjectiveData(
    this.name,
    {
      this.steppingStones,
      this.journalEntries
    }
  );


  String name;
  List<SteppingStoneData>? steppingStones;
  List<JournalEntryData>? journalEntries;
}

// TODO Serialize and deserialize information to JSON
