import 'package:get/get.dart';

import '../../../data/datasource/collection/update_collection_datasource.dart';
import '../../../data/repositories_impl/collection/update_collection_repo_impl.dart';
import '../../../domain/usecases/collection/update_collection_usecase.dart';
import '../../../presentation/controllers/collection/addcollection/collection_filepicker_class.dart';
import '../../../presentation/controllers/collection/getcollection/collections_controller.dart';
import '../../../presentation/controllers/collection/updatecollection/update_collection_controller.dart';

class UpdateCollectionBindings extends Bindings {
  @override
  void dependencies() {
    // Register the data source, repository, and use case for UpdateCollection
    Get.lazyPut(() => UpdateCollectionDataImpl());
    Get.lazyPut(() => UpdateCollectionRepoImpl(Get.find<UpdateCollectionDataImpl>()));
    Get.lazyPut(() => UpdateCollectionUseCase(Get.find<UpdateCollectionRepoImpl>()));

    // Register the file picker service
    Get.lazyPut(() => CollectionFilePickerServiceImpl());

    // Register the CollectionsController (if it's not registered elsewhere)
    Get.lazyPut(() => CollectionsController(Get.find(), Get.find()));

    // Finally, register the UpdateCollectionController
    Get.lazyPut(() => UpdateCollectionController(
      Get.find<UpdateCollectionUseCase>(),
      Get.find<CollectionFilePickerServiceImpl>(),
      Get.find<CollectionsController>(),
    ));
  }
}
