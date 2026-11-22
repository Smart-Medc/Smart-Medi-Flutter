import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
import 'package:smart_medi/features/data_sharing/data/models/share_records_models/share_records_request.dart';
import 'package:smart_medi/features/data_sharing/data/repos/data_sharing_repo.dart';

part 'share_records_state.dart';

class ShareRecordsCubit extends Cubit<ShareRecordsState> {
  ShareRecordsCubit(this.dataSharingRepo) : super(ShareRecordsInitial());
  final DataSharingRepo dataSharingRepo;

  Future<void> shareRecords({required ShareRecordsRequest shareRecordsRequest}) async {
    emit(ShareRecordsLoading());
    final result = await dataSharingRepo.shareRecords(shareRecordsRequest: shareRecordsRequest);
    result.fold(
      (failure) => emit(ShareRecordsFailure(message: failure.message)),
      (sharedRecord) => emit(ShareRecordsSuccess(sharedRecord: sharedRecord)),
    );
  }
}
