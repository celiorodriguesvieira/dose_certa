import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scheduler_medical/constants.dart';
import 'package:sizer/sizer.dart';
import 'new_entry/new_entry_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          children: [
            const TopContainer(),
            SizedBox(
              height: 2.h,
            ),
            Flexible(
              child: const BottomContainer(),
            ),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewEntryPage(),
            ),
          );
          //go to new entry page
        },
        child: SizedBox(
          width: 18.w,
          height: 9.h,
          child: Card(
            color: kPrimaryColor,
            shape: BeveledRectangleBorder(),
            child: Icon(
              Icons.add_outlined,
              color: kScaffoldColor,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            bottom: 1.h,
          ),
          child: Text(
            'Sua saúde, sem erros.\nA dose certa na hora certa.',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 2.h),
          child: Text(
            'Bem-vindo para a dose certa!',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 1.h),
          child: Text(
            '0',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //later we will use condition to show the save data;
    // return Center(
    //   child: Text(
    //     'Medicamentos Agendados',
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.headlineMedium,
    //   ),
    // );
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return MedicineCard();
        });
  }
}

class MedicineCard extends StatelessWidget {
  const MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        // go to details activity animation, later
      },
      child: Container(
        padding: EdgeInsets.all(2.w),
        //I could adjust space here
        margin: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/bottle.svg',
              height: 7.h,
              color: kOtherColor,
            ),
            const Spacer(),
            //hero tag animation, later
            Text(
              'Calpol',
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            //time interval data with condition, later
            Text(
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
              'Cada 8 horas',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
