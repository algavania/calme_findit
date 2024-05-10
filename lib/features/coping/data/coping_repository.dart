import 'package:calme/data/models/coping/coping_model.dart';

abstract class CopingRepository {
  Future<List<CopingModel>> getCopings();
}