import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/onbording_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../providers/my_provider.dart';

class IntroductionScreen extends StatelessWidget {
  static const String routeName='IntroductionScreen';
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image(image: AssetImage('assets/images/logo.png')),
      ),
      body: Padding(
        padding:  EdgeInsets.only(right: 16,left: 16),
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(top: 28,bottom: 28),
              child: Image(image: AssetImage('assets/images/intro.png'),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text("introduction_title".tr(),style: Theme.of(context).textTheme.titleMedium!.
                 copyWith(color: Theme.of(context).primaryColor)),
              ],
            ),
             SizedBox(height: 20,),
             Text("introduction_desc".tr(),style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 15)),
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("language".tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor)),
                ToggleSwitch(
                  minWidth: 60.0,
                  minHeight: 30.0,
                  initialLabelIndex: context.locale.toString()=="en"?0:1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons:  [
                    FontAwesomeIcons.flagUsa,
                    MdiIcons.abjadArabic,
                  ],
                  iconSize: 30.0,
                  activeBgColors: [[Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor],
                    [Colors.yellow, Colors.orange]],
                  animate: true, // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.bounceInOut, // animate must be set to true when using custom curve
                  onToggle: (index) {
                    if(index==1){
                      context.setLocale(Locale('ar'));
                    }
                    else{
                      context.setLocale(Locale('en'));

                    }
                    print('switched to: $index');
                  },
                ),
              ],),
             SizedBox(height: 16,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: [
                Text("theme".tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor)),
                ToggleSwitch(
                  minWidth: 60.0,
                  minHeight: 30.0,
                  initialLabelIndex: provider.themeMode==ThemeMode.light? 0 : 1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  icons: [
                    FontAwesomeIcons.lightbulb,
                    FontAwesomeIcons.moon,
                  ],
                  iconSize: 30.0,
                  activeBgColors: [[Theme.of(context).primaryColor, Theme.of(context).secondaryHeaderColor],
                    [Colors.yellow, Colors.orange]],
                  animate: true, // with just animate set to true, default curve = Curves.easeIn
                  curve: Curves.bounceInOut, // animate must be set to true when using custom curve
                  onToggle: (index) {
                    provider.changeTheme();
                    print('switched to: $index');
                  },
                ),
              ],),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, OnBoardingScreen.routeName);
                },style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),backgroundColor: Theme.of(context).primaryColor,
                ) ,child:   Text('lets_start'.tr(),style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
