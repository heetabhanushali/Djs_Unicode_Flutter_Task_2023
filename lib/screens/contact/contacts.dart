import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:unicode_task/constants.dart';
import 'package:unicode_task/screens/contact%20details/contactdetails.dart';

class MyContacts extends StatefulWidget {
  const MyContacts({super.key});

  @override
  State<MyContacts> createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {
  List<Contact> contacts = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetPhoneData();
  }

  Future<void> GetPhoneData() async {
    if(await FlutterContacts.requestPermission()){
      contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: true
      );
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left:10,right: 10,top:50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //BACK TO HOME BUTTON
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
            SizedBox(height: 12,),

            //CONTACTS TEXT
            Text('Contacts',style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700
            ),),
            
            Expanded(
              child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ContactDetails(contact: contacts[index]),
                        ),);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: kThirdColor.withOpacity(0.5)
                                )
                              )
                            ),
                            child: Text (contacts[index].displayName , style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                        );
                
                      }
                    ),
            ),
          ],
        ),
      ),
    );
  }
}