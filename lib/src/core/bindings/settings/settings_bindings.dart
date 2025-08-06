
import 'package:coloring_app_admin_panel/src/presentation/controllers/settings/charges/get_charges_controller.dart';
import 'package:get/get.dart';

import '../../../data/datasource/settings/charges/get_charges_datasource.dart';
import '../../../data/datasource/settings/papersize/add_papersize_datasource.dart';
import '../../../data/datasource/settings/papersize/delete_papersize_datasource.dart';
import '../../../data/datasource/settings/papersize/get_papersize_datasource.dart';
import '../../../data/datasource/settings/papersize/update_papersize_datasource.dart';
import '../../../data/datasource/settings/papertype/add_papertype_datasource.dart';
import '../../../data/datasource/settings/papertype/delete_papertype_datasource.dart';
import '../../../data/datasource/settings/papertype/get_papertype_datasource.dart';
import '../../../data/datasource/settings/papertype/update_papertype_datasource.dart';
import '../../../data/repositories_impl/settings/charges/get_charges_repo_impl.dart';
import '../../../data/repositories_impl/settings/papersize/add_papersize_repo_impl.dart';
import '../../../data/repositories_impl/settings/papersize/delete_papersize_repo_impl.dart';
import '../../../data/repositories_impl/settings/papersize/get_papersize_repo_impl.dart';
import '../../../data/repositories_impl/settings/papersize/update_papersize_repo_impl.dart';
import '../../../data/repositories_impl/settings/papertype/add_papertype_repo_impl.dart';
import '../../../data/repositories_impl/settings/papertype/delete_papertype_repo_impl.dart';
import '../../../data/repositories_impl/settings/papertype/get_papertype_repo_impl.dart';
import '../../../data/repositories_impl/settings/papertype/update_papertype_repo_impl.dart';
import '../../../domain/usecases/settings/charges/get_charges_usecase.dart';
import '../../../domain/usecases/settings/papersize/add_papersize_usecase.dart';
import '../../../domain/usecases/settings/papersize/delete_papersize_usecase.dart';
import '../../../domain/usecases/settings/papersize/get_papersize_usecase.dart';
import '../../../domain/usecases/settings/papersize/update_papersize_usecase.dart';
import '../../../domain/usecases/settings/papertype/add_papertype_usecase.dart';
import '../../../domain/usecases/settings/papertype/delete_papertype_usecase.dart';
import '../../../domain/usecases/settings/papertype/get_papertype_usecase.dart';
import '../../../domain/usecases/settings/papertype/update_papertype_usecase.dart';
import '../../../presentation/controllers/settings/papersize/addpapersize/add_papersize_controller.dart';
import '../../../presentation/controllers/settings/papersize/deletepapersize/delete_papersize_controller.dart';
import '../../../presentation/controllers/settings/papersize/getpapersize/get_papersize_controller.dart';
import '../../../presentation/controllers/settings/papersize/updatepapersize/update_papersize_controller.dart';
import '../../../presentation/controllers/settings/papertype/addpapertype/add_papertype_controller.dart';
import '../../../presentation/controllers/settings/papertype/deletepapertype/delete_papertype_controller.dart';
import '../../../presentation/controllers/settings/papertype/getpapertype/get_papertype_controller.dart';
import '../../../presentation/controllers/settings/papertype/updatepapertype/update_papertype_controller.dart';


class SettingsDependencies {
  static void inject() {
  _injectPaperSize();
  _injectPaperType();
  _injectCharges();
}

  static void _injectPaperSize() {
    // PAPER SIZE
    putIfNotRegistered(() => PaperSizeController(
      GetPaperSizeUseCase(GetPaperSizeRepoImpl(GetPaperSizeDataImpl())),
    ));

    putIfNotRegistered(() => AddPaperSizeController(
      AddPaperSizeUseCase(AddPaperSizeRepoImpl(AddPaperSizeDataImpl())),
      Get.find<PaperSizeController>(),
    ));

    putIfNotRegistered(() => DeletePaperSizeController(
      DeletePaperSizeUseCase(DeletePaperSizeRepoImpl(DeletePaperSizeDataImpl())),
      Get.find<PaperSizeController>(),
    ));

    putIfNotRegistered(() => UpdatePaperSizeController(
      UpdatePaperSizeUseCase(UpdatePaperSizeRepoImpl(UpdatePaperSizeDataImpl())),
      Get.find<PaperSizeController>(),
    ));



  }

  static void _injectPaperType() {
    // PAPER TYPE

    putIfNotRegistered(() => PaperTypeController(
        GetPaperTypeUseCase(GetPaperTypeRepoImpl(
            GetPaperTypeDataImpl()))));


    putIfNotRegistered(() => AddPaperTypeController(
      AddPaperTypeUseCase(AddPaperTypeRepoImpl(AddPaperTypeDataImpl())),
      Get.find<PaperTypeController>(),
    ));

    putIfNotRegistered(() => UpdatePaperTypeController(
      UpdatePaperTypeUseCase(UpdatePaperTypeRepoImpl(UpdatePaperTypeDataImpl())),
      Get.find<PaperTypeController>(),
    ));

    putIfNotRegistered(() => DeletePaperTypeController(
      DeletePaperTypeUseCase(DeletePaperTypeRepoImpl(DeletePaperTypeDataImpl())),
      Get.find<PaperTypeController>(),
    ));



  }


  static void _injectCharges() {
    putIfNotRegistered(() => GetChargesController(
        GetChargesUseCase(GetChargesRepoImpl(
            GetChargesDataImpl()))));


  }


}


T putIfNotRegistered<T>(T Function() create) {
  if (!Get.isRegistered<T>()) {
    return Get.put(create());
  }
  return Get.find<T>();
}
