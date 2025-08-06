import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/collection/get_collections_datasource.dart';
import '../../../data/datasource/template/add_template_datasource.dart';
import '../../../data/repositories_impl/collection/get_collection_repo_impl.dart';
import '../../../data/repositories_impl/template/add_template_repo_impl.dart';
import '../../../domain/usecases/collection/get_collections_usecase.dart';
import '../../../domain/usecases/template/add_template_usecase.dart';
import '../../../presentation/controllers/collection/getcollection/collections_cache_class.dart';
import '../../../presentation/controllers/collection/getcollection/collections_controller.dart';
import '../../../presentation/controllers/template/addtemplate/add_template_controller.dart';
import '../../../presentation/controllers/template/addtemplate/filepicker_class.dart';

class AddTemplateBinding extends Bindings {
  @override
  void dependencies() {
    // Register all dependencies required for AddTemplateController

    Get.lazyPut(() => AddTemplatesDataImpl());
    Get.lazyPut(() => AddTemplateRepositoryImpl(Get.find<AddTemplatesDataImpl>()));
    Get.lazyPut(() => AddTemplateUseCase(Get.find<AddTemplateRepositoryImpl>()));
    Get.lazyPut(() => TemplateFilePickerServiceImpl());


    // Collections dependencies
    Get.lazyPut(() => GetCollectionDataImpl());
    Get.lazyPut(() => GetCollectionRepoImpl(Get.find<GetCollectionDataImpl>()));
    Get.lazyPut(() => GetCollectionsUseCase(Get.find<GetCollectionRepoImpl>()));
    Get.lazyPut(() => CollectionsCache());
    Get.lazyPut(() => CollectionsController(Get.find(), Get.find()));

    // Finally, the AddTemplateController
    Get.lazyPut(() => AddTemplateController(
      Get.find<AddTemplateUseCase>(),
      Get.find<TemplateFilePickerServiceImpl>(),
      Get.find<CollectionsController>(),
      Get.find<TemplatesController>(),
    ));
  }
}
