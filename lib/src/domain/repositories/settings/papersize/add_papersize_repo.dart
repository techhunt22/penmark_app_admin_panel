


import '../../../entities/settings/papersize/add_papersize_entity.dart';

abstract class AddPaperSizeRepository {
  Future<AddPaperSizeEntity> addPaperSizeRepo({required String size,required String price});
}
