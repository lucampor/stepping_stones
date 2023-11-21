import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/objectives/data.dart';
import 'package:stepping_stones/objectives/page.dart';
import 'package:stepping_stones/stones/data.dart';

class ObjectiveModel extends ChangeNotifier {
  ObjectiveModel(this._data);

  // Get data from JSON ??
  final ObjectiveData _data;

  String get name => _data.name;
  List<SteppingStoneData> get stones => _data.steppingStones?.toList() ?? <SteppingStoneData>[];
  List<JournalEntryData> get journal => _data.journalEntries?.toList() ?? <JournalEntryData>[];

  void removeJournalEntry() => {};

  void insertJournalEntry(JournalEntryData newEntry) {
    if (_data.journalEntries == null) {
      _data.journalEntries = [newEntry];
    } else {
      _data.journalEntries?.add(newEntry);
    }

    notifyListeners();
  }

  bool isEmpty(CurrentPage page) {
    switch (page) {
      case CurrentPage.journal:
        return _data.journalEntries?.isEmpty ?? true;
      case CurrentPage.stepping:
        return _data.steppingStones?.isEmpty ?? true;
    }
  }

  void insertStone(SteppingStoneData newStone) {
    if (_data.steppingStones == null) {
      _data.steppingStones = [newStone];
    } else {
      _data.steppingStones?.add(newStone);
    }

    notifyListeners();
  }

  void changeName(String newName) {
    _data.name = newName;

    notifyListeners();
  }
}
