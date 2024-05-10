
import 'package:calme/features/article/data/article_repository.dart';
import 'package:calme/features/article/data/article_repository_impl.dart';
import 'package:calme/features/authentication/data/repository/auth_repository.dart';
import 'package:calme/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:calme/features/coping/data/coping_repository.dart';
import 'package:calme/features/coping/data/coping_repository_impl.dart';
import 'package:calme/features/journal/data/repository/journal_repository.dart';
import 'package:calme/features/journal/data/repository/journal_repository_impl.dart';
import 'package:calme/features/meditation/data/repository/meditation_repository.dart';
import 'package:calme/features/meditation/data/repository/meditation_repository_impl.dart';
import 'package:calme/injector/injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    Injector.instance
      ..registerFactory<AuthRepository>(
        AuthRepositoryImpl.new,
      )
      ..registerFactory<JournalRepository>(
        JournalRepositoryImpl.new,
      )
      ..registerFactory<MeditationRepository>(
        MeditationRepositoryImpl.new,
      )
      ..registerFactory<CopingRepository>(
        CopingRepositoryImpl.new,
      )
      ..registerFactory<ArticleRepository>(
        ArticleRepositoryImpl.new,
      );
  }
}
