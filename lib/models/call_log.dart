import 'package:equatable/equatable.dart';

enum CallType { incoming, outgoing, missed }

class CallLog extends Equatable {
  final String id;
  final String contactId;
  final String phoneNumber;
  final DateTime timestamp;
  final Duration duration;
  final CallType callType;

  const CallLog({
    required this.id,
    required this.contactId,
    required this.phoneNumber,
    required this.timestamp,
    required this.duration,
    required this.callType,
  });

  @override
  List<Object> get props =>
      [id, contactId, phoneNumber, timestamp, duration, callType];
}

class Contact extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final String? email;

  const Contact({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.email,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber, email];
}
