

import '../../../entities/settings/papersize/delete_papersize_entity.dart';

abstract class DeletePaperSizeRepository {
  Future<DeletePaperSizeEntity> deletePaperSizeRepo({required String id});
}
