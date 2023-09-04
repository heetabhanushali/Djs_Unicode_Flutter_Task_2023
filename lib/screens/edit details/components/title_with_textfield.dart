import 'package:flutter/material.dart';
import 'package:unicode_task/constants.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.controllername, required this.title, required this.hint,
  });

  final TextEditingController controllername;
  final String title,hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('   '+title,style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 3,),


        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kSecondaryColor,
            border: Border.all(
              color: kThirdColor.withOpacity(0.4),
              width: 1,
            )
          ),
          child: TextField(
            controller: controllername,
            style: TextStyle(
              color: Colors.white
            ),
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: kThirdColor.withOpacity(0.7)
              )
            ),
          )
           
        ),
      ],
    );
  }
}