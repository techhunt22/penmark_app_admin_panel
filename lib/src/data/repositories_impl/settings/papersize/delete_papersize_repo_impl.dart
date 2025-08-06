import '../../../../domain/entities/settings/papersize/delete_papersize_entity.dart';
import '../../../../domain/repositories/settings/papersize/delete_papersize_repo.dart';
import '../../../datasource/settings/papersize/delete_papersize_datasource.dart';

class DeletePaperSizeRepoImpl implements DeletePaperSizeRepository{
  final DeletePaperSizeDatasource deletePaperSizeDatasource;

  DeletePaperSizeRepoImpl(this.deletePaperSizeDatasource);

  @override
  Future<DeletePaperSizeEntity> deletePaperSizeRepo({required String id}) async {
    final deletePaperSize = await deletePaperSizeDatasource.deletePaperSize(id: id);


    return deletePaperSize.toEntity();
  }

}