import 'package:coloring_app_admin_panel/src/data/datasource/collection/get_collections_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/get_collection_entities.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/get_collection_repo.dart';

class GetCollectionRepoImpl implements GetCollectionRepository{
  final GetCollectionsDatasource getCollectionsDatasource;

  GetCollectionRepoImpl(this.getCollectionsDatasource);

  @override
  Future<GetCollectionsEntity> getCollectionRepo({required int page, required int limit}) async {
    final getCollections = await getCollectionsDatasource.collections(page: page, limit: limit);


    return getCollections.toEntity();
  }

}