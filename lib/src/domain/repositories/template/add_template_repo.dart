
import '../../../data/datasource/template/add_template_datasource.dart';
import '../../entities/template/add_template_entity.dart';


abstract class AddTemplateRepository {
  Future<AddTemplatesEntity> addTemplateRepository(AddTemplateParams params);
}
