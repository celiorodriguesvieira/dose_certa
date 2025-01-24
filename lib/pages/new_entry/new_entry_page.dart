import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scheduler_medical/constants.dart';
import 'package:sizer/sizer.dart';

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
        padding: EdgeInsets.all(2.h),
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
              title: 'Dose em miligrama (mg).',
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
              height: 2.h,
            ),
            const PanelTitle(title: 'Medicine Type', isRequerid: false),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 20.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.h),
                        color: kOtherColor,
                      ),
                      child: SvgPicture(
                        'assets/icons/pill.svg',
                        height: 7.h,
                        colorFilter: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
