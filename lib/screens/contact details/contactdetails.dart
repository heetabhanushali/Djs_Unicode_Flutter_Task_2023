import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicode_task/constants.dart';
import 'package:unicode_task/screens/home/components/containers.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key, required this.contact,});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final Uint8List? image = contact.photo;
    final String firstletter = (contact.name.first.substring(0,1).toUpperCase());
    final String number = (contact.phones.isNotEmpty)? contact.phones.first.number : " ";
    final String mail = (contact.emails.isNotEmpty)? contact.emails.first.address : " ";
    final String note = (contact.notes.isNotEmpty)? contact.notes.first.note : " ";

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left:10,right: 10,top:50),
        child: Stack(
          children: [

            //BACK TO CONTACTS
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                    ),
                    icon: Icon(Icons.arrow_back_ios_new , color: kBlue,),
                    label: Text('Contacts',style: TextStyle(
                      fontSize: 18,
                      color: kBlue
                    ),),
                  ),


                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.ios_share , color: kBlue, size: 27,)
                  )
                ],
              ),
            ),


            Positioned(
              top: 30,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: (image != null)? CircleAvatar( backgroundImage: MemoryImage(image),): CircleAvatar(backgroundColor: kThirdColor, child: Text(firstletter, style: TextStyle(color: kwhite , fontSize: 50, fontWeight: FontWeight.w500),)),
                  ),
            
                  SizedBox(height: 15,),
            
            
                  Text(contact.displayName,style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallContainer(
                        icon: EvaIcons.messageCircle, 
                        text: 'message', 
                        press: (){}),
                        
                        SmallContainer(
                        icon: EvaIcons.phone, 
                        text: 'call', 
                        press: (){}),

                        SmallContainer(
                        icon: FontAwesomeIcons.video, 
                        text: 'video', 
                        press: (){}),

                        SmallContainer(
                        icon: FontAwesomeIcons.solidEnvelope, 
                        text: 'mail', 
                        press: (){}),
                    ],  
                  ),
                  SizedBox(height: 15,),


                  FullWidthContainer(
                    value: number, 
                    title: 'mobile'
                  ),
                  SizedBox(height: 15,),

                  FullWidthContainer(
                    value: mail, 
                    title: 'email'
                  ),
                  SizedBox(height: 15,),

                  FullWidthContainer(
                    value: note, 
                    title: 'notes'
                  ),
                  SizedBox(height: 15,),

                  TextButton(
                    onPressed: (){}, 
                    child: Text('Delete Contact',style: TextStyle(
                      color: Colors.red,
                      fontSize: 17
                    ),)
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}