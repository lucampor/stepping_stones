import 'package:flutter/material.dart';
import 'package:stepping_stones/journaling/data.dart';
import 'package:stepping_stones/journaling/entry_type.dart';
import 'package:stepping_stones/objectives/model.dart';


const emptyQuestion = "No question";

class JournalModel extends ChangeNotifier {
  JournalModel(this.data, {required this.parent})
  : _question = data.question, _content = data.content;

  final JournalEntryData data;
  final ObjectiveModel parent;

  var _question;
  var _content;


  String get goal => parent.name;
  String? get question => _question;
  String? get content => _content;

  @override
  void notifyListeners(){
    parent.notifyListeners();
    super.notifyListeners();
  }

  void changeQuestion(String? newQuestion){
    if (newQuestion == emptyQuestion || newQuestion == null) {
      _question = null;
    } else {
      _question = newQuestion;
    }

    notifyListeners();
  }

  void modifyEntry() {
    if (_question == null) {
      data.type = EntryType.note;
    } else {
      data.type = EntryType.reflection;
    }

    data.question = _question;
    data.content = _content;
    parent.notifyListeners();
  }

  void finishEntry() {
    if (_question == null) {
      data.type = EntryType.note;
    } else {
      data.type = EntryType.reflection;
    }

    data.question = _question;
    data.content = _content;
    parent.insertJournalEntry(data);
  }

  void changeContent(String content){
    if (content.isEmpty) {
      _content = null;
    } else {
      _content = content;
    }
    notifyListeners();
  }


}
