



import 'package:coloring_app_admin_panel/src/data/datasource/template/update_template_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/update_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/template/update_template_repo.dart';

class UpdateTemplateRepoImpl  implements UpdateTemplateRepository{
  final  UpdateTemplateDatasource updateTemplateDatasource   ;

  UpdateTemplateRepoImpl(this.updateTemplateDatasource);

  @override
  Future<UpdateTemplateEntity> updateTemplateRepository(UpdateTemplateParams params ,String id ) async {
    final updateTemplates = await updateTemplateDatasource.updateTemplates(params ,id);


    return updateTemplates.toEntity();

  }





}
