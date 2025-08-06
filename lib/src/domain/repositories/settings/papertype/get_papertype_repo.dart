import '../../../entities/settings/papertype/get_papertype_entity.dart';

abstract class GetPaperTypeRepository {
  Future<GetPaperTypeEntity> getPaperTypeRepo();
}
