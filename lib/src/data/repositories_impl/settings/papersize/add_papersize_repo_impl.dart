


import '../../../../domain/entities/settings/papersize/add_papersize_entity.dart';
import '../../../../domain/repositories/settings/papersize/add_papersize_repo.dart';
import '../../../datasource/settings/papersize/add_papersize_datasource.dart';

class AddPaperSizeRepoImpl implements AddPaperSizeRepository{
  final AddPaperSizeDatasource addPaperSizeDatasource;

  AddPaperSizeRepoImpl(this.addPaperSizeDatasource);




  @override
  Future<AddPaperSizeEntity> addPaperSizeRepo({required String size,required String price}) async {
    final addPaperSize = await addPaperSizeDatasource.addPaperSize(size: size, price: price);


    return addPaperSize.toEntity();
  }

}