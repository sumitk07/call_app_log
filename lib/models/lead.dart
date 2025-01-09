class Lead {
  final String name;
  final String email;
  final String phone;
  final String leadStatus;
  final int leadScore;
  final String registrationDate;
  final String leadStage;
  final String? state;
  final String? city;
  final String? fbState;
  final String? fbCity;
  final String? alternateMobile;
  final String? countryDialCode;
  final String? leadSubStage;
  final int leadStageChanged;

  Lead({
    required this.name,
    required this.email,
    required this.phone,
    required this.leadStatus,
    required this.leadScore,
    required this.registrationDate,
    required this.leadStage,
    this.state,
    this.city,
    this.fbState,
    this.fbCity,
    this.alternateMobile,
    this.countryDialCode,
    this.leadSubStage,
    required this.leadStageChanged,
  });
}

class CallLog {
  final String type;
  final DateTime timestamp;
  final int duration;
  final String caller;

  CallLog({
    required this.type,
    required this.timestamp,
    required this.duration,
    required this.caller,
  });
}
