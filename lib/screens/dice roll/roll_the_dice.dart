import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unicode_task/constants.dart';

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  var ActiveDiceImage1 = 'assets/dice-images/dice-6.png';
  var ActiveDiceImage2 = 'assets/dice-images/dice-6.png';


  void ChangeDice() {
    var dicenum1 = Random().nextInt(6)+1;
    var dicenum2 = Random().nextInt(6)+1;
    ActiveDiceImage1 = 'assets/dice-images/dice-$dicenum1.png';
    ActiveDiceImage2 = 'assets/dice-images/dice-$dicenum2.png';
    setState(() { 
      ActiveDiceImage1 = 'assets/dice-images/dice-$dicenum1.png';
    ActiveDiceImage2 = 'assets/dice-images/dice-$dicenum2.png';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left:10,right: 10,top:50 ),
        child: Stack(
          children: [


            TextButton.icon(
              onPressed: (){
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero
              ),
              icon: Icon(Icons.arrow_back_ios_new , color: kBlue,),
              label: Text('Home',style: TextStyle(
                fontSize: 18,
                color: kBlue
              ),),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(ActiveDiceImage1, width: 125,),
                    Image.asset(ActiveDiceImage2, width: 125,)
                  ],
                ),
                SizedBox(height: 40,),

                //ROLL DICE BUTTON
                FilledButton(
                  onPressed: (){
                    ChangeDice();
                  },

                  style: TextButton.styleFrom(
                    backgroundColor: kBlue,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)
                  ),
                  child: Text('Roll Dice',style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),),
                )
              ],
            )



          ],
        ),
      ),
    );
  }
}