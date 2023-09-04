import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicode_task/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicode_task/screens/home/components/containers.dart';
import 'package:url_launcher/url_launcher_string.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var name='N/A',mail='N/A',phone='N/A',birth='N/A',location='N/A',notes='N/A';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadValue();
  }


  Future<void> loadValue() async {
    var prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString('name');
    var getmail = prefs.getString('mail');
    var getnumber = prefs.getString('phone');
    var getdate = prefs.getString('birth');
    var getlocation = prefs.getString('location');
    var getnote = prefs.getString('notes');

    name=(getname !="" ? getname: "N/A")!;
    mail=(getmail!=""? getmail: "N/A")!;
    phone=(getnumber!=""? getnumber: "N/A")!;
    birth=(getdate!=""? getdate: "N/A")!;
    location=(getlocation!=""? getlocation: "N/A")!;
    notes=(getnote!=""? getnote: "N/A")!;
    setState(() {});
  }


  LaunchURL(String url) async {
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }
    else{
      throw 'could not launch url $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left:10,right: 10,top:50 ),
        child: Stack(
          children: [
            //EDIT TEXT 
            Positioned(
              right: 0,
              child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'edit');
                }, 
                child: Text('Edit',style: TextStyle(
                  color: kBlue,
                  fontSize: 18,
                ),)
              ),
            ),
      
            Positioned(
              top: 30,
              right: 0,
              left: 0,
              child:Column(
                children: [

                  //MEMOJI
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: kBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(name.substring(0,1).toUpperCase(), style: TextStyle(
                        color: kwhite,
                        fontSize: 44,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                    ),
                    SizedBox(height: 10,),

                    //NAME DISPLAY
                    Text(name,style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w500
                    ),),
                    SizedBox(height: 30,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallContainer(text: 'contacts', icon: FontAwesomeIcons.solidAddressBook, 
                          press: () { Navigator.pushNamed(context, 'contact'); },),

                        SmallContainer(text: 'weather', icon: FontAwesomeIcons.cloudBolt, 
                          press: () { Navigator.pushNamed(context, 'weather'); },),

                        SmallContainer(text: 'roll a dice', icon: FontAwesomeIcons.dice, 
                          press: () { Navigator.pushNamed(context, 'dice');},),

                        SmallContainer(text: 'surprise', icon: FontAwesomeIcons.solidFaceSurprise, 
                          press: () { ;
                            launchUrlString('https://youtu.be/dQw4w9WgXcQ?feature=shared');
                          },),
                      ],
                    ),
                    SizedBox(height: 15,),

                    FullWidthContainer(title: 'mobile',value: phone),
                    SizedBox(height: 15,),
                    FullWidthContainer(title: 'email',value: mail),
                    SizedBox(height: 15,),
                    FullWidthContainer(title: 'birth date',value: birth),
                    SizedBox(height: 15,),
                    FullWidthContainer(title: 'location',value: location),
                    SizedBox(height: 15,),
                    FullWidthContainer(title: 'notes',value: notes),

                    
                ],
              ),
              ),
          ],
        )
        ),
    );
  }
}

