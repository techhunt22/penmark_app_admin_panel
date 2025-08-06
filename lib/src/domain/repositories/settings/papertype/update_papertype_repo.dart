
import '../../../entities/settings/papertype/update_papertype_entity.dart';

abstract class UpdatePaperTypeRepository {
  Future<UpdatePaperTypeEntity> updatePaperTypeRepo({required String id, String? type, String? price});
}
