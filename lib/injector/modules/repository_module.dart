
import 'package:calme/features/authentication/data/repository/auth_repository.dart';
import 'package:calme/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:calme/features/journal/data/repository/journal_repository.dart';
import 'package:calme/features/journal/data/repository/journal_repository_impl.dart';
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
      );
  }
}
