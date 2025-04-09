
import 'package:coloring_app_admin_panel/src/domain/entities/collection/get_collection_entities.dart';



abstract class GetCollectionRepository {
  Future<GetCollectionsEntity> getCollectionRepo({required int page, required int limit});
}
