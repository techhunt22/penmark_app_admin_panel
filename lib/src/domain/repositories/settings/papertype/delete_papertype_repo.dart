
import '../../../entities/settings/papertype/delete_papertype_entity.dart';

abstract class DeletePaperTypeRepository {
  Future<DeletePaperTypeEntity> deletePaperTypeRepo({required String id});
}
