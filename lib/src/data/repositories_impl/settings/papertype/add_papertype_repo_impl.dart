




import '../../../../domain/entities/settings/papertype/add_papertype_entity.dart';
import '../../../../domain/repositories/settings/papertype/add_papertype_repo.dart';
import '../../../datasource/settings/papertype/add_papertype_datasource.dart';

class AddPaperTypeRepoImpl implements AddPaperTypeRepository{
  final AddPaperTypeDatasource addPaperTypeDatasource;

  AddPaperTypeRepoImpl(this.addPaperTypeDatasource);

  @override
  Future<AddPaperTypeEntity> addPaperTypeRepo({required String type,required String price}) async {
    final addPaperType = await addPaperTypeDatasource.addPaperType(type: type, price: price);


    return addPaperType.toEntity();
  }

}