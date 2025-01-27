import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheduler_medical/constants.dart';
import 'package:sizer/sizer.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            MainSection(),
            ExtendedSection(),
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
                  openAlertBox(context);
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

  openAlertBox(BuildContext context) {
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
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          'assets/icons/bottle.svg',
          height: 7.h,
          color: kOtherColor,
        ),
        SizedBox(
          width: 2.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MainInfoTab(fieldTitle: 'Medicamento', fieldInfo: 'Catapol'),
            MainInfoTab(fieldTitle: 'Dosage', fieldInfo: '500 mg')
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
  const ExtendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ExtendedInfoTab(
          fieldTitle: 'Medicamento',
          fieldInfo: 'Pílula',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Intervalo das doses',
          fieldInfo: 'Cada 8 horas | 3 vezes ao dia.',
        ),
        ExtendedInfoTab(
          fieldTitle: 'Começar:',
          fieldInfo: '01:09',
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
