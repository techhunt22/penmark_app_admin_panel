



import '../../../entities/settings/papersize/update_papersize_entity.dart';

abstract class UpdatePaperSizeRepository {
  Future<UpdatePaperSizeEntity> updatePaperSizeRepo({required String id, String? size, String? price});
}
