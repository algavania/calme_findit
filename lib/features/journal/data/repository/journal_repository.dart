import 'package:calme/data/models/journal/journal_model.dart';
import 'package:calme/data/models/journal/question_model.dart';

abstract class JournalRepository {
  Future<List<JournalModel>> getAllJournals();
  Future<List<QuestionModel>> getJournalQuestions(String journalId);
  Future<List<JournalAnswerModel>> getJournalAnswers(String journalId);
  Future<void> saveJournalAnswers(String journalId, List<JournalAnswerModel> list);
}