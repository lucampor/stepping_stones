import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/stones/data.dart';
import 'package:stepping_stones/stones/status.dart';

class SteppingStoneModel extends ChangeNotifier {
  SteppingStoneModel(this._data);

  final SteppingStoneData _data;

  String get task => _data.task;
  StoneStatus get status => _data.status;
  List<JournalEntryData> get relatedJournal => _data.relatedJournal ?? [];


  void insertJournalEntry(JournalEntryData newEntry) {
    if (_data.relatedJournal == null) {
      _data.relatedJournal = [newEntry];
    } else {
      _data.relatedJournal?.add(newEntry);
    }

    notifyListeners();
  }

  void changeName(String newName) {
    _data.task = newName;
    notifyListeners();
  }

  void changeStatus(StoneStatus? newStatus) {
    if (newStatus != null) {
      _data.status = newStatus;
      notifyListeners();
    }
  }

}
