


import '../../../../domain/entities/settings/papertype/get_papertype_entity.dart';
import '../../../../domain/repositories/settings/papertype/get_papertype_repo.dart';
import '../../../datasource/settings/papertype/get_papertype_datasource.dart';

class GetPaperTypeRepoImpl implements GetPaperTypeRepository{
  final GetPaperTypeDatasource getPaperTypeDatasource;

  GetPaperTypeRepoImpl(this.getPaperTypeDatasource);


  @override
  Future<GetPaperTypeEntity> getPaperTypeRepo() async {
    final getPaperType = await getPaperTypeDatasource.paperType();


    return getPaperType.toEntity();
  }

}