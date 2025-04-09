import 'package:coloring_app_admin_panel/src/data/datasource/orders/get_orders_datasource.dart';
import 'package:coloring_app_admin_panel/src/domain/entities/orders/get_orders_entity.dart';

import 'package:coloring_app_admin_panel/src/domain/repositories/orders/get_orders_repo.dart';

class GetOrdersRepoImpl implements GetOrdersRepository{
  final GetOrdersDatasource getOrdersDatasource;

  GetOrdersRepoImpl(this.getOrdersDatasource);


  @override
  Future<GetOrdersEntity> getOrdersRepo({required int page, required int limit}) async {
    final getOrders = await getOrdersDatasource.orders(page: page, limit: limit);


    return getOrders.toEntity();
  }

}