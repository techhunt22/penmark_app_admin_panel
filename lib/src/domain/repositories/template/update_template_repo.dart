


import 'package:coloring_app_admin_panel/src/data/datasource/template/update_template_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/template/update_template_entity.dart';

abstract class UpdateTemplateRepository {
  Future<UpdateTemplateEntity> updateTemplateRepository(UpdateTemplateParams params,String id);
}
