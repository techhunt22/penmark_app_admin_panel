

import 'package:coloring_app_admin_panel/src/domain/entities/collection/update_collection_entity.dart';

import '../../../data/datasource/collection/update_collection_datasource.dart';

abstract class UpdateCollectionRepository {

  Future<UpdateCollectionEntity> updateCollectionRepo(UpdateCollectionParams params, String templateId,);

}