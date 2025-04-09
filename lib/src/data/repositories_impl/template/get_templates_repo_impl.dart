import 'package:coloring_app_admin_panel/src/data/datasource/template/get_templates_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/template/get_template_repo.dart';

class GetTemplatesRepoImpl implements GetTemplateRepository{
  final GetTemplatesDatasource getTemplatesDatasource;

  GetTemplatesRepoImpl(this.getTemplatesDatasource);


  @override
  Future<GetTemplatesEntity> getTemplatesRepo({required int page, required int limit}) async {
    final getTemplates = await getTemplatesDatasource.templates(page: page, limit: limit);


    return getTemplates.toEntity();
  }

}