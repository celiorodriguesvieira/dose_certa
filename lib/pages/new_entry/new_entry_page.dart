import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scheduler_medical/constants.dart';
import 'package:sizer/sizer.dart';
import '../../common/convert_time.dart';
import '../../models/medicine_type.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;

  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();

    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Adicionar novo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PanelTitle(
              title: 'Medicamento:',
              isRequerid: true,
            ),
            TextFormField(
              maxLength: 15,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(border: UnderlineInputBorder()),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kOtherColor),
            ),
            PanelTitle(
              title: 'Dose (mg ou ml).',
              isRequerid: false,
            ),
            TextFormField(
              maxLength: 4,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: UnderlineInputBorder()),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kOtherColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PanelTitle(
                    title: 'Escolha o tipo de medicamento', isRequerid: false),
              ],
            ),
            // SizedBox(
            //   height: 2.h,
            // ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: StreamBuilder(
                //block
                //stream ,
                builder: (context, snapshop) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MedicineTypeColumn(
                        medicineType: MedicineType.bottle,
                        name: 'Frasco',
                        iconValue: 'assets/icons/white/bottle.svg',
                        isSelected:
                            snapshop.data == MedicineType.bottle ? true : false,
                      ),
                      MedicineTypeColumn(
                        medicineType: MedicineType.pill,
                        name: 'Pílula',
                        iconValue: 'assets/icons/pill.svg',
                        isSelected:
                            snapshop.data == MedicineType.pill ? true : false,
                      ),
                      MedicineTypeColumn(
                        medicineType: MedicineType.syringe,
                        name: 'Seringa',
                        iconValue: 'assets/icons/white/syringe.svg',
                        isSelected: snapshop.data == MedicineType.syringe
                            ? true
                            : false,
                      ),
                      MedicineTypeColumn(
                        medicineType: MedicineType.tablet,
                        name: 'Comprimido',
                        iconValue: 'assets/icons/white/tablets.svg',
                        isSelected:
                            snapshop.data == MedicineType.tablet ? true : false,
                      ),
                    ],
                  );
                },
                stream: null,
              ),
            ),
            const PanelTitle(
                title: 'Selecione o intervalo de horas:', isRequerid: true),
            const IntervalSection(),
            const PanelTitle(title: 'Começar às', isRequerid: true),
            const SelectTime(),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, right: 7.w),
              child: SizedBox(
                width: 80.w,
                height: 7.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: const StadiumBorder(),
                  ),
                  child: Center(
                    child: Text(
                      'Confirme',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: kScaffoldColor),
                    ),
                  ),
                  onPressed: () {
                    //add medicine
                    //some validations
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  TimeOfDay _time = const TimeOfDay(hour: 0, minute: 00);
  bool _clicked = false;

  Future<TimeOfDay?> _selectTime() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
        _clicked = true;

        //I'm going to update later using provider
      });
    }
    return picked ?? _time;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              _selectTime();
            },
            child: Center(
              child: Text(
                _clicked == false
                    ? 'Selecione o horário:'
                    : '${convertTime(_time.hour.toString())} : ${_time.minute.toString()} ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: kScaffoldColor),
              ),
            )),
      ),
    );
  }
}

class IntervalSection extends StatefulWidget {
  const IntervalSection({super.key});

  @override
  State<IntervalSection> createState() => _IntervalSectionState();
}

class _IntervalSectionState extends State<IntervalSection> {
  final _intervals = [6, 8, 12, 24];
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lembre-me a cada',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          DropdownButton(
            iconEnabledColor: kOtherColor,
            dropdownColor: kScaffoldColor,
            itemHeight: 8.h,
            hint: _selected == 0
                ? Text(
                    'Selecione um intervalo',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                : null,
            elevation: 4,
            value: _selected == 0 ? null : _selected,
            items: _intervals.map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            }).toList(),
            onChanged: (newVal) {
              setState(() {
                _selected = newVal!;
              });
            },
          ),
          Text(
            _selected == 1 ? ' hora.' : ' horas.',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class MedicineTypeColumn extends StatelessWidget {
  const MedicineTypeColumn(
      {super.key,
      required this.medicineType,
      required this.name,
      required this.iconValue,
      required this.isSelected});
  final MedicineType medicineType;
  final String name;
  final String iconValue;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //select medicine type
      },
      child: Column(
        children: [
          Container(
            width: 20.w,
            height: 10.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                color: isSelected ? kOtherColor : Colors.white),
            child: Padding(
              padding: EdgeInsets.all(2.h),
              child: SvgPicture.asset(
                iconValue,
                color: isSelected ? kErrorBorderColor : kOtherColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Container(
              width: 21.w,
              height: 6.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: isSelected ? kOtherColor : Colors.transparent,
              ),
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isSelected ? Colors.white : kOtherColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({super.key, required this.title, required this.isRequerid});
  final String title;
  final bool isRequerid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            TextSpan(
              text: isRequerid ? '*' : '',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: kPrimaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
