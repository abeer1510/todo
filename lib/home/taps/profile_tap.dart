import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          backgroundColor: Color(0xff5669FF),
          toolbarHeight: 150,
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage('assets/images/route.png')),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "profile_name".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    "johnsafwat.route@gmail\n.com",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64),)
          ),),
       body:Padding(
         padding: const EdgeInsets.only(right: 16,left: 16,top: 24),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("language".tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
             Row(
               children: [
                 Expanded(
                   child: Row(
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(16),
                           border: Border.all(color: Theme.of(context).primaryColor)
                         ),
                         child:Text("language".tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),
                       
                       ),
                     ],
                   ),
                 ),
               ],
             ),
             Text("theme".tr(),style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700)),

           ],
         ),
       ) ,
    );
  }
}
