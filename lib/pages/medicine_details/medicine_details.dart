import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_medical/constants.dart';
import 'package:scheduler_medical/global_bloc.dart';
import 'package:scheduler_medical/models/medicine.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {super.key});
  final Medicine medicine;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSection(medicine: widget.medicine),
            ExtendedSection(medicine: widget.medicine),
            Spacer(),
            SizedBox(
              width: 100.w,
              height: 7.h,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  // open alert dialog box, + global block later
                  openAlertBox(context, _globalBloc);
                },
                child: Text(
                  'Deletar',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  //deleting a medicine from memory

  openAlertBox(BuildContext context, GlobalBloc _globalBloc) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: kScaffoldColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            contentPadding: EdgeInsets.only(top: 1.h),
            title: Text(
              'Deletar este lembrete?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: kPrimaryColor,
                    fontSize: 15.sp,
                  ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextButton(
                onPressed: () {
                  //global to delete medicine, later
                  _globalBloc.removeMedicine(widget.medicine);
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Text(
                  'OK',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: kSecondaryColor),
                ),
              ),
            ],
          );
        });
  }
}

class MainSection extends StatelessWidget {
  const MainSection({super.key, this.medicine});
  final Medicine? medicine;

  //lets try another one

  Hero makeIcon(double size) {
    if (medicine!.medicineType == 'Bottle') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/bottle.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == 'Pill') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/pill.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == 'Syringe') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          'assets/icons/syringe.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    } else if (medicine!.medicineType == 'Tablet') {
      return Hero(
        tag: medicine!.medicineName! + medicine!.medicineType!,
        child: SvgPicture.asset(
          '/assets/icons/tablet.svg',
          color: kOtherColor,
          height: 7.h,
        ),
      );
    }
    // incase of no medicine type icon selection
    return Hero(
      tag: medicine!.medicineName! + medicine!.medicineType!,
      child: Icon(
        Icons.error,
        color: kOtherColor,
        size: size,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //lets try another one
        //okz same here, the same problem

        makeIcon(7.h),
        SizedBox(
          width: 2.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: medicine!.medicineName!,
              child: Material(
                color: Colors.transparent,
                child: MainInfoTab(
                    fieldTitle: 'Medicamento',
                    fieldInfo: medicine!.medicineName!),
              ),
            ),
            MainInfoTab(
                fieldTitle: 'Dosage',
                fieldInfo: medicine!.dosage == 0
                    ? 'Não identificado'
                    : '${medicine!.dosage} mg')
          ],
        ),
      ],
    );
  }
}

class MainInfoTab extends StatelessWidget {
  const MainInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});
  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 10.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fieldTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: kTextColor,
                  ),
            ),
            SizedBox(
              height: 0.3.h,
            ),
            Text(
              fieldInfo,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedSection extends StatelessWidget {
  const ExtendedSection({super.key, this.medicine});
  final Medicine? medicine;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedInfoTab(
          fieldTitle: 'Medicamento',
          fieldInfo: medicine!.medicineType! == 'None'
              ? 'Não especificado.'
              : medicine!.medicineType!,
        ),
        ExtendedInfoTab(
          fieldTitle: 'Intervalo das doses',
          fieldInfo:
              'Cada ${medicine!.dosage}horas | ${medicine!.interval == 24 ? "uma vez ao dia" : "${(24 / medicine!.interval!).floor()}"} vezes ao dia.',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Começar:',
          fieldInfo:
              '${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}',
        ),
      ],
    );
  }
}

class ExtendedInfoTab extends StatelessWidget {
  const ExtendedInfoTab(
      {super.key, required this.fieldTitle, required this.fieldInfo});

  final String fieldTitle;
  final String fieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 1.h)),
          Text(
            fieldTitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 15.sp,
                  color: kTextColor,
                ),
          ),
          Text(
            fieldInfo,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 10.sp,
                  color: kSecondaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
