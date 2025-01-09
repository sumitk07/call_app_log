import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/call_log.dart';

// State
class CallLogState extends Equatable {
  final List<CallLog> callLogs;
  final List<Contact> contacts;
  final bool isLoading;
  final String? error;

  const CallLogState({
    this.callLogs = const [],
    this.contacts = const [],
    this.isLoading = false,
    this.error,
  });

  CallLogState copyWith({
    List<CallLog>? callLogs,
    List<Contact>? contacts,
    bool? isLoading,
    String? error,
  }) {
    return CallLogState(
      callLogs: callLogs ?? this.callLogs,
      contacts: contacts ?? this.contacts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [callLogs, contacts, isLoading, error];
}

// Cubit
class CallLogCubit extends Cubit<CallLogState> {
  CallLogCubit() : super(const CallLogState());

  Future<void> loadCallLogs() async {
    emit(state.copyWith(isLoading: true));
    try {
      // Mock data for demonstration
      final callLogs = [
        CallLog(
          id: '1',
          contactId: '1',
          phoneNumber: '+1234567890',
          timestamp: DateTime.now(),
          duration: const Duration(minutes: 5),
          callType: CallType.incoming,
        ),
        // Add more mock data as needed
      ];
      emit(state.copyWith(callLogs: callLogs, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void filterCallLogs(String query) {
    // Implement filtering logic
  }

  void sortCallLogs(String criteria) {
    // Implement sorting logic
  }
}
