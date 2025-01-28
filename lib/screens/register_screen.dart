import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:todo/screens/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'RegisterScreen';
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var rePasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'register'.tr(),
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ThemeMode==ThemeMode.light?Color(0xff101127):Theme.of(context).primaryColor),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/splash.png')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: nameController,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).focusColor),
                decoration: InputDecoration(
                  labelText: "name".tr(),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).hintColor,
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: emailController,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).hintColor),
                decoration: InputDecoration(
                  labelText: 'email'.tr(),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).hintColor,
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).hintColor),
                decoration: InputDecoration(
                  labelText: 'password'.tr(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).hintColor,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Theme.of(context).hintColor,
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextField(
                controller: rePasswordController,
                obscureText: true,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).hintColor),
                decoration: InputDecoration(
                  labelText:"re_password".tr(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).hintColor,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Theme.of(context).hintColor,
                  ),
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 24),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, OnBoardingScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text('create_account'.tr(),
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ))),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'have_account'.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    'login'.tr(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColor,decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ToggleSwitch(
              minWidth: 60.0,
              minHeight: 30.0,
              initialLabelIndex: context.locale.toString() == "en" ? 0 : 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              icons: [
                FontAwesomeIcons.flagUsa,
                MdiIcons.abjadArabic,
              ],
              iconSize: 30.0,
              activeBgColors: [
                [
                  Theme.of(context).primaryColor,
                  Theme.of(context).secondaryHeaderColor
                ],
                [Colors.yellow, Colors.orange]
              ],
              animate:
                  true, // with just animate set to true, default curve = Curves.easeIn
              curve: Curves
                  .bounceInOut, // animate must be set to true when using custom curve
              onToggle: (index) {
                if (index == 1) {
                  context.setLocale(Locale('ar'));
                } else {
                  context.setLocale(Locale('en'));
                }
                print('switched to: $index');
              },
            ),
          ],
        ),
      ),
    );
  }
}
