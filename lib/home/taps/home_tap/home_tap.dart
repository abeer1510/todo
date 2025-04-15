import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_manager.dart';
import 'package:todo/home/taps/home_tap/event_item.dart';
import 'package:todo/model/taskmodel.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: SizedBox(),
        backgroundColor: Theme.of(context).cardColor,
        toolbarHeight: 70,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [

                      Text(
                        "welcome".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),

                      Text(
                        "profile_name".tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white, fontSize: 24),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "lang".tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 14),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],

        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
        ),
        bottom: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))
          ),
          leading: SizedBox(),
            leadingWidth: 0,
            toolbarHeight: 120,
            backgroundColor:Theme.of(context).cardColor,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/map.png"),
                      color: Colors.white,
                    ),
                    Text(
                      "location".tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  color: Colors.cyanAccent,
                )
              ],
            ),

        ),
      ),
      body: StreamBuilder<QuerySnapshot<TaskModel>>(
        stream:FirebaseManager.getData() ,
        builder: (context, snapshot) {
          return ListView.builder(itemBuilder: (context,index){
            return EventItem(model: snapshot.data!.docs[index].data(),);
          },itemCount:  snapshot.data?.docs.length??0,);
        },
      ),
    );
  }
}
