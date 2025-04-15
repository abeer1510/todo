
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase/firebase_manager.dart';
import 'package:todo/model/taskmodel.dart';
import 'package:todo/providers/creat_event_provider.dart';
import 'package:todo/widgets/category_event_item.dart';

class CreatEvent extends StatelessWidget {
  static const String routeName = 'CreatEvent';

   CreatEvent({super.key});
 var titleController=TextEditingController();
  var descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CreatEventProvider(),
      builder: (context,child){
        var provider =Provider.of<CreatEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Create Event',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(image: AssetImage("assets/images/${provider.eventCategories[provider.selectedCategory]}.png"))),
                  SizedBox(height: 16,),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>SizedBox(width: 16,),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            provider.chanageCategory(index);
                          },
                          child:CategoryEventItem(isSelected: provider.selectedCategory==index, text: provider.eventCategories[index]),
                        );
                      },itemCount: provider.eventCategories.length,),
                  ),
                  SizedBox(height: 16,),
                  Row(mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text("Title",style:Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 16),
                    child: TextField(
                      controller: titleController,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).hintColor),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.edit_note_rounded,size: 30,
                          color: Theme.of(context).hintColor,
                        ),
                        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text("Description",style:Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 16),
                    child: TextField(
                      controller: descriptionController,
                      maxLines: 4,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).hintColor),
                      decoration: InputDecoration(
                        labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                    Icon(Icons.calendar_month),
                    Text("    Event Date",style:Theme.of(context).textTheme.titleSmall,),Spacer(),
                    InkWell(
                      onTap: ()async{
                        var date=await showDatePicker(context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now().add(Duration(days: 365)));
                        if(date!=null){
                          provider.onDateChanaged(date);
                        }
                      },
                        child: Text("${provider.selectedDate.toString().substring(0,10)}",style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColor),)),
                    ],),
                  Padding(
                    padding: const EdgeInsets.only(top: 16,bottom: 16),
                    child: Row(
                      children: [
                        Icon(Icons.access_time),
                        Text("    Event Time",style:Theme.of(context).textTheme.titleSmall,),Spacer(),
                        InkWell(
                          onTap: ()async{
                           var time=await showTimePicker(context: context,
                                initialTime: TimeOfDay.now());

                           if(time!=null){
                             provider.onChanageTime(time);
                           }
                          },
                            child: Text("${provider.selectedTime.format(context)}",style:Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).primaryColor),)),
                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16 ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton (onPressed: ()async{
                            showDialog(context: context, builder: (context) {
                              return Center(child: CircularProgressIndicator(
                                color: Theme.of(context).primaryColor,
                              ));
                            },);
                            TaskModel model=TaskModel( title: titleController.text,
                                description: descriptionController.text,
                                date: provider.selectedDate.millisecondsSinceEpoch,
                                Category: provider.selectedCatogryName,
                                time: provider.selectedTime != null
                                    ? provider.selectedTime!.format(context)
                                    : "");
                            await Future.delayed(Duration(seconds: 3));
                            FirebaseManager.addEvent(model);
                            Navigator.pop(context);
                            Navigator.pop(context);

                          },
                            child: Text("Add Event",
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Color(0xffffffff)),),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff5669FF),
                              padding: EdgeInsets.symmetric( vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),),),],),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
