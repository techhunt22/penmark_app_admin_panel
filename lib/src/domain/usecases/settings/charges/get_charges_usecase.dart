import 'package:coloring_app_admin_panel/src/domain/entities/settings/charges/get_charges_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../repositories/settings/charges/get_charges_repo.dart';


class GetChargesUseCase {
  final GetChargesRepository getChargesRepository;

  GetChargesUseCase (this.getChargesRepository);


  Future<Either<Failure, GetChargesEntity>> getChargesUseCase() async {
    try {


      final result = await getChargesRepository.getChargesRepo();
      return Right(result);

    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }


}