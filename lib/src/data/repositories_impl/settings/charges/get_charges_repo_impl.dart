

import 'package:coloring_app_admin_panel/src/domain/entities/settings/charges/get_charges_entity.dart';

import '../../../../domain/repositories/settings/charges/get_charges_repo.dart';
import '../../../datasource/settings/charges/get_charges_datasource.dart';

class GetChargesRepoImpl implements GetChargesRepository{
  final GetChargesDatasource getChargesDatasource;

  GetChargesRepoImpl(this.getChargesDatasource);

  @override
  Future<GetChargesEntity> getChargesRepo() async {
    final getCharges = await getChargesDatasource.getCharges();


    return getCharges.toEntity();
  }

}