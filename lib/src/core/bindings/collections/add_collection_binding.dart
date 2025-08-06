import 'package:coloring_app_admin_panel/src/domain/usecases/collection/add_collection_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/addcollection/add_collection_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/collection/addcollection/collection_filepicker_class.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/collection/add_collection_datasource.dart';
import '../../../data/datasource/collection/get_collections_datasource.dart';
import '../../../data/repositories_impl/collection/add_collection_repo_impl.dart';
import '../../../data/repositories_impl/collection/get_collection_repo_impl.dart';
import '../../../domain/usecases/collection/get_collections_usecase.dart';
import '../../../presentation/controllers/collection/getcollection/collections_cache_class.dart';
import '../../../presentation/controllers/collection/getcollection/collections_controller.dart';

class AddCollectionBinding extends Bindings {
  @override
  void dependencies() {
    // Register all dependencies required for AddTemplateController

    Get.lazyPut(() => AddCollectionDataImpl());
    Get.lazyPut(() => AddCollectionRepositoryImpl(Get.find<AddCollectionDataImpl>()));
    Get.lazyPut(() => AddCollectionUseCase(Get.find<AddCollectionRepositoryImpl>()));
    Get.lazyPut(() => CollectionFilePickerServiceImpl());


    // Collections dependencies
    Get.lazyPut(() => GetCollectionDataImpl());
    Get.lazyPut(() => GetCollectionRepoImpl(Get.find<GetCollectionDataImpl>()));
    Get.lazyPut(() => GetCollectionsUseCase(Get.find<GetCollectionRepoImpl>()));
    Get.lazyPut(() => CollectionsCache());
    Get.lazyPut(() => CollectionsController(Get.find(), Get.find()));

    // Finally, the AddTemplateController
    Get.lazyPut(() => AddCollectionController(
      Get.find<AddCollectionUseCase>(),
      Get.find<CollectionFilePickerServiceImpl>(),
      Get.find<CollectionsController>(),
    ));
  }
}
