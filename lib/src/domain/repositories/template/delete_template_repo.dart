



import '../../entities/template/delete_template_entity.dart';

abstract class DeleteTemplateRepository {
  Future<DeleteTemplateEntity> deleteTemplateRepo({required String templateId});
}
