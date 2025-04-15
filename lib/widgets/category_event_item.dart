import 'package:flutter/material.dart';

class CategoryEventItem extends StatelessWidget {
  String text;
  bool isSelected;

   CategoryEventItem({required this.isSelected,required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Theme.of(context).primaryColor,),
            color: isSelected?Theme.of(context).primaryColor:Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text,style: Theme.of(context).textTheme.titleMedium!
              .copyWith(color: isSelected?Colors.white:Theme.of(context).primaryColor),),
        ));
  }
}
