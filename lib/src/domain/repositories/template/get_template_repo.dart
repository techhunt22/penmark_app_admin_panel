
import 'package:coloring_app_admin_panel/src/domain/entities/template/get_templates_entity.dart';



abstract class GetTemplateRepository {
  Future<GetTemplatesEntity> getTemplatesRepo({required int page, required int limit});
}
