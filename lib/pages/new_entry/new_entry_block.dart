import 'package:rxdart/rxdart.dart';
import 'package:scheduler_medical/models/medicine_type.dart';
import '../../models/errors.dart';

class NewEntryBlock {
  BehaviorSubject<MedicineType>? _selectMedicineType$;
  ValueStream<MedicineType>? get selectedMedicineType =>
      _selectMedicineType$!.stream;

  BehaviorSubject<int>? _selectedInterval$;
  BehaviorSubject<int>? get selectIntervals => _selectedInterval$;

  BehaviorSubject<String>? _selectedTimeOfDay$;
  BehaviorSubject<String>? get selectedTimeOfDay$ => _selectedTimeOfDay$;

  BehaviorSubject<EntryError>? _errorState$;
  BehaviorSubject<EntryError>? get errorState$ => _errorState$;

  NewEntryBlock() {
    _selectMedicineType$ =
        BehaviorSubject<MedicineType>.seeded(MedicineType.none);

    _selectedTimeOfDay$ = BehaviorSubject<String>.seeded('none');
    _selectedInterval$ = BehaviorSubject<int>.seeded(0);
    _errorState$ = BehaviorSubject<EntryError>();
  }

  void dispose() {
    _selectMedicineType$!.close();
    _selectedTimeOfDay$!.close();
    _selectedInterval$!.close();
  }

  void submitError(EntryError error) {
    _errorState$!.add(error);
  }

  void updateInterval(int interval) {
    _selectedInterval$!.add(interval);
  }

  void updateTime(String time) {
    _selectedTimeOfDay$!.add(time);
  }

  void updateSelectedMedicine(MedicineType type) {
    MedicineType _tempType = _selectMedicineType$!.value;

    if (type == _tempType) {
      _selectMedicineType$!.add(MedicineType.none);
    } else {
      _selectMedicineType$!.add(type);
    }
  }
}
