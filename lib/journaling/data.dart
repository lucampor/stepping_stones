import 'package:stepping_stones/journaling/entry_type.dart';

class JournalEntryData {
  const JournalEntryData(
    this.name, {
    this.content,
    this.question,
    required this.type,
  });

  final String name;
  final EntryType type;
  final String? content;
  final String? question;
}
