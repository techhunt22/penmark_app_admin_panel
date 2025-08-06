
import '../../../../domain/entities/settings/papertype/delete_papertype_entity.dart';
import '../../../../domain/repositories/settings/papertype/delete_papertype_repo.dart';
import '../../../datasource/settings/papertype/delete_papertype_datasource.dart';

class DeletePaperTypeRepoImpl implements DeletePaperTypeRepository{
  final DeletePaperTypeDatasource deletePaperTypeDatasource;

  DeletePaperTypeRepoImpl(this.deletePaperTypeDatasource);

  @override
  Future<DeletePaperTypeEntity> deletePaperTypeRepo({required String id}) async {
    final deletePaperType = await deletePaperTypeDatasource.deletePaperType(id: id);


    return deletePaperType.toEntity();
  }

}