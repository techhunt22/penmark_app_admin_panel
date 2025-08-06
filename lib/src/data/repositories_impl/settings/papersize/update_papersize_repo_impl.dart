
import '../../../../domain/entities/settings/papersize/update_papersize_entity.dart';
import '../../../../domain/repositories/settings/papersize/update_papersize_repo.dart';
import '../../../datasource/settings/papersize/update_papersize_datasource.dart';

class UpdatePaperSizeRepoImpl implements UpdatePaperSizeRepository{
  final UpdatePaperSizeDatasource updatePaperSizeDatasource;

  UpdatePaperSizeRepoImpl(this.updatePaperSizeDatasource);

  @override
  Future<UpdatePaperSizeEntity> updatePaperSizeRepo({required String id, String? size, String? price}) async {
    final updatePaperSize = await updatePaperSizeDatasource.updatePaperSize(id: id, price: price, size: size);


    return updatePaperSize.toEntity();
  }

}