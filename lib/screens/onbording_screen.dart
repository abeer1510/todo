import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todo/screens/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName="OnBoardingScreen";

  OnBoardingScreen({super.key});
  Widget _buildImage(String assetName, [double width = 280] ) {
    return Image.asset('assets/images/$assetName', width: width,);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.inter(fontSize: 11.0,color: Theme.of(context).hintColor,fontWeight: FontWeight.w500);
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700,color: Theme.of(context).primaryColor,),
      bodyTextStyle: bodyStyle,
      //pageColor: Theme.of(context).,
      imagePadding: EdgeInsets.zero,
      imageFlex: 2,
    );

    return IntroductionScreen(
      //globalBackgroundColor: Color(0xff202020),
      showDoneButton: true,
      globalHeader: Image(image: AssetImage('assets/images/logo.png')),
      done: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(Icons.arrow_forward_outlined,color: Theme.of(context).primaryColor,),
        ),
      ),
      showBackButton: true,
      back:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,),
        ),
      ),
      onDone: (){
        //CashHelper.saveEligibility();
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      dotsFlex: 3,

      dotsDecorator: DotsDecorator(
        color: Theme.of(context).hintColor,
        activeColor: Theme.of(context).primaryColor,

      ),
      showNextButton: true,
      next:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(Icons.arrow_forward_outlined,color: Theme.of(context).primaryColor,),
        ),
      ),

      pages: [
        PageViewModel(
          title: "onboarding_title1".tr(),
          body:'onboarding_body1'.tr(),
          image: _buildImage('onboarding1.png'),
          decoration: pageDecoration,
          useScrollView: false
        ),
        PageViewModel(
          title: "onboarding_title2".tr(),
          body:'onboarding_body2'.tr(),
          image: _buildImage('onboarding2.png'),
          decoration: pageDecoration,
            useScrollView: false

        ),
        PageViewModel(
          title: "onboarding_title3".tr(),
          body:'onboarding_body3'.tr(),
          image: _buildImage('onboarding3.png'),
          decoration: pageDecoration,
            useScrollView: false

        ),
      ],

    );
  }
}
