import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/get_organizations_models/get_organizations_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_organizations_state.dart';

class GetOrganizationsCubit extends Cubit<GetOrganizationsState> {
  GetOrganizationsCubit(this.appointmentRepo) : super(GetOrganizationsInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getOrganizations() async {
    emit(GetOrganizationsLoading());
    final result = await appointmentRepo.getOrganizations();
    result.fold(
      (failure) => emit(GetOrganizationsFailure(message: failure.message)),
      (organizations) => emit(GetOrganizationsSuccess(organizations: organizations)),
    );
  }
}
