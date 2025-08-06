

import 'package:coloring_app_admin_panel/src/domain/entities/collection/delete_collection_entity.dart';

abstract class DeleteCollectionRepository {

  Future<DeleteCollectionEntity> deleteCollectionRepo({required String templateId});

}