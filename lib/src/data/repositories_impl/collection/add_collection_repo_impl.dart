

import 'package:coloring_app_admin_panel/src/data/datasource/collection/add_collection_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/collection/add_collection_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/collection/add_collection_repo.dart';

class AddCollectionRepositoryImpl implements AddCollectionRepository {
  final AddCollectionDatasource addCollectionDatasource;

  AddCollectionRepositoryImpl(this.addCollectionDatasource);


  @override
  Future<AddCollectionEntity> addCollectionRepo(AddCollectionParams params) async {
    final addCollection = await addCollectionDatasource.collection(params);


    return addCollection.toEntity();
  }
}
