import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/appointment/data/models/get_organization_details_models/get_organization_details_response.dart';
import 'package:smart_medi/features/appointment/data/repos/appointment_repo.dart';

part 'get_organization_details_state.dart';

class GetOrganizationDetailsCubit extends Cubit<GetOrganizationDetailsState> {
  GetOrganizationDetailsCubit(this.appointmentRepo) : super(GetOrganizationDetailsInitial());
  final AppointmentRepo appointmentRepo;
  Future<void> getOrganizationDetails({required String organizationId}) async {
    emit(GetOrganizationDetailsLoading());
    final result = await appointmentRepo.getOrganizationDetails(organizationId: organizationId);
    result.fold(
          (failure) => emit(GetOrganizationDetailsFailure(message: failure.message)),
          (organizationDetails) => emit(GetOrganizationDetailsSuccess(organizationDetailsResponse: organizationDetails)),
    );
  }
}
