
import 'package:coloring_app_admin_panel/src/data/datasource/template/delete_template_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/delete_template_entity.dart';

import '../../../domain/repositories/template/delete_template_repo.dart';

class DeleteTemplatesRepoImpl implements DeleteTemplateRepository{
  final DeleteTemplateDatasource deleteTemplateDatasource;

  DeleteTemplatesRepoImpl(this.deleteTemplateDatasource);


  @override
  Future<DeleteTemplateEntity> deleteTemplateRepo({required String templateId}) async {
    final deleteTemplate = await deleteTemplateDatasource.deleteTemplate(templateId: templateId);

    return deleteTemplate.toEntity();
  }

}