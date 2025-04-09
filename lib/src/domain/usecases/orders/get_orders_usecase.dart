import 'package:coloring_app_admin_panel/src/domain/entities/orders/get_orders_entity.dart';
import 'package:coloring_app_admin_panel/src/domain/repositories/orders/get_orders_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

class GetOrdersUseCase {
  final GetOrdersRepository getOrdersRepository;

  GetOrdersUseCase (this.getOrdersRepository);


  Future<Either<Failure, GetOrdersEntity>> getOrdersUseCase({required limit, required page}) async {
    try {


      final result = await getOrdersRepository.getOrdersRepo(page: page, limit: limit);
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}