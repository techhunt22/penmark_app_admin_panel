import 'package:coloring_app_admin_panel/src/domain/entities/dashboard/add_template_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/dashboard/add_template_repo.dart';
import '../../../data/datasource/dashboard/add_template_datasource.dart';

class AddTemplateUseCase {
  final AddTemplateRepository addTemplateRepository;

  AddTemplateUseCase(this.addTemplateRepository);

  Future<AddTemplatesEntity> templateUseCase(AddTemplateParams params) async {

    if (params.name.isEmpty) {
      throw ArgumentError("Template name cannot be empty.");
    }
    if (params.status.isEmpty) {
      throw ArgumentError("Status cannot be empty.");
    }
    if (params.collectionId.isEmpty) {
      throw ArgumentError("Collection ID cannot be empty.");
    }
    if (params.fileBytes.isEmpty) {
    throw ArgumentError("File does not exist.");
    }

    String allowedExtensions = 'svg';
    String fileExtension = params.fileName.split('.').last.toLowerCase();

    if (!allowedExtensions.contains(fileExtension)) {
      throw ArgumentError("Unsupported file format. Only SVGs are allowed.");
    }
    // Use case retrieves entities (not models) from the repository
    final addTemplates = await addTemplateRepository.addTemplateRepository(params);

    return addTemplates;  // Return the AuthEntity on success
  }
}
