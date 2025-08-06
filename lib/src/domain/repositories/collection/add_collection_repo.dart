



import 'package:coloring_app_admin_panel/src/data/datasource/collection/add_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/add_collection_entity.dart';


abstract class AddCollectionRepository {
  Future<AddCollectionEntity> addCollectionRepo(AddCollectionParams params);
}
