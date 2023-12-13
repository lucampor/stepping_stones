import 'package:stepping_stones/journaling/entry_type.dart';

class JournalEntryData {
  JournalEntryData(
    this.name,
    {
      this.content,
      this.question,
      required this.type,
  });

  String name;
  EntryType type;
  String? content;
  String? question;
}
