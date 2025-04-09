
import 'package:coloring_app_admin_panel/src/domain/entities/orders/get_orders_entity.dart';



abstract class GetOrdersRepository {
  Future<GetOrdersEntity> getOrdersRepo({required int page, required int limit});
}
