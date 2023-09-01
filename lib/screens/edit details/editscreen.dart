import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicode_task/constants.dart';
import 'package:unicode_task/screens/edit%20details/components/title_with_textfield.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({super.key});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Padding(
        padding: EdgeInsets.only(left:10,right: 10,top: 50 ),
        child: Stack(
          children: [

            //BACK HOME
            Positioned(
              left: 0,
              child: TextButton.icon(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
                label: Text('Home',style: TextStyle(
                  fontSize: 18,
                ),),
              ),
            ),


            //SAVE BUTTON
            Positioned(
              right: 0,
              child: TextButton(
                onPressed:() async {
            
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setString('name', nameController.text.toString());
                  prefs.setString('mail', mailController.text.toString());
                  prefs.setString('phone', numberController.text.toString());
                  prefs.setString('birth', dateController.text.toString());
                  prefs.setString('location', locationController.text.toString());
                  prefs.setString('notes', notesController.text.toString());
                          
                  Navigator.pushNamed(context,'home');
                },
                child: Text('Save',style: TextStyle(
                  color: kBlue,
                  fontSize: 18,
                ),)
              ),
            ),


            Positioned(
              top: 30,
              right: 0,
              left: 0,
              child: Column(
                children: [

                  //MEMOJI
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.account_circle , size: 140, color: kThirdColor,),
                  ),
            
                  
                  //CLEAR BUTTON
                  TextButton(
                    onPressed: (){
                      nameController.clear();
                      mailController.clear();
                      numberController.clear();
                      dateController.clear();
                      locationController.clear();
                      notesController.clear();
                    }, 
                    child: Text('Clear',style: TextStyle(
                      color: kBlue,
                      fontSize: 15
                    ),),
                    style: TextButton.styleFrom(
                      fixedSize: Size.fromHeight(10)
                    )
                  ),
                  SizedBox(height: 30,),

                  TitleTextField(controllername: nameController, title: 'Name', hint: 'Your Name',),
                  SizedBox(height: 20,),
                  TitleTextField(controllername: mailController, title: 'Email', hint: 'xyz@gmail.com',),
                  SizedBox(height: 20,),
                  TitleTextField(controllername: numberController, title: 'Phone Number', hint: '1234567890',),
                  SizedBox(height: 20,),
                  TitleTextField(controllername: dateController, title: 'Birth Date', hint: 'dd/mm/yyyy',),
                  SizedBox(height: 20,),
                  TitleTextField(controllername: locationController, title: 'Location', hint: 'eg: Mumbai',),
                  SizedBox(height: 20,),
                  TitleTextField(controllername: notesController, title: 'Note', hint: 'Notes',),
                  SizedBox(height: 20,),

                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
