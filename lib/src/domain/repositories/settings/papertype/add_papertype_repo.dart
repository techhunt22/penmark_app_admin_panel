
import '../../../entities/settings/papertype/add_papertype_entity.dart';

abstract class AddPaperTypeRepository {
  Future<AddPaperTypeEntity> addPaperTypeRepo({required String type,required String price});
}
