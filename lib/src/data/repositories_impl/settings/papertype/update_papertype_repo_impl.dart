
import '../../../../domain/entities/settings/papertype/update_papertype_entity.dart';
import '../../../../domain/repositories/settings/papertype/update_papertype_repo.dart';
import '../../../datasource/settings/papertype/update_papertype_datasource.dart';

class UpdatePaperTypeRepoImpl implements UpdatePaperTypeRepository{
  final UpdatePaperTypeDatasource updatePaperTypeDatasource;

  UpdatePaperTypeRepoImpl(this.updatePaperTypeDatasource);


  @override
  Future<UpdatePaperTypeEntity> updatePaperTypeRepo({required String id, String? type, String? price}) async {
    final updatePaperType = await updatePaperTypeDatasource.updatePaperType(id: id, price: price, type: type);


    return updatePaperType.toEntity();
  }

}