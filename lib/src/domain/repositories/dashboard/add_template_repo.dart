
import '../../../data/datasource/dashboard/add_template_datasource.dart';
import '../../entities/dashboard/add_template_entity.dart';


abstract class AddTemplateRepository {
  Future<AddTemplatesEntity> addTemplateRepository(AddTemplateParams params);
}
