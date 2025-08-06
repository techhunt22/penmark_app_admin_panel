

import '../../../../domain/entities/settings/papersize/get_papersize_entity.dart';
import '../../../../domain/repositories/settings/papersize/get_papersize_repo.dart';
import '../../../datasource/settings/papersize/get_papersize_datasource.dart';

class GetPaperSizeRepoImpl implements GetPaperSizeRepository{
  final GetPaperSizeDatasource getPaperSizeDatasource;

  GetPaperSizeRepoImpl(this.getPaperSizeDatasource);




  @override
  Future<GetPaperSizeEntity> getPaperSizeRepo() async {
    final getPaperSize = await getPaperSizeDatasource.paperSize();


    return getPaperSize.toEntity();
  }

}