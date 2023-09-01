import 'package:flutter/material.dart';
import 'package:unicode_task/constants.dart';


class FullWidthContainer extends StatelessWidget {
  const FullWidthContainer({
    super.key,
    required this.value, required this.title,
  });

  final String value,title;

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: size.width,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),),
          SizedBox(height: 5,),
          Text(value, style: TextStyle(
            color: kBlue,
            fontSize: 15,
          ),)
        ],
      ),
    );
  }
}




class SmallContainer extends StatelessWidget {
  const SmallContainer({
    super.key, required this.icon, required this.text, required this.press,
  });

  final String text;
  final IconData icon;
  final VoidCallback press;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 65,
        width: 95,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: kBlue,size: 25,),
            SizedBox(height: 3,),
            Text(text,style: TextStyle(
              color: kBlue,
              fontSize: 12
            ),)
          ],
        ),
      ),
    );
  }
}
