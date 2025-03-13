
import 'package:coloring_app_admin_panel/src/domain/entities/dashboard/add_template_entity.dart';
import '../../../domain/repositories/dashboard/add_template_repo.dart';
import '../../datasource/dashboard/add_template_datasource.dart';

class AddTemplateRepositoryImpl implements AddTemplateRepository {
  final AddTemplateDatasource addTemplateDatasource;

  AddTemplateRepositoryImpl(this.addTemplateDatasource);

  @override
  Future<AddTemplatesEntity> addTemplateRepository(AddTemplateParams params) async {
    final addTemplates = await addTemplateDatasource.templates(params);

    // final templateEntity = AddTemplatesEntity(
    //   success: addTemplates.success,
    //   message: addTemplates.message,
    //   data: AddTemplatesEntityData(
    //     name: addTemplates.data.name,
    //     collectionname: addTemplates.data.collectionname,
    //     svgImage: addTemplates.data.svgImage,
    //     status: addTemplates.data.status,
    //     id: addTemplates.data.id,
    //
    //   ),
    // );
    // return templateEntity;
    return addTemplates.toEntity();
  }
}
