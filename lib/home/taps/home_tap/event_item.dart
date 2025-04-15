import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase/firebase_manager.dart';
import 'package:todo/model/taskmodel.dart';

class EventItem extends StatelessWidget {
 TaskModel model;
  EventItem({super.key,required this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        child: Container(
          height: 260,
          child: Stack(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                 ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                     child: Image(image: AssetImage("assets/images/${model.Category}.png"),fit: BoxFit.fill,height: double.infinity,)),
                  Padding(padding: const EdgeInsets.only(bottom:  8),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("${model.title}",style: Theme.of(context).textTheme.titleSmall,)),
                          Icon(Icons.edit),
                          InkWell(onTap: () => FirebaseManager.deleteData(model.id),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(Icons.delete),
                            ),
                          ),
                          ImageIcon(AssetImage("assets/images/love.png"),color: Theme.of(context).primaryColor,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 8,left: 8),
                padding: EdgeInsets.all(8),
                //padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text('${formatDateTime(model.date).split(",")[0].substring(8,10)}\n'
                    '${formatDateTime(model.date).split(",")[1].trim().substring(0,3)}',textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),),
                
              )
            ],
          ),
        ),
      ),
    );
  }
 String formatDateTime(int milliseconds) {
   // Create a DateTime from milliseconds since epoch
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

   // Create a DateFormat to format the DateTime object
   DateFormat formatter = DateFormat('yyyy-MM-dd, EEE, MMMM','en_US');

   // Format the DateTime object to a string using the formatter
   String formattedDate = formatter.format(dateTime);

   return formattedDate;
 }
}
