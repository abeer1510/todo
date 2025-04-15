class TaskModel{
  String id;
  String title;
  int date;
  String time;
  String description;
  bool isDone;
  String Category;
  String location;
 TaskModel({
   required this.time,
    this.id="",
   required this.title,
   required this.description,
   required this.date,
   required this.Category,
    this.isDone=false,
    this.location="",

 });
  TaskModel.fromJson(Map<String,dynamic>json):this(
    time:json ["time"],
    id:json ["id"],
    Category: json ["Category"],
    date: json ["date"],
    description: json ["description"],
    isDone:json ["isDone"] ,
    location: json ["location"],
    title: json ["title"],

  );
  Map<String,dynamic>toJson(){
    return{
      "time":time,
      "id":id,
      "Category":Category,
      "date":date,
      "description":description,
      "isDone":isDone,
      "location":location,
      "title":title,
    };
  }
  }