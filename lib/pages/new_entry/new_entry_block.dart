import 'package:rxdart/rxdart.dart';
import 'package:scheduler_medical/models/medicine_type.dart';

class NewEntryBlock {
  BehaviorSubject<MedicineType>? _selectMedicineType$;
  ValueStream<MedicineType>? get selectedMedicineType =>
      _selectMedicineType$!.stream;

  BehaviorSubject<int>? _selectedInterval$;
  BehaviorSubject<int>? get selectIntervals => _selectedInterval$;
}
