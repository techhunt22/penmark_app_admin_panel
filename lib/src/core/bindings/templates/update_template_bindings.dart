import 'package:coloring_app_admin_panel/src/data/datasource/template/get_templates_datasource.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/template/get_templates_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/data/repositories_impl/template/update_template_repo_impl.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/get_templates_usecase.dart';
import 'package:coloring_app_admin_panel/src/domain/usecases/template/update_template_usecase.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/get_templates_controller.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/gettemplates/templates_cache.dart';
import 'package:coloring_app_admin_panel/src/presentation/controllers/template/updatetemplate/update_template_controller.dart';
import 'package:get/get.dart';
import '../../../data/datasource/collection/get_collections_datasource.dart';
import '../../../data/datasource/template/update_template_datasource.dart';
import '../../../data/repositories_impl/collection/get_collection_repo_impl.dart';
import '../../../domain/usecases/collection/get_collections_usecase.dart';
import '../../../presentation/controllers/collection/getcollection/collections_cache_class.dart';
import '../../../presentation/controllers/collection/getcollection/collections_controller.dart';
import '../../../presentation/controllers/template/addtemplate/filepicker_class.dart';

class UpdateTemplateBindings extends Bindings {
  @override
  void dependencies() {
    // Register all dependencies required for Update

    Get.lazyPut(() => UpdateTemplatesDataImpl());
    Get.lazyPut(() => UpdateTemplateRepoImpl(Get.find<UpdateTemplatesDataImpl>()));
    Get.lazyPut(() => UpdateTemplateUseCase(Get.find<UpdateTemplateRepoImpl>()));
    Get.lazyPut(() => TemplateFilePickerServiceImpl());


    // Collections dependencies
    Get.lazyPut(() => GetCollectionDataImpl());
    Get.lazyPut(() => GetCollectionRepoImpl(Get.find<GetCollectionDataImpl>()));
    Get.lazyPut(() => GetCollectionsUseCase(Get.find<GetCollectionRepoImpl>()));
    Get.lazyPut(() => CollectionsCache());
    Get.lazyPut(() => CollectionsController(Get.find(), Get.find()));

    Get.lazyPut(() => GetTemplatesDataImpl());
    Get.lazyPut(() => GetTemplatesRepoImpl(Get.find<GetTemplatesDataImpl>()));
    Get.lazyPut(() => GetTemplatesUseCase(Get.find<GetTemplatesRepoImpl>()));
    Get.lazyPut(() => TemplatesCache());
    Get.lazyPut(() => TemplatesController(Get.find(), Get.find()));

    // Finally, the AddTemplateController
    Get.lazyPut(() => UpdateTemplateController(
      Get.find<UpdateTemplateUseCase>(),
      Get.find<TemplateFilePickerServiceImpl>(),
      Get.find<CollectionsController>(),
      Get.find<TemplatesController>(),
    ));
  }
}
