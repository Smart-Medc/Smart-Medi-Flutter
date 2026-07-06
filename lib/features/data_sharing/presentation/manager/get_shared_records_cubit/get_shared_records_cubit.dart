import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo.dart';

part 'get_shared_records_state.dart';

class GetSharedRecordsCubit extends Cubit<GetSharedRecordsState> {
  GetSharedRecordsCubit(this.dataSharingRepo) : super(GetSharedRecordsInitial());
  final DataSharingRepo dataSharingRepo;
  Future<void> getSharedRecords() async {
    emit(GetSharedRecordsLoading());
    final result = await dataSharingRepo.getSharedRecords();
    result.fold(
      (failure) => emit(GetSharedRecordsFailure(message: failure.message)),
      (getSharedRecordsResponse) => emit(GetSharedRecordsSuccess(getSharedRecordsResponse: getSharedRecordsResponse)),
    );
  }
}
