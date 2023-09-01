import 'package:flutter/material.dart';
import 'package:unicode_task/constants.dart';
import 'package:unicode_task/screens/weather/data_service.dart';
import 'package:unicode_task/screens/weather/models.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(left:10,right: 10,top:50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            //BACK TO HOME
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
            SizedBox(height: 30,),


            // TEXT FIELD AND SEARCH
            SizedBox(
              height: 150, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: kThirdColor.withOpacity(0.5),
                        width: 1
                      )
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      controller: _cityTextController,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter A City Name',
                        hintStyle: TextStyle(
                          color: kThirdColor.withOpacity(0.5)
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      backgroundColor: kBlue,
                      foregroundColor: Colors.white
                    ),
                    onPressed: _search, 
                    child: Text('Search',style: TextStyle(
                      fontSize: 15
                    ),)
                  )
                ],
              ),
            ),
            SizedBox(height: 50,),


            if(_response != null)
              Column(
                children: [

                  //CITY NAME
                  Text('${_response?.cityName.toUpperCase()}', 
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: kwhite
                    ),
                  ),
                  SizedBox(height: 10,),

                  //DESCRIPTION
                  Text('${_response?.weatherInfo.description.toUpperCase()}',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w200
                    ),
                  ),

                  //IMAGE
                  Image.network('${_response?.iconUrl}',
                    color: kwhite,
                    height: 130,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  
                  Text('${_response?.tempInfo.temperature}°',
                    style: TextStyle(
                      color: kwhite,
                      fontSize: 70,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15,),


                  //MAX,MIN,HUMID,PRESSURE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('max',style: TextStyle(
                            color: kThirdColor
                          ),),
                          SizedBox(height: 10,),
                          Text('${_response?.tempInfo.max_temp}°',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Container(width: 2, height: 30,color: kThirdColor.withOpacity(0.7),),
                      SizedBox(width: 15,),
                      Column(
                        children: [
                          Text('min',style: TextStyle(
                            color: kThirdColor
                          ),),
                          SizedBox(height: 10,),
                          Text('${_response?.tempInfo.min_temp}°',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Container(width: 2, height: 30,color: kThirdColor.withOpacity(0.7),),
                      SizedBox(width: 15,),


                      Column(
                        children: [
                          Text('humidity',style: TextStyle(
                            color: kThirdColor
                          ),),
                          SizedBox(height: 10,),
                          Text('${_response?.tempInfo.humidity}%',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 15,),
                      Container(width: 2, height: 30,color: kThirdColor.withOpacity(0.7),),
                      SizedBox(width: 15,),



                      Column(
                        children: [
                          Text('pressure',style: TextStyle(
                            color: kThirdColor
                          ),),
                          SizedBox(height: 10,),
                          Text('${_response?.tempInfo.pressure} hPa',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 20,),
                  
                  
                  
                ],
              ),
              
          ],
        ),
      ),
    );
  }


  Future<void> _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(()=> _response = response);
  }
}