class Medicine {
  final List<dynamic>? notificationIDs;
  final String? medicineName;
  final String? dosage;
  final String? medicineType;
  final int? interval;
  final String? startTime;

  Medicine(
      {this.notificationIDs,
      this.medicineName,
      this.dosage,
      this.medicineType,
      this.startTime,
      this.interval});

//Getters
  String get getName => medicineName!;
  String get getDosage => dosage!;
  String get getType => medicineType!;
  int get getInterval => interval!;
  String get getStartTime => startTime!;
  List<dynamic> get getIds => notificationIDs!;

  Map<String, dynamic> toJSON() {
    return {
      'ids': notificationIDs,
      'name': medicineName,
      'dosage': dosage,
      'type': medicineType,
      'interval': interval,
      'startTime': startTime,
    };
  }

  factory Medicine.fromJson(Map<String, dynamic> parsedJson) {
    return Medicine(
      notificationIDs: parsedJson['ids'],
      medicineName: parsedJson['name'],
      dosage: parsedJson['dosage'],
      medicineType: parsedJson['type'],
      interval: parsedJson['interval'],
      startTime: parsedJson['start'],
    );
  }
}
